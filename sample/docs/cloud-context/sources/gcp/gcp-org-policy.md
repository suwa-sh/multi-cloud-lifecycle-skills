---
source_url: "https://cloud.google.com/resource-manager/docs/organization-policy/overview?hl=ja"
fetched_at: "2026-03-27T21:33:31Z"
vendor: "gcp"
layer: "foundation"
---

::::::::::::: {#main-content .devsite-main-content role="main" has-book-nav="" has-sidebar=""}
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
:::

フィードバックを送信

# 組織ポリシー サービスの概要 [ コレクションでコンテンツを整理 ]{slot="popout-heading"} [ 必要に応じて、コンテンツの保存と分類を行います。 ]{slot="popout-contents"} {#組織ポリシー-サービスの概要-コレクションでコンテンツを整理-必要に応じてコンテンツの保存と分類を行います .devsite-page-title tabindex="-1"}

::::::: {.devsite-article-body .clearfix}
組織のポリシー サービスを使用すると、組織の Cloud リソースをプログラムで一元管理できます。[組織のポリシー管理者](https://docs.cloud.google.com/resource-manager/docs/organization-policy/using-constraints?hl=ja#add-org-policy-admin)は、[リソース階層](https://docs.cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy?hl=ja)全体にわたって制約を構成できます。

## 利点 {#benefits data-text="利点" tabindex="-1"}

- 組織のリソースの使用方法に関する制限を構成して集中管理できます。
- 開発チームがコンプライアンスを遵守できるように違反防止策の定義と確立ができます。
- プロジェクト オーナーとチームがコンプライアンス違反を心配せずに迅速に行動できるようになります。

## 一般的なユースケース {#common_use_cases data-text="一般的なユースケース" tabindex="-1"}

組織のポリシーを使用すると、次のことができます。

- [ドメインに基づいてリソースの共有を制限する](https://docs.cloud.google.com/resource-manager/docs/organization-policy/restricting-domains?hl=ja)。
- [Identity and Access Management（IAM）サービス アカウントの使用を制限する](https://docs.cloud.google.com/resource-manager/docs/organization-policy/restricting-service-accounts?hl=ja)。
- [新しく作成されるリソースの物理的なロケーションを制限する](https://docs.cloud.google.com/resource-manager/docs/organization-policy/defining-locations?hl=ja)。

組織のリソースをきめ細かく制約できる制約は数多くあります。詳細については、[組織ポリシー サービス制約すべての一覧](https://docs.cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints?hl=ja)をご覧ください。

## Identity and Access Management との相違点 {#differences_from_iam data-text="Identity and Access Management との相違点" tabindex="-1"}

[Identity and Access Management](https://docs.cloud.google.com/iam?hl=ja) で重要なのは「*誰であるか*」です。管理者は、特定のリソースに対して誰がアクションを実施できるかを権限に基づいて[承認](https://docs.cloud.google.com/resource-manager/docs/access-control-org?hl=ja)します。

組織ポリシーで重要なのは「*何*」で、管理者は特定のリソースに対して制限を設定し、どのような構成が可能であるかを決定できます。

## 組織のポリシーの仕組み {#how_organization_policy_works data-text="組織のポリシーの仕組み" tabindex="-1"}

組織のポリシーは、1 つ以上の Google Cloud サービスを制限する単一の[制約](#constraints)を構成します。組織のポリシーは、組織、フォルダ、またはプロジェクト リソースに対して設定され、そのリソースおよび子リソースに制約を適用します。

組織のポリシーには、制約を適用する方法と適用条件を指定する*ルール*が 1 つ以上含まれます。たとえば、組織のポリシーに、`environment=development`{dir="ltr" translate="no"} タグのあるリソースにのみ制約を適用するルールと、他のリソースに制約が適用されないようにするルールを含めることができます。

組織のポリシーがアタッチされているリソースの子孫は、組織のポリシーを[継承](#inheritance)します。組織のポリシーを組織リソースに適用すると、組織のポリシー管理者は、組織全体で組織のポリシーの適用と制限の構成を制御できます。

![組織のポリシーのコンセプト](https://docs.cloud.google.com/resource-manager/img/org-policy-concepts.svg?hl=ja "主要な組織のポリシーのコンセプトの図")

## 制約 {#constraints data-text="制約" tabindex="-1"}

制約は、[Google Cloud サービス](https://docs.cloud.google.com/docs/overview/cloud-platform-services?hl=ja)または Google Cloud サービスのリストに対する特定のタイプの制限です。制約は、どのような行動が制御されているかを定義する青写真と考えることができます。たとえば、`compute.storageResourceUseRestrictions`{dir="ltr" translate="no"} 制約を使用して、プロジェクト リソースが Compute Engine ストレージ リソースにアクセスできないように制限できます。

このブループリントは、[リソース階層](https://docs.cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy?hl=ja)内のリソースに組織のポリシーとして設定され、制約で定義されたルールが適用されます。その制約にマッピングされ、そのリソースに関連付けられた Google Cloud サービスにより、組織のポリシー内で構成された制限が適用されます。

組織のポリシーは、適用する制約と、必要に応じて制約が適用される条件によって、YAML ファイルまたは JSON ファイルで定義されます。各組織のポリシーは、アクティブ モード、ドライラン モード、またはその両方で 1 つの制約のみを適用します。

管理対象の制約には、 Google Cloud サービスによって決定されるリスト パラメータまたはブール パラメータがあります。

カスタム制約は、ブール値パラメータを持つ管理対象制約と機能的に類似しており、適用されるか適用されないかのいずれかです。

以前の管理対象制約には、制約タイプに基づいて 1 つ以上のリストルールまたはブール値ルールがあります。リストルールは、許可または拒否された値のコレクションです。ブール値ルールでは、すべての値を許可するか、すべての値を拒否するか、制約が適用されるかどうかを判断できます。

### マネージド制約 {#managed-constraints data-text="マネージド制約" tabindex="-1"}

マネージド制約は、同等の以前のマネージド制約を置き換えるように設計されていますが、[ポリシー インテリジェンス ツール](#policy-intelligence)による柔軟性と分析情報が追加されています。これらの制約は、カスタム組織のポリシーの制約と似た構造を持ちますが、Google によって管理されます。

同等の以前のマネージド制約の制約タイプがブール値の場合、マネージド制約は同じ方法で適用または適用解除できます。たとえば、次の組織のポリシーは、`iam.disableServiceAccountCreation`{dir="ltr" translate="no"} と同等の制約である `iam.managed.disableServiceAccountCreation`{dir="ltr" translate="no"} を適用します。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded="" syntax="YAML"}
name: organizations/1234567890123/policies/iam.managed.disableServiceAccountCreation
spec:
  rules:
  - enforce: true
```

同等の以前のマネージド制約の制約タイプがリストの場合、マネージド制約は、制約によって制限されるリソースと動作を定義するパラメータの定義をサポートします。たとえば、次の組織ポリシーでは、`example.com`{dir="ltr" translate="no"} ドメインと `altostrat.com`{dir="ltr" translate="no"} ドメインのみを `organizations/1234567890123`{dir="ltr" translate="no"} の重要な連絡先に追加できるマネージド制約が適用されます。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded="" syntax="YAML"}
name: organizations/1234567890123/policies/essentialcontacts.managed.allowedContactDomains
spec:
   rules:
     - enforce: true
       parameters:
          allowedDomains:
               - @example.com
               - @altostrat.com
```

マネージド制約の使用の詳細については、[制約の使用](https://docs.cloud.google.com/resource-manager/docs/organization-policy/using-constraints?hl=ja#managed-constraints)をご覧ください。

### カスタム制約 {#custom-constraints data-text="カスタム制約" tabindex="-1"}

マネージド制約と同様に、カスタム制約ではリソースの作成と更新を許可または制限できます。ただし、カスタム制約は Google ではなく組織によって管理されます。[Policy Intelligence ツール](#policy-intelligence)を使用すると、カスタム組織のポリシーをテストして分析できます。

カスタム制約をサポートするサービス リソースの一覧については、[カスタム制約でサポートされているサービス](https://docs.cloud.google.com/resource-manager/docs/organization-policy/custom-constraint-supported-services?hl=ja)をご覧ください。

カスタム組織のポリシーの使用の詳細については、[カスタム組織のポリシーの作成と管理](https://docs.cloud.google.com/resource-manager/docs/organization-policy/creating-managing-custom-constraints?hl=ja)をご覧ください。

カスタム制約のサンプルの一覧については、GitHub の[カスタム組織ポリシー ライブラリ](https://github.com/GoogleCloudPlatform/professional-services/tree/main/tools/custom-organization-policy-library){.external target="github" track-metadata-position="body" track-name="gitHubLink"}をご覧ください。

### マネージド制約（レガシー） {#legacy-constraints data-text="マネージド制約（レガシー）" tabindex="-1"}

以前のマネージド制約の*制約タイプ*はリストまたはブール値で、適用チェックに使用できる値を決定します。適用を行うGoogle Cloud サービスは、制約のタイプと値を評価して、適用される制限を決定します。

これらの以前の制約は、以前は*事前定義された制約*と呼ばれていました。

#### ルールを一覧表示する {#list-constraints data-text="ルールを一覧表示する" tabindex="-1"}

リストルールのレガシー マネージド制約は、組織ポリシーで定義されている値のリストを許可または禁止します。以前は、これらの以前の制約はリスト制約と呼ばれていました。許可または拒否される値のリストは、階層サブツリー文字列として表されます。サブツリー文字列は、適用先のリソースのタイプを指定します。たとえば、以前のマネージド制約 `constraints/compute.trustedImageProjects`{dir="ltr" translate="no"} は、`projects/`{dir="ltr" translate="no"}`PROJECT_ID`{.variable translate="no"} の形式のプロジェクト ID のリストを受け取ります。

すべての値を許可する、すべての値を拒否する、または特定の値のリストを許可または拒否するように指定できます。許可または拒否する値のリストを指定すると、Organization Policy Service は、それらの値のみが許可または拒否されることを暗黙的に評価します。たとえば、`projects/`{dir="ltr" translate="no"}`PROJECT_ID`{.variable translate="no"} のみを許可する制約がある場合、他のすべての値は暗黙的に拒否されます。

値に `prefix:value`{dir="ltr" translate="no"} 形式の接頭辞を付け、値をサポートする制約に条件を追加することもできます。

- `is:`{dir="ltr" translate="no"} - 正確な値との比較を適用します。これは接頭辞がない場合と同じ動作で、値にコロンが含まれる場合には必須です。

- `under:`{dir="ltr" translate="no"} - 値とそのすべての子の値に対して比較を適用します。この接頭辞が付いているリソースが許可または拒否される場合、その子リソースも許可または拒否されます。指定する値は、組織、フォルダ、プロジェクトのリソースの ID である必要があります。

- `in:`{dir="ltr" translate="no"} - この値を含むすべてのリソースに対して比較を適用します。たとえば、`constraints/gcp.resourceLocations`{dir="ltr" translate="no"} 制約の拒否リストに `in:us-locations`{dir="ltr" translate="no"} を追加して、`us`{dir="ltr" translate="no"} リージョンに含まれるすべてのロケーションをブロックできます。

値のリストが指定されていない場合、または組織のポリシーが Google 管理のデフォルトに設定されている場合、制約のデフォルトの動作が適用され、すべての値が許可されるか、すべての値が拒否されます。

次の組織のポリシーは、`organizations/1234567890123`{dir="ltr" translate="no"} の Compute Engine VM インスタンス `vm-1`{dir="ltr" translate="no"} と `vm-2`{dir="ltr" translate="no"} が外部 IP アドレスにアクセスできるようにする、以前のマネージド制約を適用します。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded="" syntax="YAML"}
name: organizations/1234567890123/policies/compute.vmExternalIpAccess
spec:
  rules:
  - values:
      allowedValues:
      - is:projects/project_a/zones/us-central1-a/instances/vm-1
      - is:projects/project_b/zones/us-central1-a/instances/vm-2
```

#### ブール値のルール {#boolean-constraints data-text="ブール値のルール" tabindex="-1"}

ブール型ルールを含む以前のマネージド制約は、強制適用されるか、強制適用されないかのいずれかです。たとえば、`constraints/compute.disableSerialPortAccess`{dir="ltr" translate="no"} には次の 2 つの状態があります。

- 適用 - 制約が強制適用され、シリアルポート アクセスは許可されません。
- 適用なし - `disableSerialPortAccess`{dir="ltr" translate="no"} 制約は強制適用も選択もされないため、シリアルポートへのアクセスが許可されます。

組織のポリシーが Google 管理のデフォルトに設定されている場合、制約のデフォルトの動作が適用されます。

これらの以前の制約は、以前はブール値の制約と呼ばれていました。

次の組織のポリシーは、`organizations/1234567890123`{dir="ltr" translate="no"} で外部サービス アカウントの作成を無効にする以前のマネージド制約を適用します。

::: {}
:::

``` {.devsite-click-to-copy translate="no" dir="ltr" is-upgraded="" syntax="YAML"}
name: organizations/1234567890123/policies/iam.disableServiceAccountCreation
spec:
  rules:
  - enforce: true
```

## ドライラン モードの組織のポリシー {#organization_policies_in_dry-run_mode data-text="ドライラン モードの組織のポリシー" tabindex="-1"}

ドライラン モードの組織のポリシーは、他の組織のポリシーと同様に作成、適用され、ポリシーの違反は監査ログに記録されますが、違反アクションは拒否されません。

ドライラン モードの組織のポリシーを使用すると、ポリシーの変更が適用される前に、それがワークフローにどのような影響を与えるかをモニタリングできます。詳細については、[ドライラン モードで組織のポリシーを作成する](https://docs.cloud.google.com/resource-manager/docs/organization-policy/dry-run-policy?hl=ja)をご覧ください。

## 条件付き組織のポリシー {#conditional_organization_policies data-text="条件付き組織のポリシー" tabindex="-1"}

タグを使用すると、リソースに特定のタグが付加されているかどうかに基づいて、条件付きで制約を適用できます。タグを使用し、条件付きでの制約の適用を使用すると、階層内のリソースを集中管理できます。

タグの詳細については、[タグの概要](https://docs.cloud.google.com/resource-manager/docs/tags/tags-overview?hl=ja)をご覧ください。タグを使用して条件付き組織のポリシーを設定する方法については、[タグを使用した組織のポリシーの設定](https://docs.cloud.google.com/resource-manager/docs/organization-policy/tags-organization-policy?hl=ja)をご覧ください。

## 継承 {#inheritance data-text="継承" tabindex="-1"}

リソースに組織のポリシーが設定されている場合、そのリソースのすべての子孫はデフォルトでその組織のポリシーを継承します。組織リソースで組織のポリシーを設定した場合、そのポリシーで定義されている制限の構成は、子孫であるすべてのフォルダ、プロジェクト、サービス リソースに受け継がれます。

子孫リソースに組織のポリシーを設定して、継承を上書きするか、親リソースの組織のポリシーを継承できます。以前のマネージド制約を適用する組織のポリシーは、階層評価のルールに基づいて統合されます。このシステムにより、組織のポリシーが組織全体にどのように適用され、どこで例外を適用するかを正確に制御できます。

**注:** 親リソースから継承されたマネージド制約は、特定のリソースの有効なポリシーを評価するためにマージされません。マネージド制約を継承するリソースは、親リソースに設定された制約を適用するか、独自のポリシーで制約をオーバーライドします。

詳細については、[階層評価について](https://docs.cloud.google.com/resource-manager/docs/organization-policy/understanding-hierarchy?hl=ja)をご覧ください。

## 違反 {#violations data-text="違反" tabindex="-1"}

違反とは、 Google Cloud サービスがリソース階層の範囲内にある組織のポリシー制限の構成に反して動作している状況を指します。 Google Cloud サービスは制約を適用して違反を防止しますが、通常、新しい組織のポリシーの適用は遡及的ではありません。組織のポリシーの制約がさかのぼって適用されている場合は、\[[組織のポリシーの制約](https://docs.cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints?hl=ja)\] ページでその旨のラベルが付けられます。

すでに発生しているサービスの動作や状態に対して新しい組織ポリシーにより制限が設定された場合、ポリシー違反状態とみなされますが、サービスは元の動作を停止しません。この違反には手動で対処する必要があります。この動作は新しい組織ポリシーによってビジネスの継続性が完全に損なわれるリスクを防ぐためのものです。

## Policy Intelligence {#policy-intelligence data-text="Policy Intelligence" tabindex="-1"}

Policy Intelligence は、セキュリティ ポリシーの管理に役立つように設計されたツールスイートです。これらのツールは、リソースの使用状況の把握、既存のセキュリティ ポリシーの理解と改善、ポリシーの構成ミスの防止に役立ちます。

一部の Policy Intelligence ツールは、組織のポリシー サービスのポリシーのテストと分析に役立つように特別に設計されています。組織のポリシーに対するすべての変更のテストとドライランを行うことをおすすめします。Policy Intelligence を使用すると、次のようなタスクを実行できます。

- 組織のポリシーと制約に対する[変更をテスト](https://docs.cloud.google.com/policy-intelligence/docs/test-organization-policies?hl=ja)し、提案されたポリシーに準拠していないリソースを特定する（[プレビュー](https://cloud.google.com/products/?hl=ja#product-launch-stages)）。
- [ドライランの組織のポリシーを作成する](https://docs.cloud.google.com/resource-manager/docs/organization-policy/dry-run-policy?hl=ja)。ポリシーの変更がワークフローに与える影響をモニタリングします。
- [既存の組織のポリシーを分析する](https://docs.cloud.google.com/policy-intelligence/docs/analyze-organization-policies?hl=ja)。どの Google Cloud リソースがどの組織のポリシーの対象となるかを確認します。

これらのツールやその他の Policy Intelligence ツールの詳細については、[Policy Intelligence の概要](https://docs.cloud.google.com/policy-intelligence/docs/overview?hl=ja)をご覧ください。

## 次のステップ {#next_steps data-text="次のステップ" tabindex="-1"}

- [組織リソースの作成と管理](https://docs.cloud.google.com/resource-manager/docs/creating-managing-organization?hl=ja)を読み、組織リソースを取得する方法を学ぶ
- [組織のポリシーを定義する方法](https://docs.cloud.google.com/resource-manager/docs/organization-policy/using-constraints?hl=ja)を学習する。
- 組織のポリシーの制約で[実現できるソリューション](https://docs.cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints?hl=ja)を検討する
:::::::

フィードバックを送信

::: devsite-floating-action-buttons
:::

特に記載のない限り、このページのコンテンツは[クリエイティブ・コモンズの表示 4.0 ライセンス](https://creativecommons.org/licenses/by/4.0/)により使用許諾されます。コードサンプルは [Apache 2.0 ライセンス](https://www.apache.org/licenses/LICENSE-2.0)により使用許諾されます。詳しくは、[Google Developers サイトのポリシー](https://developers.google.com/site-policies?hl=ja)をご覧ください。Java は Oracle および関連会社の登録商標です。

最終更新日 2026-03-21 UTC。

::: devsite-content-data
ご意見をお聞かせください

\[\[\[\"わかりやすい\",\"easyToUnderstand\",\"thumb-up\"\],\[\"問題の解決に役立った\",\"solvedMyProblem\",\"thumb-up\"\],\[\"その他\",\"otherUp\",\"thumb-up\"\]\],\[\[\"わかりにくい\",\"hardToUnderstand\",\"thumb-down\"\],\[\"情報またはサンプルコードが不正確\",\"incorrectInformationOrSampleCode\",\"thumb-down\"\],\[\"必要な情報 / サンプルがない\",\"missingTheInformationSamplesINeed\",\"thumb-down\"\],\[\"翻訳に関する問題\",\"translationIssue\",\"thumb-down\"\],\[\"その他\",\"otherDown\",\"thumb-down\"\]\],\[\"最終更新日 2026-03-21 UTC。\"\],\[\],\[\]\]
:::
:::::::::::::
