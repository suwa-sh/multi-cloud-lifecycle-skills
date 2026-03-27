# プロダクト ターゲットアーキテクチャ — BigQuery データ分析基盤

> 生成日: 2026-03-28 | ステータス: draft | 正本: YAML artifact 群

## 概要

本プロダクトは、全社データ分析基盤として GCP BigQuery を中核に据えたデータウェアハウスである。AWS 上の業務システム（RDS/Aurora、S3、CloudWatch）および SaaS（GA4、Google Ads、Slack、Sentry）からデータを集約し、dbt による 4 層変換パイプライン（raw → staging → intermediate → mart）を経て、Looker Studio / AMG / BigQuery ML によるデータ提供を実現する。

### 主要設計方針

- **BigQuery ファースト**: 分析ワークロードは GCP BigQuery に集約し、サーバレスでスケーラブルなクエリ基盤を活用
- **dbt によるデータ変換**: ELT パターンを採用し、データ変換ロジックを SQL + dbt で版管理・テスト可能にする
- **マルチクラウドデータ連携**: AWS の業務データを Cloud Storage 経由でリレーし、SaaS はネイティブ連携・Webhook で取り込む
- **カラムレベルセキュリティ**: Data Catalog ポリシータグと BigQuery データマスキングで PII を保護

---

## ワークロード全体構成図

```mermaid
graph TD
  subgraph sources["データソース"]
    subgraph aws_sources["AWS 業務システム"]
      rds["RDS/Aurora<br/>業務 DB"]
      s3["S3<br/>ファイルエクスポート"]
      cw["CloudWatch<br/>運用メトリクス"]
    end
    subgraph saas_sources["SaaS"]
      ga4["GA4<br/>Web アクセスログ"]
      ads["Google Ads / Facebook Ads<br/>広告データ"]
      slack["Slack<br/>コミュニケーションログ"]
      sentry["Sentry<br/>エラートラッキング"]
    end
  end

  subgraph ingestion["データ取り込み層（GCP）"]
    gcs["Cloud Storage<br/>AWS リレーバケット"]
    dts["Data Transfer Service<br/>広告プラットフォーム"]
    cf["Cloud Functions<br/>Webhook 取り込み"]
    scheduler["Cloud Scheduler<br/>ロードジョブトリガー"]
  end

  subgraph transform["データ変換層（BigQuery + dbt）"]
    raw["BigQuery: raw<br/>生データ（90日保持）"]
    stg["BigQuery: staging<br/>クレンジング済み"]
    int["BigQuery: intermediate<br/>結合・集計"]
    mart["BigQuery: mart_*<br/>BU 別マート"]
    dbt["dbt<br/>Cloud Run Job"]
  end

  subgraph serving["データ提供層"]
    looker["Looker Studio<br/>BI ダッシュボード"]
    amg["AMG<br/>運用ダッシュボード"]
    bqml["BigQuery ML<br/>機械学習推論"]
  end

  rds --> s3
  s3 --> gcs
  cw --> gcs
  ga4 -->|ネイティブ連携| raw
  ads --> dts
  slack --> cf
  sentry --> cf
  gcs --> raw
  dts --> raw
  cf --> raw
  scheduler --> gcs
  scheduler --> dbt
  raw --> stg
  stg --> int
  int --> mart
  dbt --> stg
  dbt --> int
  dbt --> mart
  mart --> looker
  mart --> amg
  mart --> bqml
```

---

## データパイプラインフロー図

```mermaid
sequenceDiagram
  participant RDS as AWS RDS/Aurora
  participant S3 as AWS S3
  participant GCS as Cloud Storage
  participant BQ_RAW as BigQuery raw
  participant GA4 as GA4
  participant DBT as dbt (Cloud Run Job)
  participant BQ_STG as BigQuery staging
  participant BQ_INT as BigQuery intermediate
  participant BQ_MART as BigQuery mart
  participant LOOKER as Looker Studio

  Note over RDS,S3: 日次バッチエクスポート
  RDS->>S3: データエクスポート（CSV/Parquet）
  S3->>GCS: Storage Transfer Service
  GCS->>BQ_RAW: BigQuery Load Job

  Note over GA4,BQ_RAW: ネイティブ BigQuery 連携
  GA4->>BQ_RAW: 日次エクスポート（自動）

  Note over DBT,BQ_MART: dbt 日次変換パイプライン
  DBT->>BQ_STG: stg_* モデル実行（クレンジング・型変換）
  DBT->>BQ_INT: int_* モデル実行（結合・集計）
  DBT->>BQ_MART: mart_* モデル実行（BU 別マート生成）

  Note over LOOKER,BQ_MART: データ提供
  LOOKER->>BQ_MART: SQL クエリ（Authorized Views 経由）
```

