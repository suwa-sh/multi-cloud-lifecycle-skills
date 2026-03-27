---
source_url: "https://cloud.google.com/billing/docs/concepts?hl=ja"
fetched_at: "2026-03-27T21:33:31Z"
vendor: "gcp"
layer: "foundation"
---

:::::::::::: {#main-content .devsite-main-content role="main" has-book-nav="" has-sidebar=""}
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

  [Costs and usage management](https://docs.cloud.google.com/docs/costs-usage?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="3" track-type="globalNav" track-name="breadcrumb" track-metadata-position="3" track-metadata-eventdetail="Costs and usage management"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [Cloud Billing](https://docs.cloud.google.com/billing/docs?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="4" track-type="globalNav" track-name="breadcrumb" track-metadata-position="4" track-metadata-eventdetail="Cloud Billing"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [ガイド](https://docs.cloud.google.com/billing/docs/concepts?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="5" track-type="globalNav" track-name="breadcrumb" track-metadata-position="5" track-metadata-eventdetail=""}
:::

フィードバックを送信

# Cloud Billing の概要 [ コレクションでコンテンツを整理 ]{slot="popout-heading"} [ 必要に応じて、コンテンツの保存と分類を行います。 ]{slot="popout-contents"} {#cloud-billing-の概要-コレクションでコンテンツを整理-必要に応じてコンテンツの保存と分類を行います .devsite-page-title tabindex="-1"}

:::::: {.devsite-article-body .clearfix}
Cloud Billing は、 Google Cloud の費用の追跡と把握、料金の支払い、費用の最適化に役立つツール コレクションです。

このドキュメントでは、次のトピックについて説明します。

- [Cloud Billing のツールの概要](#intro-tools){track-metadata-position="body" track-name="internalLink" track-type="tasks"}。

- [Cloud 請求先アカウントの概要](#billing_account){track-metadata-position="body" track-name="internalLink" track-type="tasks"}。Cloud 請求先アカウントと Google お支払いプロファイルの関係。Cloud 請求先アカウントでは、 Google Cloud および Google Maps Platform のリソースとサービスの使用料が支払われます。

- [Google Cloudのリソース管理の概要](#about_resource_management_for_billing){track-metadata-position="body" track-name="internalLink" track-type="tasks"}。 Google Cloud リソースを整理する方法は組織の構造によって異なります。これは、Cloud Billing レポートで費用を分析する方法にも影響します。

## Cloud Billing のツールについて {#intro-tools data-text="Cloud Billing のツールについて" tabindex="-1"}

Cloud Billing のツールは、使用料金のモニタリング、支出の予測、費用削減の機会の特定に役立ちます。

### 始める {#get_started data-text="始める" tabindex="-1"}

- **Cloud Billing のインタラクティブ ツアーを見る**。Google Cloudを初めてご利用になる場合は、このチュートリアルで、 Google Cloud コンソールを使用した費用の把握および管理方法の基本について学習してください。

  [Cloud Billing ツアーを開始する](https://console.cloud.google.com/billing/overview?walkthrough_tutorial_id=billing_tour&hl=ja){.button .button-primary target="console" track-metadata-position="body" track-name="internalLink" track-type="tasks"}

- **請求レポートと費用傾向を表示する**。請求レポートは、どの Google Cloud サービス（Compute Engine や Cloud Storage など）で最も費用がかっているかを把握する際に役立ちます。

  [Cloud Billing レポートツアーを開始する](https://console.cloud.google.com/billing/overview?walkthrough_tutorial_id=understanding_billing_reports&hl=ja){.button .button-primary target="console" track-metadata-position="body" track-name="internalLink" track-type="tasks"}

### 費用をモニタリングする {#monitor_costs data-text="費用をモニタリングする" tabindex="-1"}

- **BigQuery に課金データをエクスポートする**。使用状況と費用のデータを BigQuery データセットにエクスポートし、そのデータセットを使用して詳細な分析を行います。エクスポートしたデータは、Looker Studio などのツールで可視化することもできます。

  BigQuery へのエクスポートは、 Google Cloud の使用状況が最初から反映されるように、できるだけ早く有効にすることをおすすめします。

  [BigQuery への Cloud Billing のエクスポート チュートリアルを開始する](https://console.cloud.google.com/welcome?walkthrough_tutorial_id=billing_bigquery_export&hl=ja){.button .button-primary target="console" track-metadata-position="body" track-name="internalLink" track-type="tasks"}

- **予算を作成して、費用のアラートを設定する**。予算を使用して、実際の Google Cloud の費用を予定費用と比較して追跡できます。アラートを設定して支出状況を常に把握できるようにします。

  [チュートリアルを開始して、予算の作成について学ぶ](https://console.cloud.google.com/billing/overview?walkthrough_tutorial_id=billing_create_budgets&hl=ja){.button .button-primary target="console" track-metadata-position="body" track-name="internalLink" track-type="tasks"}

- **プロジェクトの異常を確認する**。異常とは、過去の支出パターンと比較して、予想費用とは異なる使用量の急増または逸脱です。\[異常\] ダッシュボードには、リンクされた請求先アカウントのプロジェクトに関連付けられているすべての費用の異常が表示されます。

  [費用の異常についての詳細](https://docs.cloud.google.com/billing/docs/how-to/manage-anomalies?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}

### 費用を最適化して制御する {#optimize_and_control_costs data-text="費用を最適化して制御する" tabindex="-1"}

- **FinOps ハブで推奨事項と使用状況の分析情報を表示する**。FinOps ハブを使用すると、現在の費用の削減状況をモニタリングして報告できます。また、費用最適化のための推奨される機会を検討し、最適化目標を計画できます。

  [FinOps ハブの詳細](https://docs.cloud.google.com/billing/docs/how-to/finops-hub?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}

- **確約利用割引（CUD）を申し込む**。ワークロードで必要なリソース量が予測可能であれば、 Google Cloud コミットメントを購入して特定の期間での最小レベルのリソースの使用を確約することで、割引料金を適用できます。

  [使用するサービスの CUD について確認する](https://docs.cloud.google.com/docs/cuds?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}。

  [CUD の推奨事項を確認する](https://docs.cloud.google.com/docs/cuds-recommender?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}。

  組織ですでに CUD に登録している場合は、[コミットメントの効果分析について](https://docs.cloud.google.com/billing/docs/how-to/cud-analysis?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}確認してください。

- **プログラムによる通知を使用して費用管理を自動化する**。プログラムによる通知を使用すると、予算アラートや異常アラート（他のチャネルへのアラートの転送、割り当ての調整によるリソース使用量の制御など）を受け取ったときの費用管理レスポンスを自動化できます。

  [予算通知への自動レスポンスに関するチュートリアルを開始する](https://console.cloud.google.com/welcome?walkthrough_tutorial_id=billing--budget--cost_enforcement&hl=ja){.button .button-primary target="console" track-metadata-position="body" track-name="internalLink" track-type="tasks"}

  [プログラムによる通知の詳細](https://docs.cloud.google.com/billing/docs/how-to/budgets-programmatic-notifications?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}

## Cloud 請求先アカウントと Google お支払いプロファイルについて {#billing_account data-text="Cloud 請求先アカウントと Google お支払いプロファイルについて" tabindex="-1"}

Cloud 請求先アカウントは Google Cloud で設定され、 Google Cloud リソースと Google Maps Platform API のセットに対する支払いを誰が行うかを定義します。 [Cloud 請求先アカウントのアクセス制御](https://docs.cloud.google.com/billing/docs/how-to/billing-access?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}は、IAM ロールによって確立されます。

Cloud 請求先アカウントは、[Google お支払いプロファイル](https://support.google.com/paymentscenter/topic/9017382?ref_topic=9037778&hl=ja){track-metadata-position="body" track-name="externalLink" track-type="tasks"}に関連付けられています。

Google お支払いプロファイルには、費用に対するお支払い方法が記録されています。

+:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:+:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:+
| [monetization_on]{.material-icons aria-hidden="true" style="width: 24px; height: 24px;" translate="no"} Cloud 請求先アカウント                                                                                                                                                           | [payment]{.material-icons aria-hidden="true" style="width: 24px; height: 24px;" translate="no"} Google お支払いプロファイル                                                                                                                                       |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Cloud 請求先アカウント:                                                                                                                                                                                                                                                                  | Google お支払いプロファイル:                                                                                                                                                                                                                                      |
|                                                                                                                                                                                                                                                                                          |                                                                                                                                                                                                                                                                   |
| - Google Cloud コンソールで管理されるクラウドレベルのリソースです。                                                                                                                                                                                                                      | - [Google お支払いセンター](https://support.google.com/paymentscenter/topic/9017382?ref_topic=9037778&hl=ja){track-metadata-position="body" track-name="externalLink" track-type="tasks"}で管理される Google レベルのリソースです。                               |
| - Google お支払いプロファイルに関連付けられます。お支払い方法が記録されたこのプロファイルが、料金をお支払いいただく方法を定義します。                                                                                                                                                    | - すべての Google サービス（Google 広告、 Google Cloud、Fi 電話サービスなど）に関連付けられます。                                                                                                                                                                 |
| - Cloud 請求先アカウントにリンクされているすべてのプロジェクトで、 Google Cloud の使用で発生したすべての費用（料金と節約額）を追跡します。                                                                                                                                               | - （ Google Cloudだけでなく）すべての Google サービスの支払いを処理します。                                                                                                                                                                                       |
| - [分割請求](https://docs.cloud.google.com/billing/docs/how-to/split-invoice?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}が適用される場合を除き、Cloud 請求先アカウントごとに 1 つの請求書が作成されます。                                        | - プロファイル管理責任者の名前、住所、納税者番号（法的に義務付けられている場合）などの情報が保管されます。                                                                                                                                                        |
| - 単一の通貨で運用されます。                                                                                                                                                                                                                                                             | - 各種のお支払い方法（Google での購入に以前使用したクレジット カード、デビットカード、銀行口座など）が保管されます。                                                                                                                                              |
| - 所定のリソースセットに対する支払い者を定義します。                                                                                                                                                                                                                                     | - 請求書、お支払い履歴、その他の重要なドキュメントを確認できるドキュメント センターとして機能します。                                                                                                                                                             |
| - 課金関連の機能へのアクセスを制御する[お支払いに固有のロールと権限](https://docs.cloud.google.com/billing/docs/how-to/grant-access-to-billing?hl=ja){track-metadata-position="body" track-name="externalLink" track-type="tasks"}が割り当てられます（IAM ロールによって設定されます）。 | - 各種の Cloud 請求先アカウントとプロダクトの請求書の表示と受け取りを誰に許可するかを管理します。                                                                                                                                                                 |
|                                                                                                                                                                                                                                                                                          | - お支払い関連の機能へのアクセスを制御するため、[Google でのお支払いに固有のユーザーと権限](https://docs.cloud.google.com/billing/docs/how-to/modify-contacts?hl=ja){track-metadata-position="body" track-name="externalLink" track-type="tasks"}が設定されます。 |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

**重要**: [アクティブで有効な Cloud 請求先アカウントにリンクされていない](https://docs.cloud.google.com/billing/docs/how-to/modify-project?hl=ja#disable_billing_for_a_project){track-metadata-position="body" track-name="internalLink" track-type="article"}プロジェクトがある場合、プロジェクトで有効になっているプロダクトやサービスを使用できません。これは、プロジェクトで[無料の Google Cloud サービス](https://docs.cloud.google.com/free/docs/gcp-free-tier?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="article"}のみを使用している場合にも当てはまります。

![プロジェクトが Cloud 請求先アカウントと Google お支払いプロファイルにどのように関連しているかを表しています。縦の破線で区切られた片方には Google Cloudレベルのリソース（Cloud 請求先アカウントとそれに関連付けられたプロジェクト）が示され、もう片方には Google レベルのリソース（お支払いプロファイル）が示されています。プロジェクトの使用料金は、Cloud 請求先アカウントで追跡されます。リンクされた Google お支払いプロファイルでは、請求書や明細書、お支払い方法など、お支払いに関連するすべての情報が管理されます。](https://docs.cloud.google.com/static/billing/docs/images/billing-project.png?hl=ja)

### Cloud 請求先アカウントの種類 {#billing_account_types data-text="Cloud 請求先アカウントの種類" tabindex="-1"}

Cloud 請求先アカウントには次の 2 種類があります。

- セルフサービス（オンライン）アカウント

  - セルフサービス アカウントの[請求可能ステータス](https://docs.cloud.google.com/free/docs/free-cloud-features?hl=ja#confirm-status-of-account){track-metadata-position="body" track-name="internalLink" track-type="tasks"}は、**無料トライアル アカウント**または**有料アカウント**です。
  - 支払い方法は、[各国またはリージョンの状況に応じて](https://docs.cloud.google.com/billing/docs/resources/currency?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}、クレジット カード、デビットカードまたは ACH 口座振替になります。
  - アカウントの請求可能ステータスが有料アカウントの場合、費用は Cloud 請求先アカウントに関連付けられているお支払い方法に自動的に請求されます。
  - セルフサービス アカウントはオンラインで登録できます。
  - セルフサービス アカウント用に生成される[ドキュメント](https://docs.cloud.google.com/billing/docs/how-to/get-invoice?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}には、明細、お支払い領収書、請求書などがあります。これらのドキュメントには Google Cloud コンソールからアクセスできます。

- 請求書発行アカウント

  - 請求書発行アカウントの[請求可能ステータス](https://docs.cloud.google.com/billing/docs/how-to/billing-cycle?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}は、**有料アカウント**です。
  - お支払い方法は、小切手または銀行振込みです。
  - 請求書は[郵送](https://docs.cloud.google.com/billing/docs/how-to/modify-billing-account?hl=ja#update_mailing_address){track-metadata-position="body" track-name="internalLink" track-type="tasks"}または[メール](https://docs.cloud.google.com/billing/docs/how-to/modify-billing-account?hl=ja#send-invoices-by-email){track-metadata-position="body" track-name="internalLink" track-type="tasks"}で送られます。
  - [請求書](https://docs.cloud.google.com/billing/docs/how-to/get-invoice?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}は Google Cloud コンソールからもアクセスできます（お支払い領収書も同様です）。
  - 請求先として適格である必要があります。要件の詳細については、[こちら](https://docs.cloud.google.com/billing/docs/how-to/invoiced-billing?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}をご覧ください。

### Google お支払いプロファイルの種類 {#payments_profile_types data-text="Google お支払いプロファイルの種類" tabindex="-1"}

[Google お支払いプロファイル](https://support.google.com/paymentscenter/answer/9028746?hl=ja){track-metadata-position="body" track-name="externalLink" track-type="tasks"}を作成するときに、プロファイルの種類を指定するよう求められます。課税条件と本人確認のために、ここでは正確な情報を提供してください。お支払いプロファイルを作成した後に、この設定を変更することはできません。Google お支払いプロファイルを設定する際は、そのプロファイルの用途に最適な種類を選択してください。

Google お支払いプロファイルには次の 2 種類があります。

- 個人

  - 個人のお支払いアカウントとして、自分のアカウントを使用します。
  - お支払いプロファイルを個人として登録すると、そのプロファイルを自分で管理できます。この場合、ユーザーの追加や削除、プロファイルに対する権限の変更を行うことはできません。

- ビジネス

  - ビジネス、組織、パートナーシップ、教育機関の代理として料金を支払います。
  - Play アプリ、Play ゲーム、Google サービス（Google 広告、 Google Cloud、Fi 電話サービスなど）のお支払いには、Google お支払いセンターをご利用いただけます。
  - ビジネス プロファイルを使用する場合、複数のユーザーがお支払いプロファイルにアクセスして管理できるよう、管理対象の Google お支払いプロファイルに他のユーザーを追加できます。
  - ビジネス プロファイルに追加されたすべてのユーザーが、そのプロファイルでお支払い情報を確認できます。

### 請求サイクル {#charging_cycle data-text="請求サイクル" tabindex="-1"}

Cloud 請求先アカウントの請求サイクルにより、 Google Cloud サービスと Google Maps Platform API の使用料金の支払い方法が決まります。

セルフサービスの Cloud 請求先アカウントの場合、 Google Cloud の費用は次のいずれかの方法で自動的に請求されます。

- 毎月の請求: 月単位で定期的に費用が請求されます。
- 限度額請求: 特定の金額に達すると、費用が請求されます。

セルフサービスの Cloud 請求先アカウントの場合、アカウントの作成時に請求サイクルが自動的に割り当てられます。請求サイクルを選択することはできず、変更することもできません。

請求書が発行される Cloud 請求先アカウントの場合、[分割請求](https://docs.cloud.google.com/billing/docs/how-to/split-invoice?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}の適用時を除き、通常は 1 か月に 1 つの請求書を受け取ります。請求書の支払い期間（支払い条件）は、Google との契約によって決まります。

- [請求期間を確認する](https://docs.cloud.google.com/billing/docs/how-to/billing-cycle?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}
- 限度額請求について詳しくは、[こちら](https://docs.cloud.google.com/billing/docs/how-to/billing-cycle?hl=ja#threshold-billing){track-metadata-position="body" track-name="internalLink" track-type="tasks"}をご覧ください。

### 請求連絡先 {#billing_contacts data-text="請求連絡先" tabindex="-1"}

Cloud 請求先アカウントには 1 つ以上の連絡先があります。この連絡先は [Google お支払いプロファイル](https://docs.cloud.google.com/billing/docs/how-to/modify-contacts?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}に定義され、Cloud 請求先アカウントに関連付けられています。これらの連絡先は、登録されたお支払い方法に固有のお支払い情報を受け取るように指定されたユーザーです（たとえばクレジット カードの更新が必要なときに、その情報を受け取れます）。この連絡先のリストにアクセスして管理するには、[Google お支払いセンター](https://support.google.com/paymentscenter/answer/7162853?hl=ja){track-metadata-position="body" track-name="externalLink" track-type="tasks"}または [Google Cloud コンソール](https://docs.cloud.google.com/billing/docs/how-to/modify-contacts?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}を使用します。

### サブアカウント {#subaccounts data-text="サブアカウント" tabindex="-1"}

サブアカウントは販売パートナー用です。販売パートナーは、サブアカウントを使用して顧客が利用したプロダクトやサービスの料金を表し、チャージバック処理に使用できます。

Cloud Billing のサブアカウントを使用すると、プロジェクトの料金を請求書の別のセクションにまとめることができます。請求先サブアカウントは、販売パートナーの親の Cloud 請求先アカウントが所有する Cloud 請求先アカウントです。すべての請求先サブアカウントの使用料金は、販売パートナーの親の Cloud 請求先アカウントにより支払われます。親の Cloud 請求先アカウントが[請求書発行](https://docs.cloud.google.com/billing/docs/how-to/invoiced-billing?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}に含まれている必要があります。

サブアカウントは、多くの点で Cloud 請求先アカウントと同様に動作します。つまりリンクされたプロジェクトを持つことができ、Cloud Billing データのエクスポートを構成でき、IAM ロールを定義できます。サブアカウントにリンクしているプロジェクトで発生した料金は請求書にまとめられ、小計されます。[分割請求](https://docs.cloud.google.com/billing/docs/how-to/split-invoice?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}が適用される場合は複数の請求書にまとめられます。リソース管理の面では、アクセス制御ポリシーをサブアカウントごとに完全に分離できるので、顧客ごとに独立して管理できます。

![プロジェクトが Cloud 請求先アカウント、Cloud 請求先サブアカウント、Google お支払いプロファイルとどのように関連しているかを示します。縦の破線で区切られた片方には Google Cloudレベルのリソース（Cloud 請求先アカウント、サブアカウント、関連付けられたプロジェクト）が示され、もう片方には Google レベルのリソース（Google お支払いプロファイル）が示されています。プロジェクトの使用コストは、関連する Cloud 請求先サブアカウントでグループ化され、小計されます。サブアカウントの費用は、販売パートナーの親の Cloud 請求先アカウントによって支払われます（このアカウントは販売パートナーの Google お支払いプロファイルにリンクされています）。](https://docs.cloud.google.com/static/billing/docs/images/subaccounts.png?hl=ja)

[Cloud Billing Account API](https://docs.cloud.google.com/billing/docs/apis?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"} を使用すると、サブアカウントを作成して管理できます。API を使用して既存のシステムに接続し、新規顧客やチャージバック グループをプログラムでプロビジョニングします。

## 請求のリソース管理について {#about_resource_management_for_billing data-text="請求のリソース管理について" tabindex="-1"}

Google Cloud では、ニーズに合わせて請求をさまざまな方法で構成できます。このセクションでは、組織と課金の基本的なコンセプトと効果的な使用方法について説明します。

費用を効果的にモニタリングするためのリソース構成については、[Cloud Billing リソースの構成とアクセス管理](https://docs.cloud.google.com/billing/docs/onboarding-checklist?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}をご覧ください。

### リソースについて {#about_resources data-text="リソースについて" tabindex="-1"}

Google Cloudのコンテキストでは、リソースはワークロードの処理に使用されるサービスレベルのリソース（仮想マシンやデータベースなど）を意味することもあれば、サービスの上位にあるアカウント レベルのリソース（プロジェクト、フォルダ、組織など）を意味することもあります。

### リソース管理 {#resource_management data-text="リソース管理" tabindex="-1"}

リソース管理では、会社 / チームで使用する各種のクラウド リソースを構成し、こうしたリソースへのアクセス権を付与します。特に、サービスレベルのリソースの上位にあるアカウント レベルのリソースの設定と編成が重要です。アカウント レベルのリソースは、 Google Cloud アカウントの設定と管理に関連します。

### リソース階層 {#gcp_resource_hierarchy_overview data-text="リソース階層" tabindex="-1"}

::: video-wrapper
:::

Google Cloud リソースは階層で整理されます。この階層により、組織の運用体制を Google Cloudにマッピングし、関連リソースのグループのアクセス制御と権限を管理できます。[リソース階層](https://docs.cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}は、アクセス管理ポリシー（[Identity and Access Management](https://docs.cloud.google.com/iam/docs/overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}）と[組織のポリシー](https://docs.cloud.google.com/resource-manager/docs/organization-policy/overview?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}の論理的な接点として機能します。

IAM と組織のポリシーはともに階層から継承されます。階層の各ノードで有効なポリシーは、ノードに直接適用されるポリシーで、祖先から継承されます。

次の図に示すリソース階層の例は、 Google Cloudアカウントの管理に関連する主要なアカウント レベルのリソースを示しています。

![リソース階層の例。 Google Cloud アカウントの管理に関連するコアアカウント レベルのリソースと、それらリソースの Cloud 請求先アカウントと Google お支払いプロファイルとの関係を表しています。](https://docs.cloud.google.com/static/billing/docs/images/resource-hierarchy-overview.png?hl=ja){.screenshot =\"\"=""}

### ドメイン {#domain data-text="ドメイン" tabindex="-1"}

- 会社のドメインは組織の主要な ID です。Google Cloudを含む Google サービスでは、ドメインによって会社の ID を確立します。
- ドメインを使用して、組織内のユーザーを管理します。
  - Google Cloudの使用時に組織に関連付けるユーザーは、ドメインレベルで定義します。
  - ドメインは、ユーザーとデバイスに関する全体的なポリシーを管理できる場所でもあります（2 段階認証の有効化や、組織内の任意のユーザーのパスワードのリセットを行うなど）。
- ドメインは、[Google Workspace](https://gsuite.google.com?hl=ja){track-metadata-position="body" track-name="externalLink" track-type="tasks"} アカウントまたは [Cloud Identity](https://docs.cloud.google.com/identity?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"} アカウントのいずれかにリンクされます。
- Google Workspace アカウントまたは Cloud Identity アカウントには、それぞれ 1 つの組織が関連付けられます。
- ドメインレベルの機能を管理するには、**Google 管理コンソール（admin.google.com）**を使用します。

リソースの階層の詳細については、[Resource Manager ドキュメント](https://docs.cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}をご覧ください。

### 組織 {#organization data-text="組織" tabindex="-1"}

- 組織は、 Google Cloud リソース階層のルートノードです。
- 組織に属するすべての Google Cloud リソースは組織ノード下でグループ化されます。組織ノードの下位にあるすべてのプロジェクト、フォルダ、リソース、Cloud 請求先アカウントに対する設定、権限、ポリシーの定義はこれらのグループに基づいて行います。
- 組織は 1 つのドメイン（Google Workspace アカウントまたは Cloud Identity アカウントのいずれかで設定されたドメイン）に関連付けられます。Google Cloudでドメインを設定すると、自動的に組織が作成されます。
- 組織を使用して、 Google Cloudリソースと、それに対するユーザーのアクセス権限を管理できます。これには、次のものが含まれます。
  - プロアクティブ管理: 必要に応じてリソースを再編成します（たとえば、部門を再編成したり新しく立ち上げたりする場合、新しいプロジェクトとフォルダが必要になることがあります）。
  - リアクティブ管理: リソースに対するアクセス権を失った場合（たとえば、チームメンバーの 1 人がリソースにアクセスできなくなった場合や、退職した場合など）、そのリソースへのアクセス権を再度取得するには、組織リソースがセーフティ ネットとして機能します。
- Google Cloudに関連するさまざまなロールとリソース（組織、プロジェクト、フォルダ、リソース、Cloud 請求先アカウントを含む）は、 Google Cloud コンソール内で管理します。

組織の詳細については、次のドキュメントをご覧ください。

- [組織の作成と管理](https://docs.cloud.google.com/resource-manager/docs/creating-managing-organization?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}
- [組織リソースの表示と管理](https://docs.cloud.google.com/resource-manager/docs/organization-resource-management?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}
- [複数の組織の管理](https://docs.cloud.google.com/resource-manager/docs/managing-multiple-orgs?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}

### フォルダ {#folders data-text="フォルダ" tabindex="-1"}

- フォルダはグループ化メカニズムです。フォルダにはプロジェクト、他のフォルダ、またはその両方を格納できます。
- フォルダを使用するには、[組織ノード](https://docs.cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}が必要です。
- フォルダとプロジェクトはすべて組織ノード下でマッピングされます。
- フォルダを使用すると、共通の IAM ポリシーを共有するリソースをグループ化できます。
- 1 つのフォルダに複数のフォルダやリソースを格納できますが、個々のフォルダまたはリソースの親は 1 つだけです。

フォルダの使い方については、[フォルダの作成と管理](https://docs.cloud.google.com/resource-manager/docs/creating-managing-folders?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}をご覧ください。

### プロジェクト {#projects data-text="プロジェクト" tabindex="-1"}

- サービスレベルのリソースは例外なく、 Google Cloudでの基本レベルの構成エンティティであるプロジェクトを親として持ちます。
- サービスレベルのリソース（Compute Engine 仮想マシン、Pub/Sub トピック、Cloud Storage バケットなど）を使用するには、プロジェクトが必須です。
- プロジェクトを使用すると、論理プロジェクト、チーム、環境、またはビジネス ファンクションや構造にマップされるその他のコレクションを表すことができます。
- プロジェクトは、サービス、API、IAM 権限を有効化するための基礎となります。
- どのリソースも、1 つのプロジェクト内にしか存在することができません。

プロジェクトの詳細については、次のドキュメントをご覧ください。

- [プロジェクトの作成と管理](https://docs.cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}
- [プロジェクトの移動](https://docs.cloud.google.com/resource-manager/docs/moving-projects-folders?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}
- [プロジェクトの移行](https://docs.cloud.google.com/resource-manager/docs/project-migration?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}

### リソース {#resources data-text="リソース" tabindex="-1"}

- Google Cloud サービスレベルのリソースは、Compute Engine 仮想マシン、Pub/Sub トピック、Cloud Storage バケットなど、すべての Google Cloud サービスを構成する基本コンポーネントです。
- 請求およびアクセスを制御する目的で、リソースは、階層（プロジェクトや組織も含む）の最下位に存在します。

### ラベル {#labels data-text="ラベル" tabindex="-1"}

- ラベルを利用して、 Google Cloud リソース（Compute Engine インスタンスなど）を分類できます。
- ラベルは Key-Value ペアです。
- 各リソースにラベルを設定し、そのラベルに基づいてリソースをフィルタリングできます。
- ラベルは、よりきめ細かなレベルで費用を追跡するのに役立ちます。ラベルに関する情報は課金システムに転送されるため、ラベル別に[料金を分析](https://docs.cloud.google.com/billing/docs/how-to/bq-examples?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}できます。

**注:** 新たに作成されたラベルが Cloud Billing に表示されるまで最大で 1 日かかることがあります。

ラベルの使用方法について詳しくは、[ラベルの作成と管理](https://docs.cloud.google.com/resource-manager/docs/creating-managing-labels?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}をご覧ください。

## リソース、Cloud 請求先アカウント、Google お支払いプロファイルの関係 {#relationships-between-resources data-text="リソース、Cloud 請求先アカウント、Google お支払いプロファイルの関係" tabindex="-1"}

組織、Cloud 請求先アカウント、プロジェクト間の相互作用は、所有権と支払いリンクという 2 つのタイプの関係によって管理されます。

- **所有権**とは、IAM 権限の継承を指します。
- **支払いリンク**は、特定のプロジェクトの支払いを行う Cloud 請求先アカウントを定義します。

**注:** Cloud 請求先アカウントの所有権は 1 つの組織に制限されます。Cloud 請求先アカウントにリンクされているプロジェクトの支払いリンクは、組織の所有権によって制限されません。Cloud 請求先アカウントは、Cloud 請求先アカウントを所有する組織とは異なる組織に属するプロジェクトにも支払いを行うことができます。プロジェクトの Cloud 請求先アカウントの管理の詳細については、[プロジェクトの課金の有効化、無効化、変更](https://docs.cloud.google.com/billing/docs/how-to/modify-project?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}をご覧ください。

次の図は、ある組織の所有権と支払いリンクの関係を示しています。

![プロジェクトが Cloud 請求先アカウント、組織、Google お支払いプロファイルとどのように関連しているかを示します。縦の破線で区切られた一方には Google Cloudレベルのリソース（組織、Cloud 請求先アカウントと関連付けられたプロジェクト）が示され、もう一方には Google レベルのリソース（Google お支払いプロファイル）が示されています。プロジェクトの費用は、Google お支払いプロファイルにリンクされている Cloud 請求先アカウントに請求されます。この組織は、IAM を使用して Cloud 請求先アカウントの所有権を管理します。](https://docs.cloud.google.com/static/billing/docs/images/access-control-org.png?hl=ja)

この図では、組織はプロジェクト 1、2、3 の所有権を持ちます。つまり、この組織は 3 つのプロジェクトの IAM 権限の親となっています。

Cloud 請求先アカウントは、プロジェクト 1、2、3 にリンクされています。これは、この請求先アカウントが 3 つのプロジェクトで発生した料金を支払うことを意味します。

**注:** Cloud 請求先アカウントにプロジェクトをリンクしても、IAM の観点からは Cloud 請求先アカウントが親になることはありません。したがって、プロジェクトはリンクされている Cloud 請求先アカウントの権限を継承しません。

Cloud 請求先アカウントには [Google お支払いプロファイル](#billing_account){track-metadata-position="body" track-name="internalLink" track-type="tasks"}もリンクされています。このプロファイルには、氏名、住所、お支払い方法などの情報が記録されています。

この例では、組織の IAM 請求ロールが付与されているユーザーには、Cloud 請求先アカウントまたはプロジェクトの請求ロールも割り当てられます。

IAM 請求ロールの付与方法については、[請求アクセス制御の概要](https://docs.cloud.google.com/billing/docs/how-to/billing-access?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}をご覧ください。

## 関連トピック {#related_topics data-text="関連トピック" tabindex="-1"}

- [効率的な費用管理のためにリソースを整理する](https://docs.cloud.google.com/billing/docs/onboarding-checklist?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}

- [代理店モデル取引の分割請求](https://docs.cloud.google.com/billing/docs/how-to/split-invoice?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="tasks"}

- [picture_as_pdf]{.material-icons aria-hidden="true" style="font-size: 150%;" translate="no"} [クラウドの財務ガバナンスに関するガイド](https://cloud.google.com/files/guide-to-financial-governance.pdf?hl=ja)

- [video_library]{.material-icons aria-hidden="true" style="font-size: 150%;" translate="no"} [動画ライブラリ: 費用のモニタリングと管理のベスト プラクティス](https://www.youtube.com/playlist?list=PLIivdWyY5sqKeXavu1XuBNBDLBO31kzM0&hl=ja)

:::: eligible
::: {}
## 使ってみる {#try-it-for-yourself .hide-from-toc data-text="使ってみる" tabindex="-1"}

Google Cloudを初めて使用する場合は、アカウントを作成して、実際のシナリオでの Google プロダクトのパフォーマンスを評価してください。新規のお客様には、ワークロードの実行、テスト、デプロイを行う際に使用できる無料クレジット \$300 分を差し上げます。

[無料で開始](https://console.cloud.google.com/freetrial?hl=ja){.button .button-primary track-metadata-anchor_text="Get started for free" track-metadata-eventdetail="https://console.cloud.google.com/freetrial" track-metadata-href="https://console.cloud.google.com/freetrial" track-metadata-modifier="primary" track-name="Get started for free" track-type="button"}
:::
::::
::::::

フィードバックを送信

::: devsite-floating-action-buttons
:::

特に記載のない限り、このページのコンテンツは[クリエイティブ・コモンズの表示 4.0 ライセンス](https://creativecommons.org/licenses/by/4.0/)により使用許諾されます。コードサンプルは [Apache 2.0 ライセンス](https://www.apache.org/licenses/LICENSE-2.0)により使用許諾されます。詳しくは、[Google Developers サイトのポリシー](https://developers.google.com/site-policies?hl=ja)をご覧ください。Java は Oracle および関連会社の登録商標です。

最終更新日 2026-03-04 UTC。

::: devsite-content-data
ご意見をお聞かせください

\[\[\[\"わかりやすい\",\"easyToUnderstand\",\"thumb-up\"\],\[\"問題の解決に役立った\",\"solvedMyProblem\",\"thumb-up\"\],\[\"その他\",\"otherUp\",\"thumb-up\"\]\],\[\[\"わかりにくい\",\"hardToUnderstand\",\"thumb-down\"\],\[\"情報またはサンプルコードが不正確\",\"incorrectInformationOrSampleCode\",\"thumb-down\"\],\[\"必要な情報 / サンプルがない\",\"missingTheInformationSamplesINeed\",\"thumb-down\"\],\[\"翻訳に関する問題\",\"translationIssue\",\"thumb-down\"\],\[\"その他\",\"otherDown\",\"thumb-down\"\]\],\[\"最終更新日 2026-03-04 UTC。\"\],\[\],\[\]\]
:::
::::::::::::
