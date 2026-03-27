# 共有プラットフォーム ターゲットアーキテクチャ

> 生成日: 2026-03-28 | ステータス: draft | 正本: YAML artifact 群

## 概要

本共有プラットフォームは、EKS + Lambda のハイブリッドランタイム、GitHub Actions + ArgoCD による CI/CD パイプライン、AMP + AMG によるオブザーバビリティスタックを柱とした内部開発者プラットフォームである。CCoE がプラットフォームを一元管理し、テナント（プロダクトチーム）がセルフサービスでワークロードをデプロイできる環境を提供する。

### 主要設計方針

- **マネージドサービス優先**: 運用負荷を最小化（EKS / AMP / AMG）
- **GitOps ベースのデリバリー**: ArgoCD による宣言的デプロイで環境の再現性を担保
- **テナント分離**: Namespace / RBAC / NetworkPolicy / ResourceQuota による論理分離
- **OpenTelemetry 標準**: ADOT Collector で計装を統一

---

## プラットフォーム全体構成図

```mermaid
graph TD
  subgraph platform["共有プラットフォーム（AWS shared-services）"]
    subgraph runtime["共有ランタイム"]
      eks["EKS クラスタ<br/>本番/STG/DEV"]
      lambda["Lambda<br/>イベント駆動処理"]
      karpenter["Karpenter<br/>オートスケーリング"]
    end

    subgraph observability["オブザーバビリティ"]
      amp["AMP<br/>メトリクス収集"]
      amg["AMG<br/>ダッシュボード"]
      adot["ADOT Collector<br/>テレメトリ収集"]
      cwl["CloudWatch Logs<br/>ログ集約"]
      xray["X-Ray<br/>分散トレース"]
    end

    subgraph delivery["デリバリーパイプライン"]
      gha["GitHub Actions<br/>CI"]
      argocd["ArgoCD<br/>CD / GitOps"]
    end

    subgraph supporting["サポートサービス"]
      ecr["ECR<br/>コンテナレジストリ"]
      sm["Secrets Manager<br/>+ ESO"]
      acm["ACM<br/>証明書管理"]
    end
  end

  subgraph tenants["テナント（BU/チーム）"]
    ns1["Namespace: team-a"]
    ns2["Namespace: team-b"]
    ns3["Namespace: team-c"]
  end

  tenants --> eks
  eks --> karpenter
  adot --> amp
  adot --> xray
  adot --> cwl
  amp --> amg
  gha --> ecr
  gha --> argocd
  argocd --> eks
  eks --> sm
```

---

## CI/CD パイプラインフロー図

```mermaid
graph LR
  dev["開発者<br/>git push"] --> gh["GitHub<br/>リポジトリ"]
  gh --> ci["GitHub Actions CI"]
  ci --> build["コードビルド"]
  build --> test["ユニットテスト"]
  test --> scan["イメージスキャン<br/>Trivy"]
  scan --> push["ECR プッシュ<br/>OIDC 認証"]
  push --> manifest["マニフェスト更新<br/>イメージタグ"]
  manifest --> argocd["ArgoCD<br/>差分検出"]

  subgraph syncPolicy["Sync ポリシー"]
    devSync["DEV: 自動同期"]
    stgSync["STG: 手動同期"]
    prodSync["PROD: PR承認<br/>+ 手動同期"]
  end

  argocd --> syncPolicy
  syncPolicy --> eksCluster["EKS クラスタ<br/>デプロイ完了"]
```

---

## オブザーバビリティスタック図

```mermaid
graph TD
  subgraph sources["データソース"]
    pod["EKS Pod"]
    node["EKS Node"]
    app["アプリケーション SDK"]
    container["コンテナ stdout/stderr"]
  end

  subgraph collection["収集レイヤー"]
    adot["ADOT Collector<br/>DaemonSet"]
    fluentbit["Fluent Bit<br/>DaemonSet"]
  end

  subgraph storage["ストレージ"]
    amp["AMP<br/>メトリクス 150日"]
    xray["X-Ray<br/>トレース"]
    cwl["CloudWatch Logs<br/>ログ 90日"]
  end

  subgraph viz["可視化"]
    amg["AMG<br/>Entra ID SSO"]
  end

  pod --> adot
  node --> adot
  app --> adot
  container --> fluentbit

  adot -->|Prometheus Remote Write| amp
  adot -->|OTLP| xray
  fluentbit --> cwl

  amp --> amg
  xray --> amg
  cwl --> amg
```