---

## dbt モデル構成図

```mermaid
graph LR
  subgraph raw_layer["raw（生データ）"]
    raw_rds["rds_export_*"]
    raw_ga4["ga4_events_*"]
    raw_ads["ads_*"]
    raw_slack["slack_events"]
    raw_sentry["sentry_events"]
  end

  subgraph staging_layer["staging（stg_*）"]
    stg_orders["stg_orders"]
    stg_customers["stg_customers"]
    stg_ga4["stg_ga4_events"]
    stg_ads["stg_ads_performance"]
    stg_slack["stg_slack_messages"]

    dq_stg["データ品質テスト<br/>not_null / unique / accepted_values"]
  end

  subgraph intermediate_layer["intermediate（int_*）"]
    int_customer_orders["int_customer_orders"]
    int_channel_attribution["int_channel_attribution"]
    int_product_metrics["int_product_metrics"]

    dq_int["データ品質テスト<br/>relationships / expression"]
  end

  subgraph mart_layer["mart（mart_*）"]
    mart_sales["mart_sales.*<br/>売上分析"]
    mart_marketing["mart_marketing.*<br/>マーケティング分析"]
    mart_product["mart_product.*<br/>プロダクト分析"]

    dq_mart["データ品質テスト<br/>row_count / freshness"]
  end

  raw_rds --> stg_orders
  raw_rds --> stg_customers
  raw_ga4 --> stg_ga4
  raw_ads --> stg_ads
  raw_slack --> stg_slack

  stg_orders --> int_customer_orders
  stg_customers --> int_customer_orders
  stg_ga4 --> int_channel_attribution
  stg_ads --> int_channel_attribution
  stg_orders --> int_product_metrics

  int_customer_orders --> mart_sales
  int_channel_attribution --> mart_marketing
  int_product_metrics --> mart_product

  dq_stg -.->|各モデル実行後| staging_layer
  dq_int -.->|各モデル実行後| intermediate_layer
  dq_mart -.->|各モデル実行後| mart_layer
```

---

## クラウド別デプロイメント図

```mermaid
graph TD
  subgraph gcp["GCP（asia-northeast1）"]
    subgraph bq["BigQuery"]
      bq_raw["raw データセット"]
      bq_stg["staging データセット"]
      bq_int["intermediate データセット"]
      bq_mart["mart_* データセット"]
    end

    subgraph gcp_services["GCP サービス"]
      gcs_relay["Cloud Storage<br/>AWS リレーバケット"]
      cf_slack["Cloud Functions<br/>Slack 取り込み"]
      cf_sentry["Cloud Functions<br/>Sentry 取り込み"]
      cs["Cloud Scheduler<br/>ジョブトリガー"]
      dts["Data Transfer Service<br/>広告データ"]
      dc["Data Catalog<br/>PII タクソノミー"]
    end

    subgraph gcp_security["セキュリティ・監査"]
      scc["Security Command Center"]
      audit["Audit Logs"]
    end
  end

  subgraph aws["AWS（ap-northeast-1）"]
    subgraph aws_workloads["業務システム"]
      rds["RDS/Aurora<br/>業務 DB"]
      s3["S3<br/>エクスポートバケット"]
      cloudwatch["CloudWatch<br/>運用メトリクス"]
    end

    subgraph aws_shared["shared-services アカウント"]
      amg_aws["AMG<br/>運用ダッシュボード"]
    end
  end

  subgraph saas["SaaS"]
    ga4_saas["Google Analytics 4"]
    ads_saas["Google Ads /<br/>Facebook Ads"]
    slack_saas["Slack"]
    sentry_saas["Sentry"]
  end

  rds --> s3
  s3 -->|Storage Transfer Service| gcs_relay
  cloudwatch -->|メトリクスエクスポート| gcs_relay
  gcs_relay --> bq_raw

  ga4_saas -->|ネイティブ連携| bq_raw
  ads_saas --> dts
  dts --> bq_raw
  slack_saas -->|Webhook| cf_slack
  sentry_saas -->|Webhook| cf_sentry
  cf_slack --> bq_raw
  cf_sentry --> bq_raw

  cs --> gcs_relay
  bq_raw --> bq_stg
  bq_stg --> bq_int
  bq_int --> bq_mart
  dc -.->|ポリシータグ| bq
  bq_mart --> amg_aws
```

