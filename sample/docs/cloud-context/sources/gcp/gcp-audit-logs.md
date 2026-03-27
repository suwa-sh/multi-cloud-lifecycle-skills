---
source_url: "https://cloud.google.com/logging/docs/audit?hl=ja"
fetched_at: "2026-03-27T21:33:31Z"
vendor: "gcp"
layer: "foundation"
---

::::::::::::::::::: {#main-content .devsite-main-content role="main" has-book-nav="" has-sidebar=""}
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

  [Observability](https://docs.cloud.google.com/docs/observability?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="3" track-type="globalNav" track-name="breadcrumb" track-metadata-position="3" track-metadata-eventdetail="Observability and monitoring"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [Cloud Logging](https://docs.cloud.google.com/logging/docs?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="4" track-type="globalNav" track-name="breadcrumb" track-metadata-position="4" track-metadata-eventdetail="Cloud Logging"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [ガイド](https://docs.cloud.google.com/logging/docs/overview?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="5" track-type="globalNav" track-name="breadcrumb" track-metadata-position="5" track-metadata-eventdetail=""}
:::

フィードバックを送信

# Cloud Audit Logs の概要 [ コレクションでコンテンツを整理 ]{slot="popout-heading"} [ 必要に応じて、コンテンツの保存と分類を行います。 ]{slot="popout-contents"} {#cloud-audit-logs-の概要-コレクションでコンテンツを整理-必要に応じてコンテンツの保存と分類を行います .devsite-page-title tabindex="-1"}

::::::::::::: {.devsite-article-body .clearfix}
::: video-wrapper
:::

このドキュメントでは、Cloud Audit Logs の概要について説明します。

Google Cloud サービスでは、管理アクティビティと、 Google Cloud リソース内のアクセスを記録する監査ログを書き込みます。監査ログにより、 Google Cloud リソース内でオンプレミス環境と同じレベルの透明性を確保しながら「いつ誰がどこで何をしたか」という問いに答えることができます。監査ログを有効にすると、セキュリティ、監査、コンプライアンス エンティティがGoogle Cloud のデータとシステムをモニタリングして、脆弱性や外部データの不正使用の可能性を確認できます。

**注:** データアクセス監査ログは、サポートチームがアカウントの問題をトラブルシューティングするのに役立ちます。このため、有効にしておくことをおすすめします。Cloud Audit Logs のベスト プラクティスについては、[Cloud Audit Logs のベスト プラクティス](https://docs.cloud.google.com/logging/docs/audit/best-practices?hl=ja)をご覧ください。

## 監査ログを生成するGoogle Cloud サービス {#services data-text="監査ログを生成するGoogle Cloud サービス" tabindex="-1"}

監査ログを提供する Google Cloud サービスの一覧については、[監査ログを備えたGoogle Cloud サービス](https://docs.cloud.google.com/logging/docs/audit/services?hl=ja)をご覧ください。最終的には、すべてのGoogle Cloud サービスが監査ログを提供するようになります。

Google Cloud MCP サーバーは、データアクセスの監査ログを書き込みます。Google Cloud MCP サーバーの API 呼び出しによって書き込まれたデータアクセスの監査ログはサービスに固有であり、`SERVICE_NAME`{.variable translate="no"}`.googleapis.com/mcp`{dir="ltr" translate="no"} という形式を使用します。これらのデータアクセス ログを有効にするには、[IAM `AuditConfig`{dir="ltr" translate="no"} オブジェクト](https://docs.cloud.google.com/logging/docs/audit/configure-data-access?hl=ja#auditconfig_objects)で `mcp.googleapis.com`{dir="ltr" translate="no"} の監査ロギングを有効にします。Google Cloud MCP サーバーの監査ロギングの詳細については、[Google Cloud MCP サーバーの監査ロギング](https://docs.cloud.google.com/mcp/audit-logging?hl=ja)をご覧ください。

Google Workspace 監査ログの概要については、[Google Workspace の監査ログ](https://docs.cloud.google.com/logging/docs/audit/gsuite-audit-logging?hl=ja)をご覧ください。

## 必要なロール {#roles data-text="必要なロール" tabindex="-1"}

監査ログを表示するには、適切な [Identity and Access Management（IAM）](https://docs.cloud.google.com/iam/docs?hl=ja)の権限とロールが必要です。

- 管理アクティビティ、ポリシー拒否、システム イベントの監査ログへの読み取り専用アクセスに必要な権限を取得するには、プロジェクトに対する[ログ閲覧者](https://docs.cloud.google.com/iam/docs/roles-permissions/logging?hl=ja#logging.viewer)（`roles/logging.viewer`{dir="ltr" translate="no"}）の IAM ロールを付与するように管理者へ依頼してください。

  ログ閲覧者のロール `(roles/logging.viewer)`{dir="ltr" translate="no"} しか持っていない場合、`_Default`{dir="ltr" translate="no"} バケット内のデータアクセス監査ログを閲覧することはできません。

<!-- -->

- データアクセス ログを含む、`_Required`{dir="ltr" translate="no"} バケットと `_Default`{dir="ltr" translate="no"} バケットのすべてのログに対するアクセス権の取得に必要な権限を取得するには、プロジェクトに対する[プライベート ログ閲覧者](https://docs.cloud.google.com/iam/docs/roles-permissions/logging?hl=ja#logging.privateLogViewer)（`roles/logging.privateLogViewer`{dir="ltr" translate="no"}）の IAM ロールを付与するように管理者へ依頼してください。

  プライベート ログ閲覧者のロール `(roles/logging.privateLogViewer)`{dir="ltr" translate="no"} には、ログ閲覧者のロール（`roles/logging.viewer`{dir="ltr" translate="no"}）に含まれる権限と、`_Default`{dir="ltr" translate="no"} バケット内のデータアクセス監査ログの読み取りに必要な権限が含まれます。

監査ログデータに適用される IAM の権限とロールの詳細については、[IAM によるアクセス制御](https://docs.cloud.google.com/logging/docs/access-control?hl=ja)をご覧ください。

## 監査ログの種類 {#types data-text="監査ログの種類" tabindex="-1"}

Cloud Audit Logs では、Google Cloud プロジェクト、フォルダ、組織ごとに以下の監査ログが保存されます。

- [管理アクティビティ監査ログ](#admin-activity)
- [データアクセス監査ログ](#data-access)
- [システム イベント監査ログ](#system-event)
- [ポリシー拒否監査ログ](#policy_denied)

**注:** Cloud Audit Logs に書き込まれるログエントリは不変です。

### 管理アクティビティ監査ログ {#admin-activity data-text="管理アクティビティ監査ログ" tabindex="-1"}

管理アクティビティ監査ログは、リソースの構成やメタデータを変更するユーザー主導の API 呼び出しやその他のアクションによって書き込まれるログエントリです。これらのログは、たとえば、ユーザーが VM インスタンスを作成したときや Identity and Access Management 権限を変更したときに記録されます。

管理アクティビティの監査ログは必ず記録されます。構成、除外、無効化はできません。Cloud Logging API を無効にしても、管理アクティビティ監査ログは生成されます。

管理アクティビティ監査ログを書き込むサービスのリストと、それらのログを生成するアクティビティの詳細については、[監査ログを備えたGoogle Cloud サービス](https://docs.cloud.google.com/logging/docs/audit/services?hl=ja)をご覧ください。

### データアクセス監査ログ {#data-access data-text="データアクセス監査ログ" tabindex="-1"}

データアクセス監査ログは、リソースの構成やメタデータを読み取る API 呼び出しによって書き込まれるログエントリです。ユーザー提供のリソースデータの作成、変更、読み取りを行うユーザー主導の API 呼び出しによっても書き込まれます。

Identity and Access Management ポリシー [`allAuthenticatedUsers`{dir="ltr" translate="no"}](https://docs.cloud.google.com/iam/docs/principals-overview?hl=ja#allauthenticatedusers) または [`allUsers`{dir="ltr" translate="no"}](https://docs.cloud.google.com/iam/docs/principals-overview?hl=ja#allusers) を使用する一般公開されたリソースでは、監査ログは生成されません。 Google Cloud、Google Workspace、Cloud Identity、Drive Enterprise アカウントにログインせずにアクセスできるリソースでは、監査ログは生成されません。これにより、エンドユーザー ID と情報が保護されます。

監査ログはデータサイズが非常に大きくなる可能性があるため、BigQuery データアクセス監査ログを除き、データアクセス監査ログはデフォルトで無効になっています。BigQuery 以外の Google Cloud サービスのデータアクセス監査ログを書き込むには、これらのログを明示的に有効にする必要があります。データアクセス監査ログは、データがアクセスされた Google Cloud プロジェクトに書き込まれます。これらのログを有効にすると、 Google Cloud プロジェクトに対して追加のログ使用料が請求される可能性があります。データアクセス監査ログを有効にして構成する手順については、[データアクセス監査ログを有効にする](https://docs.cloud.google.com/logging/docs/audit/configure-data-access?hl=ja)をご覧ください。

データアクセス監査ログを書き込むサービスのリストと、それらのログを生成するアクティビティの詳細については、[監査ログを使用するGoogle Cloud サービス](https://docs.cloud.google.com/logging/docs/audit/services?hl=ja)をご覧ください。

別の場所に転送されない限り、データアクセス監査ログは、[`_Default`{dir="ltr" translate="no"}](https://docs.cloud.google.com/logging/docs/store-log-entries?hl=ja#default-bucket) ログバケットに保存されます。詳細については、このページの[監査ログの保存と転送](#storing_and_routing_audit_logs)をご覧ください。

### システム イベント監査ログ {#system-event data-text="システム イベント監査ログ" tabindex="-1"}

システム イベント監査ログは、リソースの構成を変更する Google Cloud システムによって書き込まれるログエントリです。システム イベント監査ログは、ユーザーの直接的なアクションによって生成されることはありません。たとえば、自動スケーリングによりマネージド インスタンス グループ（MIG）に対して VM が自動的に追加または削除されると、システム イベント監査ログが書き込まれます。

システム イベント監査ログは常に書き込まれます。構成したり、除外したり、無効にすることはできません。

システム イベント監査ログを書き込むサービスのリストと、それらのログを生成するアクティビティの詳細については、[監査ログを備えたGoogle Cloud サービス](https://docs.cloud.google.com/logging/docs/audit/services?hl=ja)をご覧ください。

### ポリシー拒否監査ログ {#policy_denied data-text="ポリシー拒否監査ログ" tabindex="-1"}

ポリシー拒否監査ログは、セキュリティ ポリシー違反が原因で Google Cloud サービスがユーザー アカウントまたは[サービス アカウント](https://docs.cloud.google.com/iam/docs/service-accounts?hl=ja)のアクセスを拒否した場合に書き込まれるログエントリです。

ポリシー拒否監査ログはデフォルトで生成され、Google Cloud プロジェクトにはログストレージの料金が発生します。ポリシー拒否監査ログを無効にすることはできませんが、[除外フィルタ](https://docs.cloud.google.com/logging/docs/routing/overview?hl=ja#exclusions)を使用して、ポリシー拒否監査ログの Cloud Logging への保存を防ぐことはできます。

ポリシー拒否監査ログを書き込むサービスのリストと、それらのログを生成するアクティビティの詳細については、[監査ログを備えたGoogle Cloud サービス](https://docs.cloud.google.com/logging/docs/audit/services?hl=ja)をご覧ください。

## 監査ログエントリの構造 {#audit_log_entry_structure data-text="監査ログエントリの構造" tabindex="-1"}

Cloud Logging では、監査ログエントリはすべて [`LogEntry`{dir="ltr" translate="no"}](https://docs.cloud.google.com/logging/docs/reference/v2/rest/v2/LogEntry?hl=ja) タイプのオブジェクトになります。監査ログエントリと他のログエントリを区別するのは、`protoPayload`{dir="ltr" translate="no"} フィールドです。このフィールドには、監査ロギングデータを格納する [`AuditLog`{dir="ltr" translate="no"}](https://docs.cloud.google.com/logging/docs/audit/api/ref/rest/Shared.Types/AuditLog?hl=ja) オブジェクトが含まれています。

監査ログエントリの読み取りと解釈の方法と、監査ログエントリのサンプルについては、[監査ログについて](https://docs.cloud.google.com/logging/docs/audit/understanding-audit-logs?hl=ja)をご覧ください。

### ログ名 {#log_name data-text="ログ名" tabindex="-1"}

Cloud Audit Logs のログ名は次のとおりです。

- 監査ログを所有する Google Cloud プロジェクトまたは他の Google Cloud エンティティを示すリソース識別子。

- 文字 `cloudaudit.googleapis.com`{dir="ltr" translate="no"}。

- ログに管理アクティビティ、データアクセス、ポリシー拒否、システム イベントの監査ロギングデータが含まれているかどうかを示す文字列。

リソース識別子の変数を含む監査ログ名は次のとおりです。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded="" syntax="SQL"}
   projects/PROJECT_ID/logs/cloudaudit.googleapis.com%2Factivity
   projects/PROJECT_ID/logs/cloudaudit.googleapis.com%2Fdata_access
   projects/PROJECT_ID/logs/cloudaudit.googleapis.com%2Fsystem_event
   projects/PROJECT_ID/logs/cloudaudit.googleapis.com%2Fpolicy

   folders/FOLDER_ID/logs/cloudaudit.googleapis.com%2Factivity
   folders/FOLDER_ID/logs/cloudaudit.googleapis.com%2Fdata_access
   folders/FOLDER_ID/logs/cloudaudit.googleapis.com%2Fsystem_event
   folders/FOLDER_ID/logs/cloudaudit.googleapis.com%2Fpolicy

   billingAccounts/BILLING_ACCOUNT_ID/logs/cloudaudit.googleapis.com%2Factivity
   billingAccounts/BILLING_ACCOUNT_ID/logs/cloudaudit.googleapis.com%2Fdata_access
   billingAccounts/BILLING_ACCOUNT_ID/logs/cloudaudit.googleapis.com%2Fsystem_event
   billingAccounts/BILLING_ACCOUNT_ID/logs/cloudaudit.googleapis.com%2Fpolicy

   organizations/ORGANIZATION_ID/logs/cloudaudit.googleapis.com%2Factivity
   organizations/ORGANIZATION_ID/logs/cloudaudit.googleapis.com%2Fdata_access
   organizations/ORGANIZATION_ID/logs/cloudaudit.googleapis.com%2Fsystem_event
   organizations/ORGANIZATION_ID/logs/cloudaudit.googleapis.com%2Fpolicy
```

## 監査ログの呼び出し元 ID {#user-id data-text="監査ログの呼び出し元 ID" tabindex="-1"}

監査ログには、ログに記録されたオペレーションをGoogle Cloud リソースに対して実行した ID が記録されます。呼び出し元の ID は、[`AuditLog`{dir="ltr" translate="no"}](https://docs.cloud.google.com/logging/docs/audit/api/ref/rest/Shared.Types/AuditLog?hl=ja) オブジェクトの `AuthenticationInfo`{dir="ltr" translate="no"} フィールドに保持されます。

成功したアクセスや書き込みオペレーションの呼び出し元のメールアドレスは、監査ロギングによって編集されません。

「権限が拒否されました」というエラーで失敗した読み取り専用オペレーションの場合、Audit Logging で呼び出し元の主要メールアドレスを秘匿化する必要があります（呼び出し元がサービス アカウントである場合を除く）。

特定のGoogle Cloud サービスには、上記の条件に加えて以下が適用されます。

- [以前の App Engine API:](https://docs.cloud.google.com/appengine/docs?hl=ja) ID は収集されません。

<!-- -->

- [BigQuery](https://docs.cloud.google.com/bigquery/docs/reference/auditlogs?hl=ja#ids): 特定の条件が満たされない限り、発信者の ID と IP アドレスに加えて、一部のリソース名が監査ログから削除されます。

- [Cloud Storage](https://docs.cloud.google.com/storage/docs/access-logs?hl=ja): Cloud Storage の使用状況ログが有効になっている場合、Cloud Storage は Cloud Storage バケットに使用状況データを書き込みます。これにより、バケットのデータアクセスの監査ログが生成されます。生成されたデータアクセスの監査ログには、呼び出し元の ID が含まれます。

<!-- -->

- [Firestore](https://docs.cloud.google.com/firestore/docs/audit-logging?hl=ja): サードパーティの認証に JSON ウェブトークン（JWT）が使用された場合、`thirdPartyPrincipal`{dir="ltr" translate="no"} フィールドにはトークンのヘッダーとペイロードが含まれます。たとえば、[Firebase Authentication](https://firebase.google.com/docs/auth?hl=ja) で認証されたリクエストの監査ログには、そのリクエストの[認証トークン](https://firebase.google.com/docs/auth/users?hl=ja#auth_tokens)が含まれます。

<!-- -->

- [VPC Service Controls](https://docs.cloud.google.com/vpc-service-controls/docs/audit-logging?hl=ja): ポリシー拒否監査ログの場合、次の秘匿化が行われます。

  - 発信者のメールアドレスの一部が秘匿化されて、3 つのピリオド文字 `...`{dir="ltr" translate="no"} に置き換えられます。

  - ドメイン `google.com`{dir="ltr" translate="no"} に属する一部の呼び出し元メールアドレスが秘匿化されて、`google-internal`{dir="ltr" translate="no"} に置き換えられます。

<!-- -->

- [組織のポリシー](https://docs.cloud.google.com/resource-manager/docs/organization-policy/audit-logging?hl=ja): 発信者のメールアドレスの一部が秘匿化されて、3 つのピリオド文字 `...`{dir="ltr" translate="no"} に置き換えられます。

## 監査ログの呼び出し元の IP アドレス {#caller-ip data-text="監査ログの呼び出し元の IP アドレス" tabindex="-1"}

呼び出し元の IP アドレスは、[`AuditLog`{dir="ltr" translate="no"}](https://docs.cloud.google.com/logging/docs/audit/api/ref/rest/Shared.Types/AuditLog?hl=ja) オブジェクトの `RequestMetadata.callerIp`{dir="ltr" translate="no"} フィールドに保持されます。

- インターネットからの呼び出し元の場合、このアドレスはパブリック IPv4 またはパブリック IPv6 アドレスです。
- 内部の本番環境ネットワーク内で 1 つのGoogle Cloud サービスから他の Google Cloud サービスに対して行われた呼び出しの場合、`callerIp`{dir="ltr" translate="no"} は「private」に秘匿化されます。
- 外部 IP アドレスを持つ Compute Engine VM から呼び出し元を呼び出す場合、`callerIp`{dir="ltr" translate="no"} は VM の外部アドレスです。
- 外部 IP アドレスのない Compute Engine VM からの呼び出し元の場合、VM がアクセス先のリソースと同じ組織またはプロジェクトにあると、`callerIp`{dir="ltr" translate="no"} は VM の内部 IPv4 アドレスです。それ以外の場合、`callerIp`{dir="ltr" translate="no"} は「gce-internal-ip」に秘匿化されます。詳細については、[VPC ネットワークの概要](https://docs.cloud.google.com/compute/docs/vpc?hl=ja)をご覧ください。

## 監査ログの表示 {#view-logs data-text="監査ログの表示" tabindex="-1"}

すべての監査ログに対してクエリを実行することも、監査ログ名でログをクエリすることもできます。監査ログ名には、監査ロギング情報を表示する Google Cloud プロジェクト、フォルダ、請求先アカウント、または組織の[リソース識別子](https://docs.cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja#identifying_projects)が含まれています。クエリでは、インデックス付きの [`LogEntry`{dir="ltr" translate="no"}](https://docs.cloud.google.com/logging/docs/reference/v2/rest/v2/LogEntry?hl=ja) フィールドを指定できます。ログのクエリの詳細については、[ログ エクスプローラでクエリを作成する](https://docs.cloud.google.com/logging/docs/view/building-queries?hl=ja)をご覧ください。

ログ エクスプローラでは、個々のログエントリをフィルタして表示できます。SQL を使用してログエントリのグループを分析する場合は、\[**ログ分析**\] ページを使用します。詳しくは以下をご覧ください。

- [ログ分析でログをクエリして表示する](https://docs.cloud.google.com/logging/docs/analyze/query-and-view?hl=ja)。
- [セキュリティ分析情報のサンプルクエリ](https://docs.cloud.google.com/logging/docs/analyze/analyze-audit-logs?hl=ja)。
- [クエリ結果をグラフ化する](https://docs.cloud.google.com/logging/docs/analyze/charts?hl=ja)。

ほとんどの監査ログは、Google Cloud コンソール、Google Cloud CLI、または Logging API を使用して Cloud Logging で表示できます。ただし、課金に関連する監査ログの場合は、Google Cloud CLI または Logging API のみを使用できます。

:::::::::: {#logging_add_log_view_binding-code-sample .ds-selector-tabs ds-scope="code-sample"}
::: section
### コンソール {#logging_add_log_view_binding-console data-text="コンソール" tabindex="-1" track-metadata-position="logging_add_log_view_binding"}

Google Cloud コンソールでは、ログ エクスプローラを使用して、 Google Cloud プロジェクト、フォルダ、または組織の監査ログエントリを取得できます。

**注:** Cloud 請求先アカウントの監査ログは、Google Cloud コンソールには表示できません。API または gcloud CLI を使用する必要があります。

1.  Google Cloud コンソールで \[**ログ エクスプローラ**\] ページに移動します。

    [\[**ログ エクスプローラ**\] に移動](https://console.cloud.google.com/logs/query?hl=ja){.button .button-primary =\"\"="" target="console" track-metadata-event-detail="logs/query" track-metadata-position="body" track-name="consoleLink" track-type="task"}

    このページを検索バーで検索する場合は、小見出しが「**Logging**」の結果を選択します。

2.  既存の Google Cloud プロジェクト、フォルダ、または組織を選択します。

3.  すべての監査ログを表示するには、次のいずれかのクエリを \[クエリエディタ\] フィールドに入力し、\[**クエリを実行**\] をクリックします。

    ::: {}
    :::

    ``` {.notranslate .devsite-click-to-copy dir="ltr" is-upgraded=""}

    logName:"cloudaudit.googleapis.com"
    ```

    ::: {}
    :::

    ``` {.notranslate .devsite-click-to-copy dir="ltr" is-upgraded=""}

    protoPayload."@type"="type.googleapis.com/google.cloud.audit.AuditLog"
    ```

4.  特定のリソースと監査ログタイプの監査ログを表示するには、\[**クエリビルダー**\] ペインで次の操作を行います。

    - \[**リソースタイプ**\] で、表示する監査ログを含む Google Cloud リソースを選択します。

    - \[**ログ名**\] で、表示する監査ログタイプを選択します。

      - 管理アクティビティ監査ログの場合は、\[**activity**\] を選択します。
      - データアクセス監査ログの場合は、\[**data_access**\] を選択します。
      - システム イベント監査ログの場合は、\[**system_event**\] を選択します。
      - ポリシー拒否監査ログの場合は、\[**policy**\] を選択します。

    - \[**クエリを実行**\] をクリックします。

    これらのオプションが表示されない場合、 Google Cloud プロジェクト、フォルダ、または組織で利用可能なその種類の監査ログは存在しないことを意味します。

    ログ エクスプローラでログを表示する際に問題が発生した場合は、[トラブルシューティング](https://docs.cloud.google.com/logging/docs/view/logs-explorer-interface?hl=ja#troubleshooting)の情報をご覧ください。

    ログ エクスプローラを使用したクエリの詳細については、[ログ エクスプローラでクエリを作成する](https://docs.cloud.google.com/logging/docs/view/building-queries?hl=ja)をご覧ください。
:::

::::::: section
### [gcloud]{.notranslate} {#logging_add_log_view_binding-gcloud data-text="gcloud" tabindex="-1" track-metadata-position="logging_add_log_view_binding"}

Google Cloud CLI は、Logging API へのコマンドライン インターフェースを提供します。ログ名ごとに有効なリソース識別子を指定します。たとえば、クエリに `PROJECT_ID`{.variable translate="no"} が含まれている場合、指定するプロジェクト ID は、現在選択されたGoogle Cloud プロジェクトを参照している必要があります。

Google Cloud プロジェクト レベルの監査ログエントリを読み取るには、次のコマンドを実行します。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded=""}

gcloud logging read "logName : projects/PROJECT_ID/logs/cloudaudit.googleapis.com" \
    --project=PROJECT_ID
```

フォルダレベルの監査ログエントリを読み取るには、次のコマンドを実行します。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded=""}

gcloud logging read "logName : folders/FOLDER_ID/logs/cloudaudit.googleapis.com" \
    --folder=FOLDER_ID
```

組織レベルの監査ログエントリを読み取るには、次のコマンドを実行します。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded=""}

gcloud logging read "logName : organizations/ORGANIZATION_ID/logs/cloudaudit.googleapis.com" \
    --organization=ORGANIZATION_ID
```

Cloud 請求先アカウント レベルの監査ログエントリを読み取るには、次のコマンドを実行します。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded=""}

gcloud logging read "logName : billingAccounts/BILLING_ACCOUNT_ID/logs/cloudaudit.googleapis.com" \
    --billing-account=BILLING_ACCOUNT_ID
```

1 日以上経過したログを読み取るには、コマンドに [`--freshness`{dir="ltr" translate="no"} フラグ](https://docs.cloud.google.com/sdk/gcloud/reference/logging/read?hl=ja#--freshness)を追加します。

gcloud CLI の使用方法に関する詳細については、[`gcloud logging read`{dir="ltr" translate="no"}](https://docs.cloud.google.com/sdk/gcloud/reference/logging/read?hl=ja) をご覧ください。
:::::::

::: section
### [REST]{.notranslate} {#logging_add_log_view_binding-rest data-text="REST" tabindex="-1" track-metadata-position="logging_add_log_view_binding"}

クエリを作成するときは、ログ名ごとに有効なリソース識別子を指定します。たとえば、クエリに `PROJECT_ID`{.variable translate="no"} が含まれている場合、指定するプロジェクト ID は、現在選択されたGoogle Cloud プロジェクトを参照している必要があります。

たとえば、Logging API を使用してプロジェクト レベルの監査ログエントリを表示する手順は次のとおりです。

1.  [`entries.list`{dir="ltr" translate="no"}](https://docs.cloud.google.com/logging/docs/reference/v2/rest/v2/entries/list?hl=ja) メソッドのドキュメント内の \[**Try this API**\] セクションに移動します。

2.  \[**Try this API**\] フォームの**リクエストの本文**に、次のコードを入力します。この[事前入力されたフォーム](https://docs.cloud.google.com/logging/docs/reference/v2/rest/v2/entries/list?apix_params=%7B%22resource%22%3A%7B%22resourceNames%22%3A%5B%22projects%2F%5BPROJECT_ID%5D%22%5D%2C%22pageSize%22%3A5%2C%22filter%22%3A%22logName%3D%28projects%2F%5BPROJECT_ID%5D%2Flogs%2Fcloudaudit.googleapis.com%252Factivity+OR+projects%2F%5BPROJECT_ID%5D%2Flogs%2Fcloudaudit.googleapis.com%252Fsystem_events+OR+projects%2F%5BPROJECT_ID%5D%2Flogs%2Fcloudaudit.googleapis.com%252Fdata_access%29%22%7D%7D&hl=ja)をクリックすると、リクエストの本文が自動的に入力されますが、それぞれのログ名に有効な `PROJECT_ID`{.variable translate="no"} を指定する必要があります。

    ::: {}
    :::

    ``` {.devsite-click-to-copy lang-html="" translate="no" dir="ltr" is-upgraded=""}

    {
      "resourceNames": [
        "projects/PROJECT_ID"
      ],
      "pageSize": 5,
      "filter": "logName : projects/PROJECT_ID/logs/cloudaudit.googleapis.com"
    }
    ```

3.  \[**実行**\] をクリックします。
:::
::::::::::

## 監査ログの保存と転送 {#storing_and_routing_audit_logs data-text="監査ログの保存と転送" tabindex="-1"}

Cloud Logging では、ログデータを保存して整理するためのコンテナとして[ログバケット](https://docs.cloud.google.com/logging/docs/store-log-entries?hl=ja)を使用します。請求先アカウント、Google Cloud プロジェクト、フォルダ、組織ごとに、Logging によって自動的に `_Required`{dir="ltr" translate="no"} と `_Default`{dir="ltr" translate="no"} という 2 つのログバケットと、対応する名前の[シンク](https://docs.cloud.google.com/logging/docs/routing/overview?hl=ja#sinks)が作成されます。

Cloud Logging の `_Required`{dir="ltr" translate="no"} バケットには、管理アクティビティ監査ログとシステム イベント監査ログが保存されます。管理アクティビティまたはシステム イベントの監査ログの保存を無効にすることはできません。また、ログエントリを `_Required`{dir="ltr" translate="no"} バケットに転送するシンクを構成することもできません。

管理アクティビティ監査ログとシステム イベント監査ログは常に、ログが生成されたプロジェクトの `_Required`{dir="ltr" translate="no"} バケットに保存されます。

管理アクティビティ監査ログとシステム イベント監査ログを別のプロジェクトに転送すると、それらのログは、宛先プロジェクトの `_Default`{dir="ltr" translate="no"} シンクまたは `_Required`{dir="ltr" translate="no"} シンクをパススルーしません。したがって、これらのログは、宛先プロジェクトの `_Default`{dir="ltr" translate="no"} ログバケットまたは `_Required`{dir="ltr" translate="no"} ログバケットに保存されません。これらのログを保存するには、宛先プロジェクトにログシンクを作成します。詳細については、[サポートされている宛先にログを転送する](https://docs.cloud.google.com/logging/docs/export/configure_export_v2?hl=ja)をご覧ください。

`_Default`{dir="ltr" translate="no"} バケットは、デフォルトで有効なデータアクセス監査ログとポリシー拒否監査ログを保存します。データアクセス監査ログが `_Default`{dir="ltr" translate="no"} バケットに保存されないようにするには、ログを無効にします。ポリシー拒否監査ログが `_Default`{dir="ltr" translate="no"} バケットに保存されないようにするには、シンクのフィルタを変更してポリシー拒否監査ログを除外します。

監査ログエントリを、 Google Cloud プロジェクト レベルでユーザー定義の Cloud Logging バケットに転送したり、シンクを使用して Logging の外部でサポートされている宛先に転送することもできます。ログの転送手順については、[サポートされている宛先にログを転送する](https://docs.cloud.google.com/logging/docs/export/configure_export_v2?hl=ja)をご覧ください。

ログシンクのフィルタを構成するときは、転送する監査ログの種類を指定する必要があります。フィルタリング例については、[セキュリティ ロギングのクエリ](https://docs.cloud.google.com/logging/docs/view/query-library?hl=ja#security-filters)をご覧ください。

Google Cloud 組織、フォルダ、請求先アカウントとその子に対する監査ログエントリを転送する場合は、[集約シンクの概要](https://docs.cloud.google.com/logging/docs/export/aggregated_sinks_overview?hl=ja)をご覧ください。

## 監査ログの保持期間 {#audit_log_retention data-text="監査ログの保持期間" tabindex="-1"}

Logging でログエントリが保持される期間の詳細については、[割り当てと上限: ログの保持期間](https://docs.cloud.google.com/logging/quotas?hl=ja#logs_retention_periods)で保持情報をご覧ください。

## アクセス制御 {#access-control data-text="アクセス制御" tabindex="-1"}

IAM の権限とロールによって、[Logging API](https://docs.cloud.google.com/logging/docs/reference/v2/rest?hl=ja)、[ログ エクスプローラ](https://docs.cloud.google.com/logging/docs/view/logs-explorer-interface?hl=ja)、[Google Cloud CLI](https://docs.cloud.google.com/logging/docs/reference/tools/gcloud-logging?hl=ja)内の監査ログデータにアクセス可能かどうか判断されます。

必要となる IAM の権限とロールの詳細については、[IAM によるアクセス制御](https://docs.cloud.google.com/logging/docs/access-control?hl=ja)をご覧ください。

## 割り当てと上限 {#quotas data-text="割り当てと上限" tabindex="-1"}

監査ログの最大サイズを含む、ロギングの使用量上限について詳しくは、[割り当てと上限](https://docs.cloud.google.com/logging/quotas?hl=ja)をご覧ください。

## 料金 {#pricing data-text="料金" tabindex="-1"}

料金情報については、[Google Cloud Observability の料金](https://cloud.google.com/products/observability/pricing?hl=ja)のページをご覧ください。ログデータを他の Google Cloud サービスにルーティングする場合は、次のドキュメントをご覧ください。

- [Cloud Storage の料金](https://cloud.google.com/storage/pricing?hl=ja)
- [BigQuery の料金](https://cloud.google.com/bigquery/pricing?hl=ja#data_ingestion_pricing)
- [Pub/Sub の料金](https://cloud.google.com/pubsub/pricing?hl=ja)

## 次のステップ {#whats_next data-text="次のステップ" tabindex="-1"}

- [監査ログの読み取りと解釈](https://docs.cloud.google.com/logging/docs/audit/understanding-audit-logs?hl=ja)の方法を学習する。
- [データアクセス監査ログを有効にする](https://docs.cloud.google.com/logging/docs/audit/configure-data-access?hl=ja)方法を学習する。
- Cloud Audit Logs の[ベスト プラクティス](https://docs.cloud.google.com/logging/docs/audit/best-practices?hl=ja)を確認する。

<!-- -->

- [アクセスの透明性](https://docs.cloud.google.com/assured-workloads/access-transparency/docs/overview?hl=ja)について学習する。アクセスの透明性では、 Google Cloud のスタッフがお客様の Google Cloud コンテンツにアクセスしたときに行ったアクションのログが提供されます。
:::::::::::::

フィードバックを送信

::: devsite-floating-action-buttons
:::

特に記載のない限り、このページのコンテンツは[クリエイティブ・コモンズの表示 4.0 ライセンス](https://creativecommons.org/licenses/by/4.0/)により使用許諾されます。コードサンプルは [Apache 2.0 ライセンス](https://www.apache.org/licenses/LICENSE-2.0)により使用許諾されます。詳しくは、[Google Developers サイトのポリシー](https://developers.google.com/site-policies?hl=ja)をご覧ください。Java は Oracle および関連会社の登録商標です。

最終更新日 2026-01-31 UTC。

::: devsite-content-data
ご意見をお聞かせください

\[\[\[\"わかりやすい\",\"easyToUnderstand\",\"thumb-up\"\],\[\"問題の解決に役立った\",\"solvedMyProblem\",\"thumb-up\"\],\[\"その他\",\"otherUp\",\"thumb-up\"\]\],\[\[\"わかりにくい\",\"hardToUnderstand\",\"thumb-down\"\],\[\"情報またはサンプルコードが不正確\",\"incorrectInformationOrSampleCode\",\"thumb-down\"\],\[\"必要な情報 / サンプルがない\",\"missingTheInformationSamplesINeed\",\"thumb-down\"\],\[\"翻訳に関する問題\",\"translationIssue\",\"thumb-down\"\],\[\"その他\",\"otherDown\",\"thumb-down\"\]\],\[\"最終更新日 2026-01-31 UTC。\"\],\[\],\[\]\]
:::
:::::::::::::::::::
