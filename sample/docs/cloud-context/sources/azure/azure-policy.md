---
source_url: "https://learn.microsoft.com/ja-jp/azure/governance/policy/overview"
fetched_at: "2026-03-27T21:22:26Z"
vendor: "azure"
layer: "foundation"
---

::::::::::::::::::::::::::::::::::::::: {#main .layout-body-main role="main" bi-name="content" lang="ja-jp" dir="ltr"}
:::: {#ms--content-header .content-header .default-focus .border-bottom-none bi-name="content-header"}
::: {.content-header-controls .margin-xxs .margin-inline-sm-tablet}
[[]{.docon .docon-menu}]{.icon aria-hidden="true"} [ 目次 ]{.contents-expand-title}

[[]{.docon .docon-exit-mode}]{.icon aria-hidden="true"} エディター モードを終了する
:::
::::

::::::::::::::::::::::::::::::::::: {.padding-sm .padding-top-none .padding-top-sm-tablet main-column=""}
::::::::::::::::::::::::::::: {}
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
# Azure Policy とは {#what-is-azure-policy}
:::

:::: {#article-metadata .page-metadata-container .display-flex .gap-xxs .justify-content-space-between .align-items-center .flex-wrap-wrap bi-name="article-metadata" test-id="article-metadata"}
::: {#user-feedback .margin-block-xxs .display-none .display-none-print hidden="" hide-on-archived=""}
[ []{.docon .docon-like} ]{.icon aria-hidden="true"} フィードバック
:::
::::

## この記事の内容 {#ms--in-this-article .title .is-6 .margin-block-xs}

:::::::: content
この概要では、Azure Policy を使用して組織標準を適用し、コンプライアンスを大規模に評価する方法について説明します。 コンプライアンス ダッシュボードを通じて、環境の全体的な状態を評価するための集計ビューを提供します。これには、リソースごと、およびポリシーごとの粒度でドリルダウンできる機能が備わっています。 既存のリソースの一括修復と新しいリソースの自動修復を使用して、お客様のリソースでコンプライアンスを実現するのにも便利です。

::: NOTE
Note

修復の詳細については、「Azure Policy を使用した [非準拠リソースの修復](how-to/remediate-resources){linktype="relative-path"}」を参照してください。
:::

Azure Policy の一般的なユースケースには、リソースの整合性、規制コンプライアンス、セキュリティ、コスト、管理のガバナンスの実装が含まれています。 これらの一般的なユース ケース用のポリシー定義は、使用を開始できるようにビルトインとして Azure 環境に既に用意されています。

Azure Policy で適用できる便利なガバナンス アクションには、次のようなものがあります。

- チームが Azure リソースを許可されたリージョンにのみデプロイすることを確認します。
- 分類タグの一貫性のある適用を強制します。
- Log Analytics ワークスペースに診断ログを送信するためにリソースを要求する。

[Azure Arc](/ja-jp/azure/azure-arc/overview){linktype="absolute-path"} の導入により、ポリシーベースのガバナンスをさまざまなクラウド プロバイダー全体、さらにはローカル データセンターに拡張できることを認識することが重要です。

Azure Policy のデータとオブジェクトはすべて、暗号化された状態で保存されます。 詳細については、「[保存時の Azure データの暗号化](../../security/fundamentals/encryption-atrest){linktype="relative-path"}」を参照してください。

## 概要 {#overview}

Azure Policy では、Azure 内のリソースのプロパティをビジネス ルールと比較して、それらのリソースとアクションを評価します。 [JSON 形式](concepts/definition-structure-basics){linktype="relative-path"}で記述されるこれらのビジネス ルールは、[ポリシー定義](#policy-definition){linktype="self-bookmark"}と呼ばれます。 管理を簡略化するために、複数のビジネス ルールをグループ化して [ポリシー イニシアチブ](#initiative-definition){linktype="self-bookmark"}を形成し、 *policySet* とも呼ばれます。

ビジネス ルールの作成後、ポリシー定義またはイニシアティブは、Azure がサポートするリソースのスコープに [割り当てられます](#assignments){linktype="self-bookmark"} 。 たとえば、 [管理グループ](../management-groups/overview){linktype="relative-path"}、サブスクリプション、 [リソース グループ](../../azure-resource-manager/management/overview#resource-groups){linktype="relative-path"}、個々のリソースなどです。 割り当ては、その割り当ての [Resource Manager スコープ](../../azure-resource-manager/management/overview#understand-scope){linktype="relative-path"}内のすべてのリソースに適用されます。 サブスコープは必要に応じて除外できます。 詳細については、[Azure Policy のスコープ](concepts/scope){linktype="relative-path"}に関するページを参照してください。

Azure Policy では、リソースが準拠しているかどうかを特定するために評価で使用されるロジックの作成に、[JSON 形式](concepts/definition-structure-basics){linktype="relative-path"}を使用します。 定義には、メタデータとポリシー規則が含まれています。 定義される規則では、目的とするシナリオに正確に合わせて関数、パラメーター、論理演算子、条件、プロパティの[別名](concepts/definition-structure-alias){linktype="relative-path"}を使用できます。 ポリシー規則によって、割り当てのスコープ内のどのリソースが評価されるかが決定されます。

### 評価結果を理解する {#understand-evaluation-outcomes}

リソースは、リソース ライフサイクル、ポリシー割り当てライフサイクル、進行中の定期的なコンプライアンス評価の間に、特定のタイミングで評価されます。 リソースの評価が行われるタイミングまたはイベントは次のとおりです。

- ポリシー割り当てを使用してリソースがスコープ内で作成または更新される。
- スコープは、ポリシーまたはイニシアティブの新しい割り当てを取得します。
- 既にスコープに割り当てられているポリシーまたはイニシアティブが更新される。
- 24 時間に 1 回発生する標準のコンプライアンス評価サイクル。

ポリシーの評価が実施されるタイミングと方法の詳細については、「[評価のトリガー](how-to/get-compliance-data#evaluation-triggers){linktype="relative-path"}」を参照してください。

### 評価への対応を制御する {#control-the-response-to-an-evaluation}

準拠していないリソースを処理するためのビジネス ルールは、組織によって大きく異なります。 たとえば、組織がプラットフォームで準拠していないリソースに対応する方法には、以下のようなものがあります。

- リソースの変更を拒否します。
- リソースへの変更をログに記録します。
- 変更前にリソースを変更します。
- 変更後にリソースを変更します。
- 関連する準拠リソースをデプロイします。
- リソースに対するアクションをブロックします。

Azure Policy では、[効果](concepts/effect-basics){linktype="relative-path"}を適用して、これらの各ビジネス対応を実現できます。 効果は、**ポリシー定義**の[ポリシー規則](concepts/definition-structure-basics){linktype="relative-path"}の部分で設定されます。

### 準拠していないリソースを修復する {#remediate-non-compliant-resources}

これらの影響は主にリソースの作成時または更新時にリソースに影響を与えますが、Azure Policy では、準拠していない既存のリソースを変更せずに、そのリソースを処理することもできます。 既存のリソースを準拠させる方法の詳細については、「Azure Policy を使用して [非準拠リソースを修復](how-to/remediate-resources){linktype="relative-path"}する」を参照してください。

## 作業の開始 {#getting-started}

### Azure Policy と Azure RBAC {#azure-policy-and-azure-rbac}

Azure Policy と Azure ロールベースのアクセス制御 (Azure RBAC) には、いくつかの主要な違いがあります。 Azure Policy では、Resource Manager で表されるリソースのプロパティと一部のリソースプロバイダーのプロパティを調査することによって状態を評価します。 Azure Policy では、だれが変更を行ったかや、だれが変更を行うアクセス許可を持っているかに関係なく、リソースがお客様のビジネス ルールに準拠した状態になります。 Azure Policy では、DenyAction 効果により、リソースに対する特定のアクションをブロックすることもできます。 [ポリシー定義](#policy-definition){linktype="self-bookmark"}、[イニシアチブ定義](#initiative-definition){linktype="self-bookmark"}、[割り当て](#assignments){linktype="self-bookmark"}などの一部の Azure Policy リソースは、すべてのユーザーに表示されます。 この設計により、すべてのユーザーとサービスに対して、その環境でどのようなポリシー ルールが設定されているかの透明性が実現されます。

Azure RBAC の焦点は、さまざまなスコープでのユーザー[操作](../../role-based-access-control/resource-provider-operations){linktype="relative-path"}の管理にあります。 ユーザー情報に基づいてアクションの制御が必要な場合は、Azure RBAC が使用に適したツールになります。 あるユーザーがアクションを実行するためのアクセス権を持っていても、結果としてリソースが準拠していない場合、その作成や更新は Azure Policy によってブロックされます。

Azure RBAC と Azure Policy を組み合わせることによって、Azure で完全なスコープの制御を実現できます。

### Azure Policy における Azure RBAC アクセス許可 {#azure-rbac-permissions-in-azure-policy}

Azure Policy は、次の 2 つのリソース プロバイダーにおいて、いくつかのアクセス許可 (操作) を有しています。

- [Microsoft.Authorization](../../role-based-access-control/resource-provider-operations#microsoftauthorization){linktype="relative-path"}
- [Microsoft.PolicyInsights](../../role-based-access-control/resource-provider-operations#microsoftpolicyinsights){linktype="relative-path"}

Azure Policy のリソースに対するアクセス許可は、さまざまな組み込みロールによって与えられます。 **リソース ポリシーの共同作成者**ロールには、Azure Policy のほとんどの操作が含まれます。 **所有者**は完全な権限を持っています。 **共同作成者**と**閲覧者**はどちらも、Azure Policy のすべての \"*読み取り*\" 操作にアクセスできます。

**共同作成者** はリソースの修復をトリガーする可能性がありますが、定義と割り当てを *作成* または *更新* することはできません。 **ユーザー アクセス管理者** は、 `deployIfNotExists` または `modify` 割り当てに必要なアクセス許可をマネージド ID に付与する必要があります。

::: NOTE
Note

定義、イニシアティブ、割り当てを含むすべてのポリシー オブジェクトは、そのスコープ内のすべてのロールに対して読み取り可能です。 たとえば、Azure サブスクリプションをスコープとするポリシーの割り当ては、サブスクリプション スコープ以下のすべてのロール所有者が読み取り可能です。
:::

いずれの組み込みロールにも必要なアクセス許可がない場合は、[カスタム ロール](../../role-based-access-control/custom-roles){linktype="relative-path"}を作成してください。

Azure Policy の操作は、Azure 環境に大きな影響を与える可能性があります。 タスクの実行に必要な最小限のアクセス許可セットのみを割り当て、アクセス許可が必要なユーザーにのみこれらのアクセス許可を付与します。

::: NOTE
Note

`deployIfNotExists`または`modify`ポリシー割り当てのマネージド ID には、対象リソースを作成または更新するための十分なアクセス許可が必要です。 詳細については、「 [ポリシー定義の構成」を](how-to/remediate-resources#configure-the-policy-definition){linktype="relative-path"}参照してください。
:::

### Azure Virtual Network Manager を使用した Azure Policy に対する特別なアクセス許可の要件 {#special-permissions-requirement-for-azure-policy-with-azure-virtual-network-manager}

[Azure Virtual Network Manager (プレビュー)](../../virtual-network-manager/overview){linktype="relative-path"} を使用すると、クラウド インフラストラクチャ全体で複数の Azure 仮想ネットワークに一貫した管理ポリシーとセキュリティ ポリシーを適用できます。 Azure Virtual Network Manager (AVNM) 動的グループは、Azure Policy 定義を使用して、それらのグループの仮想ネットワーク メンバーシップを評価します。

Azure Virtual Network Manager 動的グループ ポリシーを作成、編集、または削除するには、次のものが必要です。

- 基になるポリシーに対する Azure RBAC の読み取りおよび書き込みアクセス許可
- ネットワーク グループに参加するための Azure RBAC アクセス許可。 従来の管理者の承認はサポートされていません。

必要なリソース プロバイダーの権限は `Microsoft.Network/networkManagers/networkGroups/join/action` です。

::: IMPORTANT
重要

AVNM 動的グループを変更するには、Azure RBAC ロールの割り当てのみを使用してアクセス権を付与する必要があります。 従来の管理者またはレガシ承認はサポートされていません。 アカウントに Co-Administrator サブスクリプション ロールのみが割り当てられている場合、AVNM 動的グループに対するアクセス許可はありません。
:::

### Azure Policy の対象となるリソース {#resources-covered-by-azure-policy}

ポリシーは管理グループ レベルで割り当てることができますが、評価されるのはサブスクリプションまたはリソース グループ レベルのリソース*のみ*です。

[マシン構成](../machine-configuration/overview){linktype="relative-path"}、[Azure Kubernetes Service](/ja-jp/azure/aks/intro-kubernetes){linktype="absolute-path"}、[Azure Key Vault](/ja-jp/azure/key-vault/general/overview){linktype="absolute-path"} などの特定のリソース プロバイダーについては、設定とオブジェクトを管理するための詳細な統合機能があります。 詳細については、[リソース プロバイダーのモード](concepts/definition-structure-basics#resource-provider-modes){linktype="relative-path"}に移動してください。

### ポリシー管理に関する推奨事項 {#recommendations-for-managing-policies}

留意すべきいくつかの指摘とヒントを次に示します。

- ポリシー定義が環境内のリソースに与える影響を追跡するために、強制 (`audit`、`auditIfNotExists`、`deny`) 効果ではなく、`modify`または`deployIfNotExists`効果から始めます。 アプリケーションを自動スケールするスクリプトが既に実装されている場合、強制効果を設定すると、そのような自動化タスクに支障をきたす可能性があります。

- 定義と割り当てを作成するときは、組織階層を考慮してください。 管理グループやサブスクリプション レベルのような高いレベルで定義を作成することをお勧めします。 それから、次の子レベルで割り当てを作成します。 管理グループで定義を作成した場合、その管理グループ内にあるサブスクリプションまたはリソース グループまで割り当ての対象にできます。

- 1 つのポリシー定義で始める場合でも、イニシアチブ定義を作成して割り当てることをお勧めします。 このメソッドを使用すると、後で管理する割り当ての数を増やすことなく、ポリシー定義をイニシアチブに追加できます。

  - たとえば、ポリシー定義 *policyDefA* を作成し、これをイニシアチブ定義 *initiativeDefC* の下に追加するとします。 後で *policyDefA* に似た目標の別のポリシー定義 *policyDefB* を作成する場合、それを *initiativeDefC* の下に追加して、まとめて追跡できます。

  - イニシアティブの割り当てを作成すると、イニシアチブに追加されたポリシー定義も、そのイニシアチブの割り当ての一部になります。

  - イニシアチブ割り当てが評価されたときは、イニシアチブ内のすべてのポリシーも評価されます。 ポリシーを個別に評価する必要がある場合は、ポリシーをイニシアティブに含めないことをお勧めします。

- ポリシーの定義、イニシアチブ、割り当ての変更に関する手動レビューを使用して、Azure Policy リソースをコードとして管理します。 推奨されるパターンとツールの詳細については、「 [コード ワークフローとして Azure Policy を設計](concepts/policy-as-code){linktype="relative-path"}する」を参照してください。

## Azure Policy のオブジェクト {#azure-policy-objects}

オブジェクトには、ポリシー定義、イニシアチブ定義、および割り当てが含まれます。

### ポリシー定義 {#policy-definition}

Azure Policy でポリシーを作成して実装する手順は、ポリシー定義を作成するときに始まります。 すべてのポリシー定義には、適用される条件があります。 また、条件が満たされた場合に実現される効果も定義されています。

Azure Policy には、既定で使うことができる組み込みポリシーがいくつかあります。 次に例を示します。

- **許可されているストレージ アカウント SKU** (拒否): デプロイされているストレージ アカウントが SKU サイズの設定内であるかどうかを判断します。 その効果として、定義されている SKU サイズの設定に準拠していないすべてのストレージ アカウントが拒否されます。
- **許可されているリソースの種類** (拒否): デプロイできるリソースの種類を定義します。 その効果として、この定義済みリストの一部ではないすべてのリソースが拒否されます。
- **許可されている場所** (拒否): 新しいリソースに使用できる場所を制限します。 その効果は、geo コンプライアンス要件を強制するために使用されます。
- **許可されている仮想マシン SKU** (拒否): デプロイできる仮想マシン SKU のセットを指定します。
- **リソースにタグを追加する** (変更): デプロイ要求で指定されていない場合は、必要なタグとその既定値を適用します。
- **許可されていないリソースの種類** (拒否): 一覧にあるリソースの種類がデプロイされないようにします。

これらのポリシー定義 (組み込み定義とカスタム定義の両方) を実装するには、割り当てを行う必要があります。 こうしたポリシーを割り当てるには、Azure Portal、PowerShell、または Azure CLI を使用します。

ポリシーの割り当てやポリシーの更新など、いくつかの異なるアクションでポリシーの評価が行われます。 完全な一覧については、「[Policy evaluation triggers](how-to/get-compliance-data#evaluation-triggers){linktype="relative-path"}」(ポリシー評価のトリガー) をご覧ください。

ポリシー定義の構造の詳細については、 [Azure Policy 定義の構造の基本を](concepts/definition-structure-basics){linktype="relative-path"}確認してください。

ポリシー パラメーターは、作成する必要があるポリシー定義の数を減らしてポリシーの管理を簡素化するのに役立ちます。 ポリシー定義を作成するときにパラメーターを定義して、ポリシー定義を汎用化できます。 その後、そのポリシー定義を、さまざまなシナリオで再利用できます。 これを行うには、ポリシー定義を割り当てるときに、さまざまな値を渡します。 たとえば、サブスクリプションに対して一連の場所を指定します。

パラメーターは、ポリシー定義を作成するときに定義されます。 パラメーターの定義には、パラメーター名と省略可能な値が含まれます。 たとえば、\"*場所*\" というポリシーのパラメーターを定義できます。 その後、ポリシーを割り当てるときに、*EastUS*、*WestUS* など、さまざまな値を指定できます。

ポリシー パラメーターの詳細については、「 [Azure Policy 定義の構造パラメーター」を](concepts/definition-structure-parameters){linktype="relative-path"}参照してください。

### イニシアチブ定義 {#initiative-definition}

イニシアチブ定義は、単一の包括的なゴールを達成することを目的として調整されたポリシー定義のコレクションです。 イニシアチブ定義により、ポリシー定義の管理と割り当てが簡素化されます。 簡素化するには、一連のポリシーを 1 つのアイテムとしてグループ化します。 たとえば、**Microsoft Defender for Cloud で監視を有効にする**というタイトルでイニシアティブを作成し、Microsoft Defender for Cloud インスタンスで利用できるすべてのセキュリティ推奨を監視することを目標とします。

::: NOTE
Note

Azure CLI や Azure PowerShell などの SDK では、**PolicySet** という名前のプロパティとパラメーターを使用して、イニシアチブを参照します。
:::

このイニシアチブでは、次のようなポリシー定義を作成します。

- **暗号化されていない SQL Database を Microsoft Defender for Cloud で監視する** - 暗号化されていない SQL データベースとサーバーを監視します。
- **OS の脆弱性を Microsoft Defender for Cloud で監視する** - 構成されているベースラインを満たしていないサーバーを監視します。
- **エンドポイント保護の不足を Microsoft Defender for Cloud で監視する** - エンドポイント保護エージェントがインストールされていないサーバーを監視します。

ポリシー パラメーターと同様に、イニシアチブ パラメーターは冗長性を減らすことでイニシアチブの管理を簡素化できます。 イニシアチブ パラメーターは、イニシアチブ内のポリシー定義によって使われるパラメーターです。

たとえば、次のシナリオでは、イニシアティブ定義 **initiativeC** があり、ポリシー定義 **policyA** と **policyB** があり、それぞれ異なる種類のパラメーターが必要です。

  Policy        パラメーターの名前        パラメーターの型   Note
  ------------- ------------------------- ------------------ -----------------------------------------------------------------------------------------------------------
  **policyA**   `allowedLocations`        アレイ             このパラメーターは、パラメーター型が配列として定義されているため、値の文字列の一覧を受け取ります。
  **policyB**   `allowedSingleLocation`   文字列             このパラメーターは、パラメーター型が文字列として定義されているため、値に対して 1 つの単語を受け取ります。

**initiativeC のイニシアティブ** パラメーターを定義する場合、次の 3 つのオプションがあります。

- このイニシアチブ内のポリシー定義のパラメーターを使用します。この例では、 `allowedLocations` と `allowedSingleLocation`**initiativeC** のイニシアチブ パラメーターになります。
- このイニシアチブ定義内でポリシー定義のパラメーターに値を指定します。 この例では、 **policyA** パラメーター `allowedLocations` と **policyB**`allowedSingleLocation` に場所の一覧を指定できます。 このイニシアチブを割り当てるときに値を指定することもできます。
- このイニシアチブを割り当てるときに使うことができる \"*値*\" オプションのリストを指定します。 このイニシアチブを割り当てるときは、イニシアチブ内のポリシー定義から継承したパラメーターは、この指定されたリストの値だけを持つことができます。

イニシアチブ定義で値オプションを作成する場合、イニシアチブの割り当て中に別の値を入力することはできません。これはリストに含まれていないためです。

イニシアチブ定義の構造の詳細については、 [Azure Policy イニシアチブ定義の構造を](concepts/initiative-definition-structure){linktype="relative-path"}確認してください。

### 代入 {#assignments}

割り当ては、特定のスコープに割り当てられたポリシー定義またはイニシアティブです。 このスコープの範囲は、[管理グループ](../management-groups/overview){linktype="relative-path"}から個々のリソースまでです。 \"*スコープ*\" という用語は、定義が割り当てられる、すべてのリソース、リソース グループ、サブスクリプション、または管理グループのことを指します。 すべての子リソースが割り当てを継承します。 この設計は、リソース グループに適用された定義が、そのリソース グループ内のリソースにも適用されることを意味します。 ただし、サブスコープを割り当てから除外できます。

たとえば、サブスクリプション スコープで、ネットワーク リソースの作成を禁止する定義を割り当てることができます。 ネットワーク インフラストラクチャを対象としたリソース グループを、そのサブスクリプション内で除外できます。 その後、このネットワーク リソース グループへのアクセスは、信頼できるユーザーに許可し、そのユーザーがネットワーク リソースを作成できるようにします。

別の例として、リソースの種類の許可リスト定義を管理グループ レベルで割り当てたいとしましょう。 そのうえで、より制限の緩やかな (より多くのリソースの種類を許可する) ポリシーを子管理グループまたはサブスクリプションに直接割り当てます。 しかし、この例はうまくいきません。Azure Policy は明示的な拒否のシステムであるためです。 代わりに、管理グループレベルの割り当てから、子管理グループまたはサブスクリプションを除外する必要があります。 そのうえで、より制限の緩やかな定義を子管理グループまたはサブスクリプション レベルで割り当てます。 いずれかの割り当てでリソースが拒否される場合、拒否割り当てに変更を加えることが、そのリソースを許可する唯一の方法となります。

ポリシーの割り当てでは、リソースを評価するときに、割り当てられた定義またはイニシアチブの最新の状態が常に使用されます。 割り当てられたポリシー定義が変更された場合、その定義のすべての既存の割り当てでは、評価時に更新されたロジックが使用されます。

ポータルを使用した割り当ての設定の詳細については、[ポリシー割り当てを作成し、Azure 環境内の準拠していないリソースを特定する方法](assign-policy-portal){linktype="relative-path"}に関するページを参照してください。 [PowerShell](assign-policy-powershell){linktype="relative-path"}と[Azure CLI](assign-policy-azurecli){linktype="relative-path"} の場合の手順も利用することができます。 割り当て構造の詳細については、「 [Azure Policy の割り当て構造」を](concepts/assignment-structure){linktype="relative-path"}参照してください。

## Azure Policy オブジェクトの最大数 {#maximum-count-of-azure-policy-objects}

Azure Policy では、オブジェクトの種類ごとに最大数があります。 定義の場合、\"スコープ\" というエントリは*管理グループ*またはサブスクリプションを意味します。[](../management-groups/overview){linktype="relative-path"} 割り当てと除外の場合、\"スコープ\" というエントリは、管理グループ、サブスクリプション、リソース グループ、または個々のリソースを意味します。

  Where                                                    対象                                 最大数
  -------------------------------------------------------- ------------------------------------ -----------
  Scope                                                    ポリシーの定義数                     500
  Scope                                                    イニシアチブ定義                     200
  Tenant                                                   イニシアチブ定義                     2,500
  Scope                                                    ポリシーとイニシアティブの割り当て   200
  Scope                                                    適用除外                             1000
  ポリシー定義                                             パラメーター                         20
  イニシアチブ定義                                         ポリシー                             1000
  イニシアチブ定義                                         パラメーター                         400
  ポリシーとイニシアティブの割り当て                       除外 (notScopes)                     400
  ポリシー規則                                             入れ子になった条件                   512
  修復タスク                                               リソース                             50,000
  ポリシー定義、イニシアティブ、または割り当ての要求本文   バイト                               1,048,576

ポリシー規則には、条件の数とその複雑さに対する追加の制限があります。 詳細については、「 [ポリシー ルールの制限」](concepts/definition-structure-policy-rule#policy-rule-limits){linktype="relative-path"}を参照してください。

## 次のステップ {#next-steps}

Azure Policy の概要といくつかの主要な概念を確認したら、次のリンクを使用してサービスの詳細を確認します。

- [Azure Policy 用語集](policy-glossary){linktype="relative-path"}。
- [Azure Policy 定義構造の基本](concepts/definition-structure-basics){linktype="relative-path"}。
- [クイック スタート: Azure portal を使用してポリシーの割り当てを作成し、準拠していないリソースを識別します](assign-policy-portal){linktype="relative-path"}。
::::::::

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
:::::::::::::::::::::::::::::

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

- [ Last updated on 2025-09-26 ]{.badge .badge-sm .text-wrap-pretty}
:::
:::::::::::::::::::::::::::::::::::

::: {#action-panel .action-panel role="region" aria-label="アクション パネル" tabindex="-1"}
:::
:::::::::::::::::::::::::::::::::::::::