---

## サービスカタログサマリー

| サービス | GCP サービス | 必須/任意 | 用途 |
| --- | --- | --- | --- |
| データウェアハウス | BigQuery（4 データセット構成） | **必須** | 分析データの格納・クエリ |
| データリレー | Cloud Storage（ライフサイクル 30 日） | **必須** | AWS → GCP のデータ中継 |
| 広告データ取り込み | BigQuery Data Transfer Service | **必須** | Google Ads 等の定期転送 |
| Webhook 取り込み | Cloud Functions（2nd Gen） | **必須** | Slack / Sentry データ取り込み |
| ジョブスケジューリング | Cloud Scheduler | **必須** | ロードジョブ・dbt トリガー |
| データ変換 | dbt（Cloud Run Job） | **必須** | ELT パイプライン |
| PII 分類・マスキング | Data Catalog + BigQuery Data Policy | **必須** | カラムレベルセキュリティ |
| BI ダッシュボード | Looker Studio | 任意 | ビジネスユーザー向け可視化 |
| 運用ダッシュボード | AMG（AWS 側） | 任意 | クロスクラウド運用監視 |
| 機械学習 | BigQuery ML | 任意 | SQL ベースの ML 推論 |

---

## コスト最適化サマリー

| 最適化項目 | 施策 | 期待効果 |
| --- | --- | --- |
| BigQuery クエリコスト | オンデマンド → スロット予約（Editions）への移行検討 | クエリコスト 30-50% 削減 |
| raw データセット | テーブル有効期限 90 日で自動削除 | ストレージコスト抑制 |
| GCS リレーバケット | ライフサイクル 30 日で自動削除 | 不要データの蓄積防止 |
| BigQuery ストレージ | Long-term Storage 自動適用（90 日未更新で 50% 割引） | ストレージコスト最大 50% 削減 |
| Cloud Functions | min_instance_count = 0 でコールドスタート許容 | アイドル時のコストゼロ |
| dbt 実行 | Cloud Run Job でジョブ実行中のみ課金 | 常時起動のコスト回避 |

---

## SLI/SLO

| SLI | 測定方法 | SLO |
| --- | --- | --- |
| データ鮮度（raw） | raw テーブルの最新パーティション日時と現在時刻の差分 | 24 時間以内 |
| データ鮮度（mart） | mart テーブルの最新更新日時と現在時刻の差分 | 26 時間以内（raw + dbt 処理時間） |
| dbt 実行成功率 | dbt run の成功回数 / 総実行回数 | 99% / 月 |
| クエリ可用性 | BigQuery API の成功レスポンス率 | 99.9% / 月（BigQuery SLA 準拠） |
| データ品質（dbt test） | dbt test の全テスト通過率 | 100%（ブロッキングテスト） |
| Webhook 取り込みレイテンシ | Cloud Functions の p95 実行時間 | 10 秒以内 |

---

## 設計判断一覧

| ID | タイトル | 選択 |
| --- | --- | --- |
| product-decision-bigquery-dwh | データウェアハウス選定 | GCP BigQuery（サーバレス DWH） |
| product-decision-elt-pattern | データ変換パターン | ELT（dbt による BigQuery 内変換） |
| product-decision-4layer-model | データセット構成 | 4 層モデル（raw / staging / intermediate / mart） |
| product-decision-pii-masking | PII 保護方式 | Data Catalog ポリシータグ + データマスキング |
| product-decision-aws-relay | クロスクラウドデータ連携 | Cloud Storage リレー + Storage Transfer Service |

---

*本ドキュメントは YAML 正本からの派生生成物です。内容の変更は YAML 側で行い、再生成してください。*
