---
source_url: "https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy?hl=ja"
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

  [Security](https://docs.cloud.google.com/docs/security?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="3" track-type="globalNav" track-name="breadcrumb" track-metadata-position="3" track-metadata-eventdetail="Security"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [Resource Manager](https://docs.cloud.google.com/resource-manager/docs?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="4" track-type="globalNav" track-name="breadcrumb" track-metadata-position="4" track-metadata-eventdetail="Resource Manager"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [ガイド](https://docs.cloud.google.com/resource-manager/docs/resource-manager-overview?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="5" track-type="globalNav" track-name="breadcrumb" track-metadata-position="5" track-metadata-eventdetail=""}
:::

フィードバックを送信

# リソース階層について [ コレクションでコンテンツを整理 ]{slot="popout-heading"} [ 必要に応じて、コンテンツの保存と分類を行います。 ]{slot="popout-contents"} {#リソース階層について-コレクションでコンテンツを整理-必要に応じてコンテンツの保存と分類を行います .devsite-page-title tabindex="-1"}

:::::: {.devsite-article-body .clearfix}
Google Cloud リソース階層は、クラウド リソースを構造化して整理する方法を提供します。階層内の最上位リソースを除き、すべてのリソースの親は 1 つだけです。階層は、最上位の*組織*（ルート）、グループ化用の*フォルダ*（省略可）、Compute Engine 仮想マシンやストレージ バケットなどの実際のサービス リソースを含む*プロジェクト*で構成されます。

構造化された階層を使用すると、次のようなメリットがあります。

- **所有権**: リソースのライフサイクルを直接の親にバインドします。プロジェクトは、作成した個々の従業員ではなく、組織に属します。従業員が退職しても、プロジェクトはアクティブで安全な状態を維持します。
- **継承**: アクセス制御ポリシーと組織ポリシーのアタッチメント ポイントを提供し、階層の下部まで継承できるようにします。上位レベル（組織やフォルダなど）でロールを付与できます。これらのロールはすべての子リソースに継承されるため、個々のプロジェクトごとに権限を手動で構成する必要がなくなります。

次の図は、 Google Cloud リソース階層を示しています。

![Google Cloud リソース階層。最上位に組織があり、その下にフォルダ、プロジェクト、サービス リソースがある](https://docs.cloud.google.com/static/resource-manager/img/cloud-hierarchy.svg?hl=ja)

**注:** Google Cloudを初めて使用する場合は、[Google Cloud 設定プロセス](https://docs.cloud.google.com/docs/enterprise/setup-checklist?hl=ja)の一部として、リソース階層を設定し、初期アクセス権を付与できます。

## 組織リソース {#organizations data-text="組織リソース" tabindex="-1"}

[組織](https://docs.cloud.google.com/resource-manager/reference/rest/v3/organizations?hl=ja)リソースは、エンティティ（会社など）を表し、Google Cloud リソース階層のルートノードとして機能します。主な機能は次のとおりです。

- 組織は、すべてのフォルダとプロジェクト リソースの親として機能します。
- このレベルで適用されたアクセス制御ポリシー（Identity and Access Management（IAM）ロールなど）と組織のポリシーは、組織内のすべてのリソースに継承されます。
- すべての Google Cloud ユーザーに組織リソースが必須というわけではありませんが、特定の Resource Manager 機能を使用するには組織リソースが必要です。

### Google Workspace アカウントまたは Cloud Identity アカウントとの関連付け {#link-with-g-suite-or-cloud-id-accounts data-text="Google Workspace アカウントまたは Cloud Identity アカウントとの関連付け" tabindex="-1"}

組織リソースにアクセスするには、[Google Workspace](https://gsuite.google.com?hl=ja) アカウントまたは [Cloud Identity](https://docs.cloud.google.com/identity?hl=ja) アカウントが必要です。

- Google Workspace アカウントまたは Cloud Identity アカウントには、それぞれ 1 つの組織リソースが関連付けられます。
- Google Workspace アカウントや Cloud Identity アカウントを持つユーザーが Google Cloud プロジェクト リソースを作成すると、組織リソースが自動的にプロビジョニングされます。

次の図は、Google Workspace アカウント、Cloud Identity、 Google Cloud リソース階層の関係を示しています。

![Google Workspace アカウントまたは Cloud Identity アカウントと Google Cloud リソース階層の関係](https://docs.cloud.google.com/static/resource-manager/img/cloud-hierarchy-workspace.svg?hl=ja)

Google Workspace 特権管理者はドメインの所有権を確認する責任者で、復旧時の連絡窓口となります。このため、Google Workspace 特権管理者にはデフォルトで IAM ロールの割り当て権限が付与されます。 Google Cloud に関する Google Workspace 特権管理者の主なロールは、組織管理者の IAM ロールをドメイン内の適切なユーザーに割り当てることです。これにより、ユーザーが一般的に求めている Google Workspace と Google Cloudの管理責任の分離がなされます。

**管理対象ユーザーのプロジェクト作成ルール**

ドメインに組織リソースが存在する場合、プロジェクトの作成には厳格なルールが適用されます。

- 管理対象ユーザー（アカウント ドメインのメンバー）は、組織内にプロジェクトを作成する必要があります。組織リソースに関連付けられているアカウントが、組織リソースに関連付けられていないプロジェクト リソースを作成することはできません。
- デフォルトでは、新しいプロジェクトはユーザーに関連付けられている組織に属します。
- 適切な権限を持つユーザーは、プロジェクトの作成時に別の組織リソースを指定できます。指定しない場合は、デフォルトでホーム組織になります。

### 組織リソースのメリット {#benefits_of_the_organization_resource data-text="組織リソースのメリット" tabindex="-1"}

組織リソースを使用する場合、プロジェクト リソースはそれを作成した従業員ではなく組織に属します。つまり、従業員が退職しても、組織はプロジェクト リソースを保持します。プロジェクト リソースは、 Google Cloudの組織リソースのライフサイクルに沿って管理されます。

また、組織管理者はすべてのリソースを一元的に管理します。会社内のすべてのプロジェクト リソースを表示して管理できます。これにより、シャドー プロジェクトや不正な管理者を防ぐことができます。

組織レベルでロールを付与することもできます。この場合、組織リソースの下にあるすべてのプロジェクト リソースとフォルダ リソースがロールを継承します。たとえば、組織レベルで**ネットワーク管理者**のロールをネットワーキング チームに付与することで、個々のプロジェクト リソースに対するロールを付与する代わりに、会社内のすべてのプロジェクト リソースに含まれるすべてのネットワークをこのネットワーキング チームが管理できるようになります。

組織リソースは、次の属性で定義されます。

- 組織を一意に表す識別子である組織リソース ID。
- 表示名。Google Workspace または Cloud Identity のプライマリ ドメイン名から生成されます。
- 組織リソースの作成時刻。
- 組織リソースの最終更新時刻。
- 組織リソースのオーナー。これは、[Directory API](https://developers.google.com/admin-sdk/directory/?hl=ja) の Google Workspace お客様 ID です。オーナーは組織リソースの作成時に指定し、変更することはできません。

次のコード スニペットは、組織リソースの構造を示します。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded="" syntax="Text only" syntax-guessed=""}
{
  "creationTime": "2020-01-07T21:59:43.314Z",
  "displayName": "my-organization",
  "lifecycleState": "ACTIVE",
  "name": "organizations/34739118321",
  "owner": {
    "directoryCustomerId": "C012ba234"
  }
}
```

新しい組織リソースの最初の許可ポリシーは、Google Workspace ドメインの全体にプロジェクト作成者ロールと請求先アカウント作成者ロールを付与します。これにより、ユーザーは組織リソースの存在前と同様にプロジェクト リソースと請求先アカウントを作成できます。組織リソースの作成時に、他のリソースは作成されません。許可ポリシー、拒否ポリシー、組織のポリシーは階層から継承されます。階層内の各リソースで有効なポリシーは、リソースに直接適用されるポリシーと、祖先から継承されたポリシーを組み合わせたものになります。

## フォルダ リソース {#folders data-text="フォルダ リソース" tabindex="-1"}

フォルダ リソースは、組織リソースとプロジェクト リソースの間に位置するオプションのグループ化メカニズムです。フォルダを使用するには、組織リソースが必要です。フォルダ リソースとその子プロジェクト リソースは、組織リソースの下に存在します。

フォルダ リソースを使用すると、プロジェクト間の分離境界を作成できます。組織リソース内のサブ組織として機能します。フォルダ リソースを使用すると、社内のさまざまな法人、部門、チームをモデル化できます。たとえば、最初のレベルのフォルダで、組織の主要部門を表すことができます。フォルダにはプロジェクトや他のフォルダを含めることができるため、各フォルダにサブフォルダを含めて別のチームを表すことができます。各チームのフォルダには、アプリケーションを表す追加のサブフォルダを含めることができます。フォルダ リソースの使用について詳しくは、[フォルダを作成する](https://docs.cloud.google.com/resource-manager/docs/creating-managing-folders?hl=ja)をご覧ください。

組織リソースにフォルダ リソースがあり、適切な表示権限がある場合は、 Google Cloud コンソールにリソースが表示されます。詳細な手順については、[フォルダの表示、更新、削除](https://docs.cloud.google.com/resource-manager/docs/manage-folders?hl=ja)をご覧ください。

フォルダリソースを使用すると、管理権限を委任できます。たとえば、部門の各責任者に、その部門のすべての Google Cloud リソースに対する完全なオーナー権限を付与できます。同様に、フォルダリソースによってリソースに対するアクセス権を制限できます。つまり、ある部門のユーザーは、その部門のフォルダリソース内のリソースでのみアクセスと作成が許可されます。 Google Cloud

次のコード スニペットはフォルダ　リソースの構造を示します。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded="" syntax="Text only" syntax-guessed=""}
{
  "createTime": "2030-01-07T21:59:43.314Z",
  "displayName": "Engineering",
  "lifecycleState": "ACTIVE",
  "name": "folders/634792535758",
  "parent": "organizations/34739118321"
}
```

組織リソースやプロジェクト リソースと同様に、フォルダ リソースは許可ポリシー、拒否ポリシー、組織のポリシーの継承ポイントとして機能します。フォルダ リソースに付与された IAM ロールは、そのフォルダ内のすべてのプロジェクト リソースとフォルダ リソースに継承されます。

## プロジェクト リソース {#projects data-text="プロジェクト リソース" tabindex="-1"}

プロジェクト リソースは、基本的な構成エンティティです。組織リソースとフォルダ リソースには、複数のプロジェクトを含めることができます。 Google Cloudを使用するには、プロジェクト リソースが必要です。すべてのGoogle Cloud サービスの作成、有効化、使用、API の管理、課金の有効化、共同編集者の追加と削除、権限の管理に不可欠です。

すべてのプロジェクト リソースは次の要素で構成されます。

- 2 つの識別子:
  1.  プロジェクト リソース ID。これはプロジェクト リソースの一意の識別子です。
  2.  プロジェクト　リソース番号。プロジェクトを作成するときに自動的に割り当てられた番号です。これは読み取り専用です。
- 1 つの変更可能な表示名
- プロジェクト　リソースのライフサイクルの状態。例: ACTIVE、DELETE_REQUESTED。
- プロジェクトのフィルタリングに使用できるラベルのコレクション。
- プロジェクト　リソースが作成された時刻。

次のコード スニペットはプロジェクト　リソースの構造を示します。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded="" syntax="Carbon" syntax-guessed=""}
{
  "createTime": "2020-01-07T21:59:43.314Z",
  "lifecycleState": "ACTIVE",
  "name": "my-project",
  "parent": {
    "id": "634792535758",
    "type": "folder"
  },
  "projectId": "my-project",
  "labels": {
     "my-label": "prod"
  },
  "projectNumber": "464036093014"
}
```

ほとんどの Google Cloud リソースを操作するには、リクエストごとにプロジェクト リソース識別子を指定する必要があります。プロジェクト リソースは、プロジェクト リソース ID またはプロジェクト リソース番号のいずれかで識別できます。コード スニペットでは、これらは `projectId`{dir="ltr" translate="no"} と `projectNumber`{dir="ltr" translate="no"} です。

プロジェクト リソース ID は、プロジェクトの作成時に選択したカスタマイズされた名前です。プロジェクトが必要な API を有効にする場合は、新しいプロジェクトを作成するか、プロジェクト リソース ID を使用して既存のプロジェクトを選択できます。UI に表示される `name`{dir="ltr" translate="no"} 文字列はプロジェクト リソース ID と同じではありません。

Google Cloud はプロジェクト リソース番号を自動的に生成します。プロジェクト リソース ID と番号は、Google Cloud コンソールのプロジェクトのダッシュボードで確認できます。プロジェクト識別子の取得方法やプロジェクト リソースの他の管理タスクの詳細については、[プロジェクトを作成する](https://docs.cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja)をご覧ください。

新しく作成されたプロジェクト リソース用の最初の IAM ポリシーは、プロジェクト作成者にオーナーのロールを付与します。

無料トライアル ユーザー、無料枠ユーザー、Google Workspace と Cloud Identity のお客様を含むすべてのユーザーが、プロジェクト リソースを作成できます。[Google Cloud 無料プログラム](https://docs.cloud.google.com/free/docs/free-cloud-features?hl=ja)のユーザーは、プロジェクト内でプロジェクト リソースとサービス リソースのみを作成できます。プロジェクト リソースを階層の最上位に配置できますが、無料試用ユーザーまたは無料枠ユーザーによって作成された場合のみです。Google Workspace と Cloud Identity のお客様は、組織やフォルダのリソースなど、 Google Cloud リソース階層の他の機能にアクセスできます。詳しくは、[Cloud Identity の概要](https://docs.cloud.google.com/identity/docs/overview?hl=ja)をご覧ください。階層の最上部にあるプロジェクト リソースには親リソースはありませんが、ドメイン用に作成されると、組織リソースに移行できます。プロジェクト リソースの移行の詳細については、[組織リソース間でプロジェクトを移行する](https://docs.cloud.google.com/resource-manager/docs/project-migration?hl=ja)をご覧ください。

## 次のステップ {#whats-next data-text="次のステップ" tabindex="-1"}

- [Google Cloud リソース階層を作成する](https://docs.cloud.google.com/resource-manager/docs/manage-google-cloud-resources?hl=ja)方法を学習する
- [階層内のすべてのプロジェクト、フォルダ、組織を一覧表示する](https://docs.cloud.google.com/resource-manager/docs/listing-all-resources?hl=ja)方法を学習する
::::::

フィードバックを送信

::: devsite-floating-action-buttons
:::

特に記載のない限り、このページのコンテンツは[クリエイティブ・コモンズの表示 4.0 ライセンス](https://creativecommons.org/licenses/by/4.0/)により使用許諾されます。コードサンプルは [Apache 2.0 ライセンス](https://www.apache.org/licenses/LICENSE-2.0)により使用許諾されます。詳しくは、[Google Developers サイトのポリシー](https://developers.google.com/site-policies?hl=ja)をご覧ください。Java は Oracle および関連会社の登録商標です。

最終更新日 2026-03-27 UTC。

::: devsite-content-data
ご意見をお聞かせください

\[\[\[\"わかりやすい\",\"easyToUnderstand\",\"thumb-up\"\],\[\"問題の解決に役立った\",\"solvedMyProblem\",\"thumb-up\"\],\[\"その他\",\"otherUp\",\"thumb-up\"\]\],\[\[\"わかりにくい\",\"hardToUnderstand\",\"thumb-down\"\],\[\"情報またはサンプルコードが不正確\",\"incorrectInformationOrSampleCode\",\"thumb-down\"\],\[\"必要な情報 / サンプルがない\",\"missingTheInformationSamplesINeed\",\"thumb-down\"\],\[\"翻訳に関する問題\",\"translationIssue\",\"thumb-down\"\],\[\"その他\",\"otherDown\",\"thumb-down\"\]\],\[\"最終更新日 2026-03-27 UTC。\"\],\[\],\[\]\]
:::
::::::::::::