| レイヤー | ツール | 収集元 | 保存先 |
| --- | --- | --- | --- |
| メトリクス | ADOT Collector (Prometheus) | EKS Pod / Node | AMP（150 日保持） |
| トレース | ADOT Collector (OTLP) | アプリケーション SDK | X-Ray |
| ログ | Fluent Bit (DaemonSet) | コンテナ stdout/stderr | CloudWatch Logs（90 日保持） |
| ダッシュボード | AMG (Grafana) | AMP / CloudWatch / X-Ray | - |

---

## クラウド別デプロイメント図

```mermaid
graph TD
  subgraph aws["AWS（ap-northeast-1）"]
    subgraph sharedSvc["shared-services アカウント"]
      eksCluster["EKS クラスタ ×3<br/>本番/STG/DEV"]
      ampWs["AMP ワークスペース"]
      amgWs["AMG ワークスペース"]
      ecrRepo["ECR リポジトリ"]
      smStore["Secrets Manager"]
      acmCert["ACM 証明書"]
    end

    subgraph lambdaEnv["Lambda 環境"]
      lambdaFn["Lambda 関数群<br/>VPC 内配置"]
    end

    subgraph cicd["CI/CD"]
      oidcProvider["OIDC Provider<br/>GitHub Actions"]
      argoCDDeploy["ArgoCD<br/>EKS 上 HA モード"]
    end
  end

  subgraph azure["Azure（IdP）"]
    entraSSO["Entra ID<br/>AMG SAML SSO"]
  end

  subgraph github["GitHub"]
    ghaRunner["GitHub Actions<br/>Hosted Runner"]
    gitRepo["Git リポジトリ"]
  end

  ghaRunner -->|OIDC| oidcProvider
  ghaRunner --> ecrRepo
  gitRepo --> argoCDDeploy
  argoCDDeploy --> eksCluster
  entraSSO -->|SAML| amgWs
  eksCluster --> ampWs
  eksCluster --> smStore
```

---

## テナントオンボーディングフロー

```mermaid
sequenceDiagram
  participant Team as テナントチーム
  participant PR as Git PR
  participant CCoE as CCoE レビュー
  participant ArgoCD as ArgoCD
  participant EKS as EKS クラスタ

  Team->>PR: テナント定義 YAML を PR 作成
  PR->>CCoE: レビュー・承認
  CCoE->>PR: マージ
  PR->>ArgoCD: 変更検出
  ArgoCD->>EKS: 自動プロビジョニング
  Note over EKS: Namespace 作成<br/>ResourceQuota 適用<br/>NetworkPolicy 適用<br/>RBAC RoleBinding<br/>ArgoCD AppProject

  Team->>Team: GitHub ワークフロー追加
  Team->>ArgoCD: Application CRD 作成
  Team->>EKS: デプロイ開始
```

---

## サービスカタログサマリー

| サービス | AWS サービス | 必須/任意 | 提供モデル |
| --- | --- | --- | --- |
| EKS 共有ランタイム | EKS 1.30+ / マネージドノード / Karpenter | **必須** | セルフサービス |
| Lambda ランタイム | Lambda（VPC 内） | **必須** | セルフサービス |
| 統合オブザーバビリティ | AMP + AMG + CloudWatch Logs + X-Ray | **必須** | セルフサービス |
| CI/CD パイプライン | GitHub Actions + ArgoCD | **必須** | セルフサービス |
| アーティファクトレジストリ | ECR（Enhanced Scanning） | 任意 | セルフサービス |
| シークレット管理 | Secrets Manager + ESO | 任意 | セルフサービス |
| テナントオンボーディング | Namespace テンプレート + ArgoCD AppProject | 任意 | 申請ベース |

---

## 設計判断一覧

| ID | タイトル | 選択 |
| --- | --- | --- |
| shared-platform-decision-hybrid-runtime | 共有ランタイム構成 | EKS + Lambda ハイブリッド |
| shared-platform-decision-gitops | CD 戦略 | ArgoCD（GitOps） |

---

*本ドキュメントは YAML 正本からの派生生成物です。内容の変更は YAML 側で行い、再生成してください。*
