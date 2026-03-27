---
name: mcl-product-design
description: |
  個別プロダクト/ワークロード設計用スキル。AWS / Azure / GCP を対象に、ベンダー中立のワークロードモデル、ベンダー別サービスマッピング、実装仕様、オブザーバビリティ仕様、コスト最適化ヒント、IaC スケルトンを生成する。コンピュート、データベース、メッセージング、ストレージ、キャッシュ、CDN のサービス選定を、可用性、レイテンシ、データ機密性、トラフィックパターン、整合性、復旧目標、コストポスチャに基づいて行う。特定のアプリケーションワークロード、マイクロサービスアーキテクチャ、プロダクトインフラ、ユースケースごとのクラウドサービス選定の設計やレビューに使用すること。1 クラウドのみの言及でも発動する。EC2/App Service/Cloud Run、RDS/Azure SQL/Cloud SQL、SQS/Service Bus/Pub/Sub などのサービス比較もワークロード文脈であればトリガーする。
---

# mcl-product-design

## このスキルの役割

特定のプロダクトやワークロードのインフラを設計するスキル。基盤と共有プラットフォームの制約にワークロード要件を加えて、ワークロードモデル、vendor mapping、オブザーバビリティとコストヒントを含む実装仕様、IaC スケルトンの一式を生成する。

各プロダクト設計は独立しているが、基盤のガードレールと共有プラットフォームのサービスカタログの両方に準拠すること。

## 前提条件

以下の 2 つが必要:
1. Foundation context: `specs/foundation/output/foundation-context.yaml`
2. Shared platform context: `specs/shared-platform/output/shared-platform-context.yaml`

いずれかが欠けている場合は、先に実行すべき上位スキルをユーザーに案内する。

## アーキテクチャ概要

同じ 4 層モデル:

1. **Vendor Sources** — サービス固有のドキュメント
2. **Canonical Model** — ベンダー中立のワークロードモデル
3. **Vendor Mapping** — クラウドごとのサービス選定
4. **Implementation Artifacts** — 実装仕様、オブザーバビリティ、コストヒント、IaC

## Canonical Model のスコープ（ワークロード特性）

- **workload_type** — Web アプリ、API、バッチ、イベント駆動、データパイプライン、ML 推論 等
- **availability_target** — SLA ティア、冗長モデル、フェイルオーバー戦略
- **latency_sensitivity** — 応答時間要件、リージョン配置
- **data_sensitivity** — 分類レベル、暗号化要件、データ所在地制約
- **traffic_pattern** — 定常、スパイク、スケジュール、イベント駆動、季節変動
- **consistency_needs** — 強整合性、結果整合性、read-after-write、因果整合性
- **recovery_target** — RPO、RTO、バックアップ戦略、DR モデル
- **observability_needs** — メトリクス、ログ、トレース、SLI/SLO、アラート要件
- **cost_posture** — コスト最適化、パフォーマンス最適化、バランス型、スポット/プリエンプティブル許容度

## ベンダー別マッピング対象

| Canonical 概念 | AWS | Azure | GCP |
| --- | --- | --- | --- |
| コンピュート | EC2, ECS, Lambda, App Runner | App Service, Container Apps, Functions | Cloud Run, Compute Engine, Cloud Functions |
| DB（リレーショナル） | RDS, Aurora | Azure SQL, PostgreSQL Flexible | Cloud SQL, AlloyDB |
| DB（NoSQL） | DynamoDB | Cosmos DB | Firestore, Bigtable |
| メッセージング | SQS, SNS, EventBridge | Service Bus, Event Grid | Pub/Sub, Eventarc |
| オブジェクトストレージ | S3 | Blob Storage | Cloud Storage |
| キャッシュ | ElastiCache | Azure Cache for Redis | Memorystore |
| CDN | CloudFront | Front Door | Cloud CDN |

## ワークフロー

### Step 1: 上位コンテキストの読み込み

以下の両方を読み込む:
- `specs/foundation/output/foundation-context.yaml`
- `specs/shared-platform/output/shared-platform-context.yaml`

適用されるガードレールと利用可能な共有サービス（必須/任意）を把握する。

### Step 2: ワークロード入力の収集

