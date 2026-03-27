---
source_url: "https://cloud.google.com/architecture/landing-zones?hl=ja"
fetched_at: "2026-03-27T21:33:31Z"
vendor: "gcp"
layer: "foundation"
---

:::::::::: {#main-content .devsite-main-content role="main" has-book-nav="" has-sidebar=""}
:::: devsite-sidebar
::: devsite-sidebar-content
:::
::::

::: {.devsite-article-meta .nocontent role="navigation"}
- [Home](https://docs.cloud.google.com/?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="1" track-type="globalNav" track-name="breadcrumb" track-metadata-position="1" track-metadata-eventdetail="Google Cloud Documentation"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [Documentation](https://docs.cloud.google.com/docs?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="2" track-type="globalNav" track-name="breadcrumb" track-metadata-position="2" track-metadata-eventdetail="Documentation"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [Cloud Architecture Center](https://docs.cloud.google.com/architecture?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="3" track-type="globalNav" track-name="breadcrumb" track-metadata-position="3" track-metadata-eventdetail="Cloud Architecture Center"}
:::

フィードバックを送信

# Google Cloud のランディング ゾーン設計 [ コレクションでコンテンツを整理 ]{slot="popout-heading"} [ 必要に応じて、コンテンツの保存と分類を行います。 ]{slot="popout-contents"} {#google-cloud-のランディング-ゾーン設計-コレクションでコンテンツを整理-必要に応じてコンテンツの保存と分類を行います .devsite-page-title tabindex="-1"}

:::: {.devsite-article-body .clearfix}
::: last-reviewed
Last reviewed 2026-01-02 UTC
:::

このドキュメントでは、Google Cloudでランディング ゾーンを設計する方法の概要について説明します。「クラウド基盤」とも呼ばれるランディング ゾーンは、組織がビジネスニーズに応じて Google Cloud を導入できるようにする、モジュール式でスケーラブルな構成です。ランディング ゾーンは、多くの場合、クラウド環境にエンタープライズ ワークロードをデプロイするための前提条件です。

「ランディング ゾーン」は、[ゾーン](https://cloud.google.com/docs/geography-and-regions?hl=ja#regions_and_zones){track-metadata-position="body" track-name="internalLink" track-type="concepts"}や[ゾーンリソース](https://cloud.google.com/docs/geography-and-regions?hl=ja#zonal_resources){track-metadata-position="body" track-name="internalLink" track-type="concepts"}ではありません。

このドキュメントは、以下の概要を知りたいソリューション アーキテクト、技術者、経営幹部クラスの関係者を対象としています。

- Google Cloudのランディング ゾーンの一般的な要素
- ランディング ゾーンの設計に関する詳細情報の入手先
- 企業のランディング ゾーンをデプロイする方法（事前構築済みのソリューションをデプロイするオプションを含む）

このドキュメントは、ランディング ゾーンの設計とビルドの方法を理解するために役立つシリーズの一部です。このシリーズの他のドキュメントでは、組織のランディング ゾーンの設計時に行う必要がある全体的な決定について説明します。このラボでは、次のタスクについて学びます。

- Google Cloud のランディング ゾーンの設計（このドキュメント）
- [Google Cloudに ID をオンボーディングする方法を決定する](https://docs.cloud.google.com/architecture/landing-zones/decide-how-to-onboard-identities?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}
- [Google Cloud ランディング ゾーンのリソース階層を決定する](https://docs.cloud.google.com/architecture/landing-zones/decide-resource-hierarchy?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}
- [Google Cloud ランディング ゾーンのネットワーク設計を決定する](https://docs.cloud.google.com/architecture/landing-zones/decide-network-design?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}
- [Google Cloud ランディング ゾーンのセキュリティを決定する](https://docs.cloud.google.com/architecture/landing-zones/decide-security?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}

このシリーズでは、金融サービスやヘルスケアなどの規制対象となる業界におけるコンプライアンス要件は特に取り上げていません。

## Google Cloud ランディング ゾーンとは {#what-is-a-google-cloud-landing-zone data-text=" Google Cloud ランディング ゾーンとは" tabindex="-1"}

ランディング ゾーンを使用すると、企業は Google Cloudサービスをより安全にデプロイ、使用、スケーリングできます。ランディング ゾーンは動的であり、企業がより多くのクラウドベースのワークロードを導入するにつれて増大します。

ランディング ゾーンをデプロイするには、まず[組織リソースを作成](https://docs.cloud.google.com/resource-manager/docs/creating-managing-organization?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}し、オンラインのまたは請求書が発行された[請求先アカウントを作成](https://docs.cloud.google.com/billing/docs/how-to/manage-billing-account?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}する必要があります。

ランディング ゾーンは複数の領域にまたがり、ID、リソース管理、セキュリティ、ネットワーキングなどのさまざまな要素が含まれています。[ランディング ゾーンの要素](#elements){track-metadata-position="body" track-name="internalLink" track-type="concepts"}で説明されているように、他の多くの要素をランディング ゾーンに含めることもできます。

次の図は、ランディング ゾーンの実装例を示しています。これは、 Google Cloudでのハイブリッド クラウドとオンプレミスの接続を持つ Infrastructure as a Service（IaaS）のユースケースを示しています。

![ランディング ゾーンのサンプル アーキテクチャ。](https://docs.cloud.google.com/static/architecture/landing-zones/images/landing-zone-design-overview.svg?hl=ja)

上の図のアーキテクチャ例は、次の Google Cloud サービスと機能を含む Google Cloudランディング ゾーンを示しています。

- Resource Manager では、[組織のポリシー](https://docs.cloud.google.com/resource-manager/docs/organization-policy/overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}を使用して[リソース階層](https://docs.cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}が定義されます。

- [Cloud Identity](https://docs.cloud.google.com/identity/docs/overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} アカウントはオンプレミス ID プロバイダと同期し、[Identity and Access Management（IAM）](https://docs.cloud.google.com/iam/docs/overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}は Google Cloud リソースへのきめ細かいアクセスを提供します。

- 以下を含むネットワーク デプロイ。

  - 各環境（本番環境、開発環境、テスト環境）の[共有 VPC](https://docs.cloud.google.com/vpc/docs/shared-vpc?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} ネットワークは、複数のプロジェクトのリソースを VPC ネットワークに接続します。
  - [Virtual Private Cloud（VPC）ファイアウォール ルール](https://docs.cloud.google.com/vpc/docs/firewalls?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}は、[共有 VPC](https://docs.cloud.google.com/vpc/docs/shared-vpc?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} ネットワーク内のワークロードとの接続を制御します。
  - [Cloud NAT](https://docs.cloud.google.com/nat/docs/overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} ゲートウェイは、外部 IP アドレスを持たないネットワーク内のリソースからインターネットへのアウトバウンド接続を許可します。
  - [Cloud Interconnect](https://docs.cloud.google.com/network-connectivity/docs/interconnect/concepts/overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} は、オンプレミスのアプリケーションとユーザーを接続します（[Dedicated Interconnect](https://docs.cloud.google.com/network-connectivity/docs/interconnect/concepts/dedicated-overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} や [Partner Interconnect](https://docs.cloud.google.com/network-connectivity/docs/interconnect/concepts/partner-overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} などの Cloud Interconnect オプションを選択できます）。
  - [Cross-Cloud Interconnect](https://docs.cloud.google.com/network-connectivity/docs/interconnect/concepts/cci-overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}（または [Cloud VPN](https://docs.cloud.google.com/network-connectivity/docs/vpn?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}）は他のクラウド サービス プロバイダに接続されます。
  - [Cloud DNS](https://docs.cloud.google.com/dns/docs/overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} 限定公開ゾーンは、 Google Cloudのデプロイの DNS レコードをホストします。

- 複数のサービス プロジェクトが、[共有 VPC](https://docs.cloud.google.com/vpc/docs/shared-vpc?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} ネットワークを使用するように構成されています。これらのサービス プロジェクトはアプリケーション リソースをホストします。

- [Google Cloud Observability](https://docs.cloud.google.com/stackdriver/docs?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} には、モニタリング用の [Cloud Monitoring](https://docs.cloud.google.com/monitoring/docs?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} とロギング用の [Cloud Logging](https://docs.cloud.google.com/logging/docs?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} が含まれています。[Cloud Audit Logs](https://docs.cloud.google.com/logging/docs/audit?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}、[Firewall Rules Logging](https://docs.cloud.google.com/vpc/docs/firewall-rules-logging?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}、[VPC Flow Logs](https://docs.cloud.google.com/vpc/docs/flow-logs?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} は、必要なすべてのデータがログに記録され、分析に利用できるようにするうえで役立ちます。

- [VPC Service Controls](https://docs.cloud.google.com/vpc-service-controls/docs/overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} 境界はサービスとリソースを分離するため、境界外の Google Cloudサービスへのデータの下り（外向き）のリスクを軽減できます。ハイブリッド環境からのトラフィックは、境界内のサービスと通信するために、承認済みのプライベート アクセスで構成されます。

ランディング ゾーンの単一または標準の実装がないため、上の図は単なる例です。次のようなさまざまな要因に応じて、多くの設計上の選択を行う必要があります。

- 業界
- 組織構造とプロセス
- セキュリティとコンプライアンスの要件
- Google Cloudに移行するワークロード
- 既存の IT インフラストラクチャとその他のクラウド環境
- ビジネスと顧客の場所

## ランディング ゾーンを構築するタイミング {#when_to_build_a_landing_zone data-text="ランディング ゾーンを構築するタイミング" tabindex="-1"}

ランディング ゾーンは次の機能を提供するため、最初のエンタープライズ ワークロードを Google Cloudにデプロイする前にランディング ゾーンを構築することをおすすめします。

- 安全性を考慮して設計された基盤
- エンタープライズ ワークロード向けのネットワーク
- 内部コスト分散の管理に必要なツール

ただし、ランディング ゾーンはモジュール式であるため、ランディング ゾーンの最初のイテレーションは最終的なバージョンではないことがよくあります。したがって、スケーラビリティと拡張を考慮したランディング ゾーンの設計をおすすめします。たとえば、最初のワークロードでオンプレミス ネットワーク リソースへのアクセスが必要ない場合は、後でオンプレミス環境への接続を構築できます。

組織と、Google Cloudで実行する予定のワークロードの種類によっては、ワークロードによって要件が大きく異なる場合があります。たとえば、一部のワークロードには、独自のスケーラビリティまたはコンプライアンス要件があります。このような場合、組織に複数のランディング ゾーンが必要になることがあります。1 つのランディング ゾーンでほとんどのワークロードをホストし、別のランディング ゾーンで固有のワークロードをホストできます。ID、課金、組織リソースなどの要素は、ランディング ゾーン間で共有できます。ただし、ネットワーク設定、デプロイ メカニズム、フォルダレベルのポリシーなど、他の要素は異なる場合があります。

## ランディング ゾーンの要素 {#elements data-text="ランディング ゾーンの要素" tabindex="-1"}

ランディング ゾーンでは、Google Cloudで次のコア要素を設計する必要があります。

- [ID プロビジョニング](https://docs.cloud.google.com/architecture/landing-zones/decide-how-to-onboard-identities?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}

- [リソース階層](https://docs.cloud.google.com/architecture/landing-zones/decide-resource-hierarchy?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}

- [ネットワーク](https://docs.cloud.google.com/architecture/landing-zones/decide-network-design?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}

- [セキュリティ管理](https://docs.cloud.google.com/architecture/landing-zones/decide-security?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}

これらのコア要素に加えて、ビジネスに追加の要件がある場合があります。次の表では、これらの要素と、その詳細を確認できる場所について説明しています。

+-----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ランディング ゾーンの要素         | 説明                                                                                                                                                                                                                                     |
+===================================+==========================================================================================================================================================================================================================================+
| モニタリングとロギング            | すべての関連データがログに記録されるようにモニタリングとロギングの戦略を設計し、データの可視化と実用的な例外を通知するアラートのダッシュボードを用意します。\                                                                            |
|                                   | 詳細については、[Google Cloud Observability のドキュメント](https://docs.cloud.google.com/stackdriver/docs?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}をご覧ください。                        |
+-----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| バックアップと障害復旧            | バックアップと障害復旧の戦略を設計します。\                                                                                                                                                                                              |
|                                   | 詳しくは以下をご覧ください。                                                                                                                                                                                                             |
|                                   |                                                                                                                                                                                                                                          |
|                                   | - [障害復旧計画ガイド](https://docs.cloud.google.com/architecture/dr-scenarios-planning-guide?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}                                                     |
|                                   | - [バックアップおよび DR サービス](https://docs.cloud.google.com/backup-disaster-recovery/docs/concepts/backup-dr?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}                                 |
+-----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| コンプライアンス                  | 組織に関連するコンプライアンス フレームワークに従います。\                                                                                                                                                                               |
|                                   | 詳しくは、[コンプライアンス リソースセンター](https://cloud.google.com/compliance?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}をご覧ください。                                                 |
+-----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 費用対効果と制御                  | ランディング ゾーン内のワークロードの費用をモニタリングして最適化する機能を設計します。\                                                                                                                                                 |
|                                   | 詳しくは以下をご覧ください。                                                                                                                                                                                                             |
|                                   |                                                                                                                                                                                                                                          |
|                                   | - [Cloud Billing のコンセプトの概要](https://docs.cloud.google.com/billing/docs/concepts?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}                                                          |
|                                   | - [Google Cloud Well-Architected Framework: 費用の最適化](https://docs.cloud.google.com/architecture/framework/cost-optimization?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}                  |
|                                   | - [費用管理](https://cloud.google.com/cost-management?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}                                                                                             |
+-----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| API 管理                          | 開発した API 用のスケーラブルなソリューションを設計します。詳細については、[Apigee API 管理](https://docs.cloud.google.com/apigee?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}をご覧ください。 |
+-----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| クラスタ管理                      | ベスト プラクティスに従って Google Kubernetes Engine（GKE）クラスタを設計し、スケーラブルで復元力のある監視可能なサービスを構築します。                                                                                                  |
|                                   |                                                                                                                                                                                                                                          |
|                                   | 詳しくは以下をご覧ください。                                                                                                                                                                                                             |
|                                   |                                                                                                                                                                                                                                          |
|                                   | - [GKE ベスト プラクティス](https://docs.cloud.google.com/kubernetes-engine/docs/best-practices?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}                                                   |
|                                   | - [GKE Autopilot モード](https://docs.cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}                                         |
|                                   | - [マルチクラスタ サービス](https://docs.cloud.google.com/kubernetes-engine/docs/concepts/multi-cluster-services?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}                                  |
|                                   | - [Cloud Service Mesh について](https://docs.cloud.google.com/service-mesh/docs/overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}                                                          |
+-----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

## ランディング ゾーンの設計とデプロイのベスト プラクティス {#best_practices_for_designing_and_deploying_a_landing_zone data-text="ランディング ゾーンの設計とデプロイのベスト プラクティス" tabindex="-1"}

ランディング ゾーンを設計してデプロイするには計画が必要です。タスクを実行し、プロジェクト管理プロセスを使用するための適切なチームが必要です。このシリーズで説明する技術的なベスト プラクティスに従うこともおすすめします。

### チームを作る {#build_a_team data-text="チームを作る" tabindex="-1"}

社内の複数の技術チームのスタッフで構成されるチームを編成します。チームには、セキュリティ、ID、ネットワーク、オペレーションなど、すべてのランディング ゾーン要素を構築できる人を含める必要があります。 Google Cloud を理解している、チームを主導するクラウド技術者を決めます。チームには、プロジェクトを管理して実績を追跡するメンバーと、アプリケーションまたはビジネス オーナーと共同作業するメンバーを含める必要があります。

プロセスの初期にすべての関係者が関与するようにします。関係者は、プロセスの範囲について共通の理解を持ち、プロジェクトの開始時に大まかな決定を行う必要があります。

### プロジェクト管理をランディング ゾーンのデプロイに適用する {#apply_project_management_to_your_landing_zone_deployment data-text="プロジェクト管理をランディング ゾーンのデプロイに適用する" tabindex="-1"}

ランディング ゾーンの設計とデプロイには数週間かかる場合があるため、プロジェクト管理は必要不可欠です。プロジェクトの目標が明確に定義されてすべての関係者に伝達され、すべての関係者がプロジェクトの変更に関する最新情報を受け取るようにします。定期的なチェックポイントを定義し、運用プロセスと予期しない遅延を考慮した現実的なタイムラインでマイルストーンに合意します。

ビジネス要件に合わせるために、Google Cloudに最初にデプロイするユースケース用の最初のランディング ゾーンデプロイを計画します。水平方向の多層ウェブ アプリケーションなど、 Google Cloudで最も簡単に実行できるワークロードを最初にデプロイすることをおすすめします。これらのワークロードは、新しいワークロードまたは既存のワークロードです。既存のワークロードの移行準備状況を評価するには、 [Google Cloudへの移行: スタートガイド](https://docs.cloud.google.com/architecture/migration-to-gcp-getting-started?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}をご覧ください。

ランディング ゾーンはモジュール式であるため、最初のワークロードの移行に必要な要素を中心として初期設計を行い、後で他の要素を追加することを検討してください。

### 技術的なベスト プラクティスに従う {#follow_technical_best_practices data-text="技術的なベスト プラクティスに従う" tabindex="-1"}

[Terraform](https://docs.cloud.google.com/docs/terraform?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"} などで [Infrastructure as Code（IaC）](https://en.wikipedia.org/wiki/Infrastructure_as_code){.external target="external" track-metadata-position="body" track-name="externalLink" track-type="concepts"}の使用を検討してください。IaC は、デプロイを繰り返し、モジュール化できるようにするものです。GitOps を使用して[クラウド インフラストラクチャの変更をデプロイする CI / CD パイプライン](https://docs.cloud.google.com/docs/terraform/resource-management/managing-infrastructure-as-code?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}を使用すると、内部ガイドラインに従い、適切な制御を実施できます。

ランディング ゾーンを設計する際は、チームで技術的なベスト プラクティスを考慮に入れるようにしてください。ランディング ゾーンに関する決定について詳しくは、このシリーズの他のガイドをご覧ください。

次の表に、このシリーズに加え、ユースケースに応じてベスト プラクティスに従う場合に役立つフレームワーク、ガイド、ブループリントを示します。

  関連ドキュメント                                                                                                                                                                                 説明
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  [Google Cloud 設定](https://docs.cloud.google.com/docs/enterprise/cloud-setup?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}                             本番環境に対応したスケーラブルなエンタープライズ ワークロード向けに Google Cloud を設定する際に役立つ、高水準のガイド付きフロー。
  [エンタープライズ基盤ブループリント](https://docs.cloud.google.com/architecture/security-foundations?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}      CISO、セキュリティ担当者、リスク マネージャー、コンプライアンス責任者を対象とした、 Google Cloud セキュリティ ベスト プラクティスの独自の見解。
  [Google Cloud Well-Architected Framework](https://docs.cloud.google.com/architecture/framework?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}            安全性、効率、復元性、パフォーマンス、費用対効果の高いクラウド トポロジを設計、運用するためのアーキテクト、デベロッパー、管理者などのクラウド アーキテクト向けの推奨事項とベスト プラクティス。
  [Terraform ブループリント](https://docs.cloud.google.com/docs/terraform/blueprints/terraform-blueprints?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}   Terraform モジュールとしてパッケージ化され、Google Cloudのリソースの作成に使用できるブループリントとモジュールのリスト。

## ランディング ゾーンの実装に役立つリソースを特定する {#identify_resources_to_help_implement_your_landing_zone data-text="ランディング ゾーンの実装に役立つリソースを特定する" tabindex="-1"}

Google Cloud には、ランディング ゾーンの設定に役立つ次のオプションがあります。

- [Google Cloudパートナー](https://cloud.google.com/partners?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}または Google Cloud [プロフェッショナル サービス](https://cloud.google.com/consulting?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}を使用して、要件に合わせてカスタマイズされたランディング ゾーンを設計し、デプロイします。
- [Google Cloudお客様のオンボーディング プログラム](http://cloud.google.com/onboarding?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}を利用してワークロードをオンボーディングします。
- [Google Cloud コンソールの設定ガイド](https://console.cloud.google.com/cloud-setup/overview?hl=ja){target="console" track-metadata-position="body" track-name="consoleLink" track-type="concepts"}に沿って汎用ランディング ゾーンをデプロイします。
- [Terraform のサンプル基盤](https://github.com/terraform-google-modules/terraform-example-foundation){.external target="external" track-metadata-position="body" track-name="externalLink" track-type="concepts"}を使用して、独自のランディング ゾーンをデプロイします。

これらのサービスはすべて、世界中のさまざまな業界やビジネスニーズに対応するように設計されたアプローチを採用しています。ユースケースに最適な選択ができるように、Google Cloud アカウント チームと協力して選択を行い、プロジェクトを確実に成功させることをおすすめします。

## 次のステップ {#whats_next data-text="次のステップ" tabindex="-1"}

- [Google Cloudに ID をオンボーディングする方法を決定する](https://docs.cloud.google.com/architecture/landing-zones/decide-how-to-onboard-identities?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}（このシリーズの次のドキュメント）。
- [Google Cloud ランディング ゾーンのリソース階層を決定する](https://docs.cloud.google.com/architecture/landing-zones/decide-resource-hierarchy?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}。
- [Google Cloud ランディング ゾーンのネットワーク設計を決定する](https://docs.cloud.google.com/architecture/landing-zones/decide-network-design?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}。
- [Google Cloud ランディング ゾーンのセキュリティを決定します](https://docs.cloud.google.com/architecture/landing-zones/decide-security?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="concepts"}。
::::

フィードバックを送信

::: devsite-floating-action-buttons
:::

特に記載のない限り、このページのコンテンツは[クリエイティブ・コモンズの表示 4.0 ライセンス](https://creativecommons.org/licenses/by/4.0/)により使用許諾されます。コードサンプルは [Apache 2.0 ライセンス](https://www.apache.org/licenses/LICENSE-2.0)により使用許諾されます。詳しくは、[Google Developers サイトのポリシー](https://developers.google.com/site-policies?hl=ja)をご覧ください。Java は Oracle および関連会社の登録商標です。

最終更新日 2026-01-02 UTC。

::: devsite-content-data
ご意見をお聞かせください

\[\[\[\"わかりやすい\",\"easyToUnderstand\",\"thumb-up\"\],\[\"問題の解決に役立った\",\"solvedMyProblem\",\"thumb-up\"\],\[\"その他\",\"otherUp\",\"thumb-up\"\]\],\[\[\"わかりにくい\",\"hardToUnderstand\",\"thumb-down\"\],\[\"情報またはサンプルコードが不正確\",\"incorrectInformationOrSampleCode\",\"thumb-down\"\],\[\"必要な情報 / サンプルがない\",\"missingTheInformationSamplesINeed\",\"thumb-down\"\],\[\"翻訳に関する問題\",\"translationIssue\",\"thumb-down\"\],\[\"その他\",\"otherDown\",\"thumb-down\"\]\],\[\"最終更新日 2026-01-02 UTC。\"\],\[\],\[\]\]
:::
::::::::::
