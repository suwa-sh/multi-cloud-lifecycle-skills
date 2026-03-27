---
source_url: "https://learn.microsoft.com/ja-jp/azure/governance/management-groups/overview"
fetched_at: "2026-03-27T21:22:26Z"
vendor: "azure"
layer: "foundation"
---

:::::::::::::::::::::::::::::::::::::::: {#main .layout-body-main role="main" bi-name="content" lang="ja-jp" dir="ltr"}
:::: {#ms--content-header .content-header .default-focus .border-bottom-none bi-name="content-header"}
::: {.content-header-controls .margin-xxs .margin-inline-sm-tablet}
[[]{.docon .docon-menu}]{.icon aria-hidden="true"} [ 目次 ]{.contents-expand-title}

[[]{.docon .docon-exit-mode}]{.icon aria-hidden="true"} エディター モードを終了する
:::
::::

:::::::::::::::::::::::::::::::::::: {.padding-sm .padding-top-none .padding-top-sm-tablet main-column=""}
:::::::::::::::::::::::::::::: {}
::::::: {#article-header .background-color-body .margin-bottom-xs .display-none-print}
:::::: {.display-flex .align-items-center .justify-content-space-between}
[ []{.docon .docon-more} ]{.icon}

::: {#article-header-breadcrumbs-overflow .popover-content .padding-none}
:::

:::: {#article-header-page-actions .opacity-none .margin-left-auto .display-flex .flex-wrap-no-wrap .align-items-stretch}
[ []{.docon .docon-chat-sparkle-fill .gradient-ask-learn-logo} ]{.icon .font-size-lg aria-hidden="true"}

[ []{.docon .docon-chat-sparkle-fill .gradient-ask-learn-logo} ]{.icon .font-size-lg aria-hidden="true"} Learn に質問する

[ []{.docon .docon-chat-sparkle-fill .gradient-ask-learn-logo} ]{.icon .font-size-lg aria-hidden="true"} Learn に質問する

[ []{.docon .docon-glasses} ]{.icon .font-size-lg aria-hidden="true"} フォーカス モード

[ []{.docon .docon-more-vertical} ]{.icon aria-hidden="true"}

::: popover-content
[ []{.docon .docon-editor-list-bullet aria-hidden="true"} ]{.icon} [目次]{.contents-expand-title}

[[ []{.docon .docon-locale-globe} ]{.icon aria-hidden="true" read-in-link-icon=""} [英語で読む]{read-in-link-text=""}](#){#lang-link-overflow .button-sm .inner-focus .button .button-clear .button-block .justify-content-flex-start .text-align-left bi-name="language-toggle" page-action-item="overflow-all" check-hidden="true" read-in-link="" hidden=""}

[ []{.docon .docon-circle-addition} ]{.icon aria-hidden="true"} [追加]{.collection-status}

[ []{.docon .docon-circle-addition} ]{.icon aria-hidden="true"} [プランへの追加]{.plan-status}

------------------------------------------------------------------------

#### 次の方法で共有 {#次の方法で共有 .font-size-sm .padding-left-xxs}

[[ []{.docon .docon-facebook-share} ]{.icon .color-primary aria-hidden="true"} Facebook](#){.button .button-clear .button-sm .inner-focus .button-block .justify-content-flex-start .text-align-left .text-decoration-none .share-facebook bi-name="facebook" page-action-item="overflow-all"} [[ []{.docon .docon-xlogo-share} ]{.icon .color-text aria-hidden="true"} x.com](#){.button .button-clear .button-sm .inner-focus .button-block .justify-content-flex-start .text-align-left .text-decoration-none .share-twitter bi-name="twitter" page-action-item="overflow-all"} [[ []{.docon .docon-linked-in-logo} ]{.icon .color-primary aria-hidden="true"} LinkedIn](#){.button .button-clear .button-sm .inner-focus .button-block .justify-content-flex-start .text-align-left .text-decoration-none .share-linkedin bi-name="linkedin" page-action-item="overflow-all"} [[ []{.docon .docon-mail-message} ]{.icon .color-primary aria-hidden="true"} 電子メール](#){.button .button-clear .button-sm .inner-focus .button-block .justify-content-flex-start .text-align-left .text-decoration-none .share-email bi-name="email" page-action-item="overflow-all"}

------------------------------------------------------------------------

[ []{.docon .docon-code-lang show-when="idle"} []{.loader show-when="loading" hidden=""} []{.docon .docon-check-mark show-when="success" hidden=""} ]{.icon .color-primary aria-hidden="true"} マークダウンのコピー

[ []{.docon .docon-print} ]{.icon .color-primary aria-hidden="true"} 印刷
:::
::::
::::::
:::::::

::::: {unauthorized-private-section="" bi-name="permission-content-unauthorized-private" hidden=""}

------------------------------------------------------------------------

:::: {.notification .notification-info}
::: notification-content
[ []{.docon .docon-exclamation-circle-solid aria-hidden="true"} ]{.icon} Note

このページにアクセスするには、承認が必要です。 [サインイン](#){.docs-sign-in bi-name="permission-content-sign-in"}または[ディレクトリの変更]{.docs-change-directory bi-name="permisson-content-change-directory"}を試すことができます。

このページにアクセスするには、承認が必要です。 [ディレクトリの変更]{.docs-change-directory bi-name="permisson-content-change-directory"}を試すことができます。
:::
::::
:::::

::: content
# Azure 管理グループとは {#what-are-azure-management-groups}
:::

:::: {#article-metadata .page-metadata-container .display-flex .gap-xxs .justify-content-space-between .align-items-center .flex-wrap-wrap bi-name="article-metadata" test-id="article-metadata"}
::: {#user-feedback .margin-block-xxs .display-none .display-none-print hidden="" hide-on-archived=""}
[ []{.docon .docon-like} ]{.icon aria-hidden="true"} フィードバック
:::
::::

## この記事の内容 {#ms--in-this-article .title .is-6 .margin-block-xs}

::::::::: content
組織に多くの Azure サブスクリプションがある場合は、これらのサブスクリプションのアクセス、ポリシー、およびコンプライアンスを効率的に管理する方法が必要になることがあります。 *管理グループ*のガバナンス範囲は、サブスクリプションを上回ります。 サブスクリプションを管理グループにまとめると、適用するガバナンス条件は関連付けられているすべてのサブスクリプションへの継承によりカスケード表示されます。

管理グループを使用すると、サブスクリプションの種類に関係なく、大きな規模でエンタープライズ レベルの管理を行うことができます。 ただし、単一の管理グループ内のすべてのサブスクリプションは、同じ Microsoft Entra テナントを信頼する必要があります。

たとえば、仮想マシン (VM) の作成に使用できるリージョンを制限するポリシーを、管理グループに適用できます。 このポリシーは、入れ子になったすべての管理グループ、サブスクリプション、リソースに適用され、承認されたリージョンのみで VM の作成を許可します。

## 管理グループとサブスクリプションの階層 {#hierarchy-of-management-groups-and-subscriptions}

管理グループとサブスクリプションの柔軟な構造を作成し、リソースを階層に整理して、統一されたポリシーとアクセス管理を適用できます。 次の図は、管理グループを使用して管理のための階層を作成する例を示しています。

![サンプル管理グループの階層の図。](../media/mg-org.png){aria-describedby="25-0" linktype="relative-path"}

::: {#25-0 .visually-hidden}
管理グループとサブスクリプションの両方を包含しているルート管理グループの図。 一部の子管理グループは管理グループを包含し、一部はサブスクリプション、一部はその両方を包含しています。 サンプル階層の例の 1 つは、すべてサブスクリプションを子レベルで持つ、4 つのレベルの管理グループです。
:::

たとえば、VM の場所を *Corp* という管理グループ内の米国西部リージョンに制限するポリシーを適用する階層を作成できます。このポリシーは、その管理グループの子孫であるすべての Enterprise Agreement (EA) サブスクリプションを継承し、それらのサブスクリプションの下にあるすべての VM に適用されます。 リソースまたはサブスクリプションの所有者は、ガバナンスを向上させるために、このセキュリティ ポリシーを変更することはできません。

::: NOTE
Note

現在、管理グループは、Microsoft 顧客契約 (MCA) サブスクリプションの Cost Management 機能ではサポートされていません。
:::

管理グループを使用するもう 1 つのシナリオは、ユーザーに複数のサブスクリプションへのアクセスを提供する場合です。 管理グループの下に複数のサブスクリプションを移動することで、管理グループに 1 つの [Azure ロールの割り当て](../../role-based-access-control/overview){linktype="relative-path"}を作成できます。 ロールは、そのアクセスをすべてのサブスクリプションに継承します。 さまざまなサブスクリプションに Azure RBAC を割り当てるスクリプトを作成することなく、管理グループへ 1 つ割り当てるだけで、ユーザーは必要なものすべてにアクセスできます。

### シナリオの比較 {#scenario-comparison}

  シナリオ                                                                                                                                                                                                                            [リソース グループ](/ja-jp/azure/azure-resource-manager/management/overview#resource-groups){linktype="absolute-path"}   [サブスクリプション](/ja-jp/azure/azure-resource-manager/management/azure-subscription-service-limits#azure-subscription-limits){linktype="absolute-path"}   [管理グループ](https://www.learn.microsoft.com/azure/governance/management-groups/overview){linktype="external"}   [サービス グループ](/ja-jp/azure/governance/service-groups/overview){linktype="absolute-path"}   [タグ](/ja-jp/azure/azure-resource-manager/management/tag-resources){linktype="absolute-path"}
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------
  スコープの割り当てから各メンバー/子孫リソースへの継承が必要                                                                                                                                                                         サポート対象\*                                                                                                           サポートされています                                                                                                                                         サポートされています                                                                                               サポートされていません                                                                           サポートされていません
  ロールの割り当て/ポリシー割り当ての削減のためのリソースの統合                                                                                                                                                                       サポートされています                                                                                                     サポートされています                                                                                                                                         サポートされています                                                                                               サポートされていません                                                                           サポートされていません
  スコープの境界を越えて共有されるリソースのグループ化。 例: 独自のサブスクリプション/リソース グループを持つ複数のアプリケーション間で共有される、1 つのサブスクリプション/リソース グループ内のグローバル ネットワーク リソース。   サポートされていません                                                                                                   サポートされていません                                                                                                                                       サポートされていません                                                                                             サポートされています                                                                             サポートされています
  メトリックの個別の集計を可能にする個別のグループ化を作成する                                                                                                                                                                        サポートされていません                                                                                                   サポートされています                                                                                                                                         サポートされています                                                                                               サポートされています                                                                             サポート対象\*\*
  多くのリソースにエンタープライズ全体の制限または組織の構成を適用する                                                                                                                                                                サポート対象\*                                                                                                           サポート対象\*                                                                                                                                               サポート対象\*                                                                                                     サポートされていません                                                                           サポート対象\*\*\*

\*: ポリシーがスコープに適用されると、スコープ内のすべてのメンバーに適用されます。 たとえば、リソース グループでは、その下のリソースにのみ適用されます。

\*\*: タグはスコープ間で適用でき、リソースに個別に追加されます。 Azure Policy には、タグの管理に役立つ組み込みのポリシーがあります。

: Azure タグを Azure Policy 内の条件として使用して、特定のリソースにポリシーを適用できます。 Azure タグには制限があります。

### 管理グループに関する重要な事実 {#important-facts-about-management-groups}

- 1 つのディレクトリで 10,000 の管理グループをサポートできます。

- 管理グループのツリーは、最大 6 レベルの深さをサポートできます。

  この制限には、ルート レベルまたはサブスクリプション レベルは含まれません。

- 各管理グループとサブスクリプションでサポートできる親は 1 つだけです。

- 各管理グループには、多数の子を含めることができます。

- すべてのサブスクリプションと管理グループは、各ディレクトリの 1 つの階層内に存在します。 詳細については、この記事で後述する、「[ルート管理グループに関する重要な事実](#important-facts-about-the-root-management-group){linktype="self-bookmark"}」をご覧ください。

## 各ディレクトリのルート管理グループ {#root-management-group-for-each-directory}

各ディレクトリには、\"ルート\" 管理グループと呼ばれる 1 つの最上位管理グループがあります。 このルート管理グループは階層に組み込まれており、すべての管理グループとサブスクリプションはルート管理グループにまとめられます。

ルート管理グループは、ディレクトリ レベルで、グローバル ポリシーと Azure ロールの割り当てを適用できます。 最初に、[すべての Azure サブスクリプションと管理グループを管理する目的でアクセス権限をこのルート グループのユーザー アクセス管理者ロールに昇格させます](../../role-based-access-control/elevate-access-global-admin){linktype="relative-path"}。 テナント管理者がアクセス権を昇格させた後、管理者は、任意の Azure ロールを他のディレクトリ ユーザーまたはグループに割り当てて階層を管理できます。 管理者の場合は、自分のアカウントをルート管理グループの所有者として割り当てることができます。

### ルート管理グループに関する重要な事実 {#important-facts-about-the-root-management-group}

- 既定で、ルート管理グループの表示名は **Tenant root group** であり、それ自体が管理グループとして機能します。 ID は、Microsoft Entra テナント ID と同じ値です。
- 表示名を変更するには、自分のアカウントにルート管理グループの所有者または共同作成者ロールを持たせる必要があります。 詳細については、「[管理グループの名前を変更する](manage#change-the-name-of-a-management-group){linktype="relative-path"}」をご覧ください。
- 他の管理グループと異なり、ルート管理グループを移動または削除することはできません。
- すべてのサブスクリプションと管理グループは、ディレクトリ内の 1 つのルート管理グループにまとめられます。
  - ディレクトリ内のすべてのリソースは、グローバル管理用のルート管理グループにまとめられます。
  - 既定では、新しいサブスクリプションはその作成時に自動的にルート管理グループに設定されます。
- すべての Azure ユーザーはルート管理グループを表示できますが、すべてのユーザーがルート管理グループを管理するアクセス権を持つわけではありません。
  - サブスクリプションへのアクセス権を持つすべてのユーザーは、階層内にそのサブスクリプションが存在するコンテキストを参照できます。
  - 既定では、ルート管理グループには誰もアクセスできません。 Microsoft Entra 全体管理者は、自分自身を昇格させてアクセス権を取得できる唯一のユーザーです。 全体管理者がルート管理グループへのアクセス権を取得すると、他のユーザーが管理できるように任意の Azure ロールを割り当てることができます。

::: IMPORTANT
重要

ルート管理グループでのユーザーのアクセス権またはポリシーは、ディレクトリ内のすべてのリソースに適用されます。 このアクセス レベルのため、すべてのお客様は、このスコープに項目を定義する必要性を評価する必要があります。 ユーザー アクセスやポリシーの割り当ては、このスコープのみで \"必須\" でなければなりません。
:::

## 管理グループの初期セットアップ {#initial-setup-of-management-groups}

ユーザーが管理グループの使用を開始する際には、初期セットアップ プロセスが発生します。 最初の手順は、ディレクトリでのルート管理グループの作成です。 ディレクトリに存在する既存のサブスクリプションはすべて、ルート管理グループの子になります。

このプロセスが実行される理由は、ディレクトリ内に管理グループ階層が 1 つだけ存在するようにするためです。 ディレクトリ内に 1 つの階層が存在することにより、ディレクトリ内の他のユーザーがバイパスできないグローバル アクセス権とポリシーを管理ユーザーが適用できるようになります。

ルートに割り当てられているものはすべて、階層全体に適用されます。 つまり、Microsoft Entra テナント内のすべての管理グループ、サブスクリプション、リソース グループ、およびリソースに適用されます。

## 管理グループ アクセス {#management-group-access}

Azure 管理グループでは、すべてのリソース アクセスとロール定義に対して [Azure RBAC](../../role-based-access-control/overview){linktype="relative-path"} がサポートされます。 階層内に存在する子リソースは、これらのアクセス許可を継承します。 任意の Azure ロールを管理グループに割り当てることができ、階層を下方にリソースまで継承されます。

たとえば、Azure ロール VM 共同作成者を管理グループに割り当てることができます。 このロールには、管理グループに対するアクションはありませんが、その管理グループに属するすべての VM に継承されます。

次の図に、管理グループのロールとサポートされているアクションの一覧を示します。

  Azure ロール名                 作成   \[名前の変更\]                                        移動\*\*                                         削除   アクセス権を割り当てる   ポリシーの割り当て   Read
  ----------------------------- ------ ---------------- ------------------------------------------------------------------------------------- ------ ------------------------ -------------------- ------
  所有者                          X           X                                                   X                                             X               X                      X             X
  Contributor                     X           X                                                   X                                             X                                                    X
  管理グループ共同作成者\*        X           X          [詳細の移動](#moving-subscriptions-and-management-groups){linktype="self-bookmark"}    X                                                    X
  閲覧者                                                                                                                                                                                             X
  管理グループ閲覧者\*                                                                                                                                                                               X
  リソース ポリシー共同作成者                                                                                                                                                          X           
  ユーザーアクセス管理者                                                                                                                                        X                      X           

\*: これらのロールを使用すると、ユーザーは指定されたアクションを管理グループ スコープに対してのみ実行できます。

\*\*: ルート管理グループに対するロールの割り当ては、それとの間でのサブスクリプションまたは管理グループの移動に必要ありません。

## サブスクリプションと管理グループの移動 {#moving-subscriptions-and-management-groups}

サブスクリプションと管理グループを移動するには、異なるロールの割り当てを適用する必要があります。 子サブスクリプションまたは管理グループを移動するには、次のアクセス許可が必要です。

- 移動される子サブスクリプションまたは管理グループ
  - `Microsoft.management/managementgroups/write`
  - `Microsoft.management/managementgroups/subscriptions/write` (サブスクリプションの場合のみ)
  - `Microsoft.Authorization/roleAssignments/write`
  - `Microsoft.Authorization/roleAssignments/delete`
  - `Microsoft.Management/register/action`
- ターゲット親管理グループ
  - `Microsoft.management/managementgroups/write`
- 現在の親管理グループ
  - `Microsoft.management/managementgroups/write`

階層内の項目の移動について詳しくは、[管理グループを使用したリソースの管理](manage){linktype="relative-path"}に関する記事をご覧ください。

## Azure カスタム ロールの定義と割り当て {#azure-custom-role-definition-and-assignment}

管理グループは、Azure カスタム ロール定義で割り当て可能なスコープとして定義できます。 Azure カスタム ロールは、その管理グループと、その下にあるすべての管理グループ、サブスクリプション、リソース グループ、またはリソースでの割り当てに使用できます。 組み込みロールと同様、カスタム ロールも階層を下方に継承されます。

カスタム ロールと管理グループに関する制限事項については、この記事で後述する「[制限事項](#limitations){linktype="self-bookmark"}」をご覧ください。

### 定義の例 {#example-definition}

[カスタム ロールの定義と作成](../../role-based-access-control/custom-roles){linktype="relative-path"}は、管理グループを追加しても変化することはありません。 完全なパスを使用して、管理グループ `/providers/Microsoft.Management/managementgroups/{_groupId_}` を定義します。

管理グループの表示名ではなく、管理グループの ID を使用してください。 どちらも管理グループを作成する際にカスタムで定義されるフィールドであるため、この一般的なエラーが発生します。

``` lang-json
...
{
  "Name": "MG Test Custom Role",
  "Id": "id",
  "IsCustom": true,
  "Description": "This role provides members understand custom roles.",
  "Actions": [
    "Microsoft.Management/managementGroups/delete",
    "Microsoft.Management/managementGroups/read",
    "Microsoft.Management/managementGroups/write",
    "Microsoft.Management/managementGroups/subscriptions/delete",
    "Microsoft.Management/managementGroups/subscriptions/write",
    "Microsoft.resources/subscriptions/read",
    "Microsoft.Authorization/policyAssignments/*",
    "Microsoft.Authorization/policyDefinitions/*",
    "Microsoft.Authorization/policySetDefinitions/*",
    "Microsoft.PolicyInsights/*",
    "Microsoft.Authorization/roleAssignments/*",
    "Microsoft.Authorization/roledefinitions/*"
  ],
  "NotActions": [],
  "DataActions": [],
  "NotDataActions": [],
  "AssignableScopes": [
        "/providers/microsoft.management/managementGroups/ContosoCorporate"
  ]
}
...
```

### ロールの定義を割り当ての階層パスから切り離すことによって生じる問題 {#issues-with-breaking-the-role-definition-and-assignment-hierarchy-path}

ロールの定義は、管理グループの階層の範囲内であれば、どこでも割り当てることができます。 ロールは親管理グループに対して定義できますが、実際のロールの割り当てが存在するのは子のサブスクリプションです。 2 つの項目間には関係があるため、割り当てをその定義から切り離そうとするとエラーが発生します。

たとえば、次の例のような階層の小さなセクションを考えてみましょう。

![サンプル管理グループの階層のサブセットの図。](../media/mg-org-sub.png){aria-describedby="211-0" linktype="relative-path"}

::: {#211-0 .visually-hidden}
この図は、子 landing zone および sandbox 管理グループを持つルート管理グループに焦点を当てています。 landing zone 管理グループには Corp と Online という名前の 2 つの子管理グループがあり、sandbox 管理グループには 2 つの子サブスクリプションがあります。
:::

sandbox 管理グループでカスタム ロールが定義されているとします。 そのカスタム ロールは 2 つの sandbox サブスクリプションに割り当てられています。

それらのサブスクリプションの 1 つを Corp 管理グループの子に移動しようとすると、サブスクリプションに対するロールの割り当てからサンドボックス管理グループに対するロールの定義へのパスが断たれます。 このシナリオでは、この関係が壊れるため移動は許可されないという内容のエラーが発生します。

このシナリオを解決するには、次のオプションがあります。

- サブスクリプションからロールの割り当てを削除した後で、サブスクリプションを新しい親管理グループに移動します。
- \"ロールの定義\" の割り当て可能なスコープにサブスクリプションを追加します。
- ロールの定義内の割り当て可能なスコープを変更します。 この例では、階層の両方のブランチが定義に到達できるように、sandbox 管理グループからルート管理グループに割り当て可能なスコープを更新できます。
- 他の分岐で定義される別のカスタム ロールを作成します。 この新しいロールでは、サブスクリプションのロールを変更する必要もあります。

### 制限事項 {#limitations}

管理グループでカスタム ロールを使用するには、次の制限があります。

- 新しいロールの割り当て可能なスコープに定義できる管理グループは 1 つだけです。 この制限は、ロールの定義とロールの割り当てが切り離される状況の発生回数を減らすために設けられています。 この種の状況は、ロールを割り当てたサブスクリプションまたは管理グループが、そのロールの定義が存在しない別の親に移動されると発生します。
- `DataActions` が含まれるカスタム ロールを管理グループのスコープで割り当てることはできません。 詳細については、「[カスタム ロールの制限事項](../../role-based-access-control/custom-roles#custom-role-limits){linktype="relative-path"}」を参照してください。
- ロールの定義の割り当て可能なスコープに管理グループが存在するかどうかは、Azure Resource Manager では確認されません。 入力ミスや間違った管理グループ ID が記載されていても、ロールの定義は作成されます。

## 管理グループとサブスクリプションの移動 {#moving-management-groups-and-subscriptions}

管理グループまたはサブスクリプションを別の管理グループの子に移動するには、次のものが必要です。

- 子のサブスクリプションまたは管理グループでの、管理グループの書き込みアクセス許可とロールの割り当ての書き込みアクセス許可。
  - 組み込みロールの例: 所有者
- 移動先の親管理グループに対する、管理グループの書き込みアクセス権限。
  - 組み込みロールの例: 所有者、共同作成者、管理グループ共同作成者
- 既存の親管理グループに対する、管理グループの書き込みアクセス権限。
  - 組み込みロールの例: 所有者、共同作成者、管理グループ共同作成者

次の例外があります: ターゲットまたは既存の親管理グループがルート管理グループである場合、このアクセス許可の要件は適用されません。 すべての新しい管理グループとサブスクリプションは既定でルート管理グループに追加されるため、項目を移動するためにこのグループに対するアクセス許可は不要です。

サブスクリプションの所有者ロールが現在の管理グループから継承される場合、移動先は制限されます。 サブスクリプションは、所有者ロールを持つ別の管理グループにのみ移動できます。 サブスクリプションの所有者ではなくなってしまうため、ご自分が共同作成者でしかない管理グループにサブスクリプションを移動できません。 サブスクリプションの所有者ロールに直接割り当てられている場合は、共同作成者のロールを持っている任意の管理グループに移動できます。

::: IMPORTANT
重要

Azure Resource Manager では、管理グループの階層の詳細が最大 30 分間キャッシュされます。 その結果、Azure portal で管理グループを移動したことがすぐには表示されない場合があります。
:::

## アクティビティ ログを使用して管理グループを監査する {#auditing-management-groups-by-using-activity-logs}

管理グループは、[Azure Monitor アクティビティ ログ](/ja-jp/azure/azure-monitor/essentials/platform-logs-overview){linktype="absolute-path"}内でサポートされます。 他の Azure リソースと同じ一元的な場所で、管理グループに発生するすべてのイベントのクエリを実行できます。 たとえば、特定の管理グループに対して行われた、ロールの割り当てまたはポリシーの割り当ての変更を、すべて確認できます。

![選択した管理グループに関連するアクティビティ ログと操作のスクリーンショット。](media/al-mg.png){linktype="relative-path"}

Azure portal の外部にある管理グループに対してクエリを実行する場合、管理グループのターゲット スコープは `"/providers/Microsoft.Management/managementGroups/{management-group-id}"` のようになります。

::: NOTE
Note

Azure Resource Manager REST API を使用することで、管理グループの診断設定を有効にして、関連する Azure アクティビティ ログ エントリを Log Analytics ワークスペース、Azure Storage、または Azure Event Hubs に送信できます。 詳細については、[管理グループの診断設定 - 作成または更新](/ja-jp/rest/api/monitor/management-group-diagnostic-settings/create-or-update){linktype="absolute-path"}についての記事をご覧ください。
:::

## 関連コンテンツ {#related-content}

管理グループについて詳しくは、以下をご覧ください。

- [管理グループを作成して Azure リソースを整理する](create-management-group-portal){linktype="relative-path"}
- [管理グループを変更、削除、または管理する](manage){linktype="relative-path"}
- [リソース階層の保護](how-to/protect-resource-hierarchy){linktype="relative-path"}
:::::::::

::: {#ms--inline-notifications .margin-block-xs bi-name="inline-notification"}
:::

::: {#assertive-live-region .visually-hidden role="alert" aria-live="assertive" aria-relevant="additions" aria-atomic="true"}
:::

::: {#polite-live-region .visually-hidden role="status" aria-live="polite" aria-relevant="additions" aria-atomic="true"}
:::

:::::::: {#site-user-feedback-footer .section .font-size-sm .margin-top-md .display-none-print .display-none-desktop test-id="site-user-feedback-footer" bi-name="site-feedback-section"}

------------------------------------------------------------------------

## フィードバック {#ms--feedback .title .is-3}

::::::: {.display-flex .flex-wrap-wrap .align-items-center}
このページはお役に立ちましたか?

:::::: buttons
[ []{.docon .docon-like} ]{.icon aria-hidden="true"} はい

[ []{.docon .docon-dislike} ]{.icon aria-hidden="true"} いいえ

[ []{.docon .docon-dislike} ]{.icon aria-hidden="true"} いいえ

::::: {.popover-content .width-200 .width-300-tablet role="dialog" aria-labelledby="popover-heading" aria-describedby="popover-description"}
このトピックについてサポートが必要ですか?

このトピックの意図を把握したり、理解を深めたりするために Ask Learn を使ってみませんか?

:::: {.buttons .flex-direction-row .flex-wrap .justify-content-center .gap-xxs}
::: {}
[ []{.docon .docon-chat-sparkle-fill .gradient-ask-learn-logo} ]{.icon .font-size-lg aria-hidden="true"}

[ []{.docon .docon-chat-sparkle-fill .gradient-ask-learn-logo} ]{.icon .font-size-lg aria-hidden="true"} Learn に質問する

[ []{.docon .docon-chat-sparkle-fill .gradient-ask-learn-logo} ]{.icon .font-size-lg aria-hidden="true"} Learn に質問する
:::

[ []{.docon .docon-feedback} ]{.icon aria-hidden="true"} 修正を提案しますか?
::::
:::::
::::::
:::::::
::::::::
::::::::::::::::::::::::::::::

:::::: {#ms--additional-resources-mobile .display-none-print}

------------------------------------------------------------------------

## その他のリソース {#ms--additional-resources-mobile-heading .title .is-3 hidden=""}

::: {#right-rail-recommendations-mobile .section bi-name="recommendations" hidden=""}
:::

::: {#right-rail-training-mobile .section bi-name="learning-resource-card" hidden=""}
:::

::: {#right-rail-events-mobile .section bi-name="events-card" hidden=""}
:::
::::::

::: {#article-metadata-footer .page-metadata-container bi-name="article-metadata-footer" test-id="article-metadata-footer"}

------------------------------------------------------------------------

- [ Last updated on 2025-07-24 ]{.badge .badge-sm .text-wrap-pretty}
:::
::::::::::::::::::::::::::::::::::::

::: {#action-panel .action-panel role="region" aria-label="アクション パネル" tabindex="-1"}
:::
::::::::::::::::::::::::::::::::::::::::