`specs/product/input/` に入力ファイルがあればそこから取得する。無い場合は以下の項目を段階的にヒアリングする。各項目は必ず選択肢を提示し、ユーザーに選んでもらうこと（`../mcl-common/SKILL.md` のユーザーヒアリングポリシー参照）。

#### ヒアリング 1: ワークロードタイプと可用性

**Q1. ワークロードタイプ**

| # | 選択肢 |
| --- | --- |
| 1 | Web アプリ / API ★推奨（最も一般的） |
| 2 | バッチ処理 / データパイプライン |
| 3 | イベント駆動 / メッセージ処理 |
| 4 | ML 推論 / AI サービス |
| 5 | その他（説明を入力してください） |

**Q2. 可用性ターゲット**

| # | 選択肢 | ダウンタイム/年 |
| --- | --- | --- |
| 1 | 99%（標準） | 約 3.65 日 |
| 2 | 99.9%（高可用性）★推奨 | 約 8.8 時間 |
| 3 | 99.95% | 約 4.4 時間 |
| 4 | 99.99%（ミッションクリティカル） | 約 52 分 |

**Q3. API レイテンシ要件（p99）**

| # | 選択肢 |
| --- | --- |
| 1 | 100ms 以内（リアルタイム） |
| 2 | 200ms 以内 ★推奨 |
| 3 | 500ms 以内 |
| 4 | 1 秒以内 |
| 5 | レイテンシ要件なし（バッチ系） |

#### ヒアリング 2: データとトラフィック

**Q4. データ機密性**（複数選択可）

| # | 選択肢 |
| --- | --- |
| 1 | 個人情報（PII）を扱う — 暗号化必須 ★よくあるケース |
| 2 | 決済情報を扱う — PCI DSS 対応必須 |
| 3 | 医療情報を扱う — HIPAA 対応必須 |
| 4 | 機密性の高いビジネスデータ |
| 5 | 公開データのみ — 特別な暗号化不要 |

**Q5. トラフィックパターン**

| # | 選択肢 |
| --- | --- |
| 1 | 定常（日中ピーク、夜間閑散） |
| 2 | スパイク型（セール、キャンペーン等で急増）★EC サイト推奨 |
| 3 | スケジュール型（月末締め、バッチ集中） |
| 4 | イベント駆動（外部イベントにより不定期に急増） |
| 5 | 一定（24h ほぼ同量） |

**Q6. スパイク倍率**（Q5 でスパイク型を選択した場合）

| # | 選択肢 |
| --- | --- |
| 1 | 2〜3 倍 |
| 2 | 5 倍 |
| 3 | 10 倍 ★推奨（EC セール想定） |
| 4 | 20 倍以上（ティッカー、フラッシュセール） |

#### ヒアリング 3: データストアとコスト

**Q7. データベース**（複数選択可）

| # | 選択肢 |
| --- | --- |
| 1 | PostgreSQL ★推奨（汎用 RDBMS） |
| 2 | MySQL |
| 3 | NoSQL（DynamoDB/CosmosDB/Firestore） |
| 4 | その他（DB 名を入力してください） |

**Q8. キャッシュ**

| # | 選択肢 |
| --- | --- |
| 1 | Redis ★推奨 |
| 2 | Memcached |
| 3 | キャッシュ不要 |

**Q9. コスト最適化方針**

| # | 選択肢 |
| --- | --- |
| 1 | コスト最適化優先（スポット/プリエンプティブル積極活用） |
| 2 | バランス型 ★推奨 |
| 3 | パフォーマンス最適化優先（コストより性能） |

### Step 3: ベンダーソースの取得（必須）

ベンダーソースは設計判断の根拠となるため、ワークロードモデル生成前に必ず取得すること。ソースが手元にない状態で設計を進めてはならない。

1. `docs/cloud-context/sources/{vendor}/` に対象レイヤーのソースファイルが存在するか確認する
2. **存在しない場合**: バンドルスクリプト `../mcl-common/scripts/fetch-vendor-sources.sh` を実行してベンダーソースをダウンロードする。対象クラウドごとに実行する:
   ```bash
   ../mcl-common/scripts/fetch-vendor-sources.sh <project-dir> --vendor aws --layer product
   ../mcl-common/scripts/fetch-vendor-sources.sh <project-dir> --vendor azure --layer product
   ```
   スクリプトは `../mcl-common/scripts/sources.tsv` に定義された URL から公式ドキュメントを取得し、`docs/cloud-context/sources/{vendor}/` に markdown として保存する。対象クラウドあたり最低 1 つのソースが取得できていなければ設計を開始しない。
3. **存在する場合**: そのまま読み込む。`docs/cloud-context/summaries/product/` にサマリーがあればサマリーも併用する
4. 取得したソースを読み込み、product レイヤーに関連するガイダンスを把握した上で次の Step に進む

WebFetch に失敗した場合はリトライし、それでも失敗する URL はスキップしてユーザーに通知する。ただし、対象クラウドあたり最低 1 つのソースは取得できていなければ設計を開始しない。

### Step 4: ワークロードモデルの生成

`../mcl-common/templates/canonical-model.yaml` をベースに、上記 9 つのワークロード特性を記述したワークロード固有の canonical model を作成する。

保存先: `specs/product/output/product-workload-model.yaml`

### Step 5: Vendor Service Mapping の生成

対象クラウドごとにワークロード特性に基づき最適なサービスを選定する。以下を考慮する:
- 共有プラットフォームの必須サービス（必ず使用する）
- 共有プラットフォームの任意サービス（適合すれば優先する）
- ベンダー直接サービス（共有プラットフォームでカバーできない場合）

保存先: `specs/product/output/product-mapping-{vendor}.yaml`

### Step 6: Decision Record の生成

保存先: `docs/cloud-context/decisions/product/`

### Step 7: Implementation Spec の生成

保存先: `specs/product/output/product-impl-{vendor}.yaml`

### Step 8: Observability Spec の生成

ワークロードのオブザーバビリティ設定を定義する:
- 主要メトリクスと SLI
- SLO とエラーバジェット
- ログレベルと保持期間
- 分散トレーシング設定
- ダッシュボード定義
- アラートルールとエスカレーション

保存先: `specs/product/output/product-observability.yaml`

### Step 9: コスト最適化ヒントの生成

ワークロード特性に基づきコスト最適化戦略を提案する:
- ライトサイジング推奨
- リザーブド/コミット利用割引の適格性
- スポット/プリエンプティブル対象ワークロードの候補
- ストレージ階層化の機会
- データ転送最適化
- オートスケーリングパラメータ

保存先: `specs/product/output/product-cost-hints.yaml`

### Step 10: Conformance Report の生成

ワークロードモデル、foundation ガードレール、shared platform 制約に対して検証する。

保存先: `docs/cloud-context/conformance/product/`

### Step 11: IaC スケルトンの生成

保存先: `infra/product/{vendor}/`

### Step 12: ターゲットアーキテクチャ Markdown の生成

保存先: `docs/cloud-context/generated-md/product/`

## 出力一覧

| Artifact | パス | 形式 |
| --- | --- | --- |
| ワークロードモデル | `specs/product/output/product-workload-model.yaml` | YAML |
| Vendor Mapping（クラウドごと） | `specs/product/output/product-mapping-{vendor}.yaml` | YAML |
| Decision Record | `docs/cloud-context/decisions/product/` | YAML |
| Implementation Spec（クラウドごと） | `specs/product/output/product-impl-{vendor}.yaml` | YAML |
| Observability Spec | `specs/product/output/product-observability.yaml` | YAML |
| コスト最適化ヒント | `specs/product/output/product-cost-hints.yaml` | YAML |
| Conformance Report（クラウドごと） | `docs/cloud-context/conformance/product/` | YAML |
| IaC スケルトン（クラウドごと） | `infra/product/{vendor}/` | HCL/Bicep 等 |
| ターゲットアーキテクチャ | `docs/cloud-context/generated-md/product/` | Markdown |

## 重要な制約

- Foundation と shared platform の context は必須の前提条件
- 共有プラットフォームの必須サービスを使用する。バイパスしない
- ファイル生成のみ行う。apply や commit はユーザーが実行する
- YAML が正本。Markdown は派生生成物
- 共通メタデータフィールドを必ず含める
- `../mcl-common/templates/` のテンプレートを使用する
- `../mcl-common/references/` のルールに従う

## リファレンス

foundation と同じリファレンスファイルを使用する。必要に応じて `../mcl-common/references/` から参照する。
