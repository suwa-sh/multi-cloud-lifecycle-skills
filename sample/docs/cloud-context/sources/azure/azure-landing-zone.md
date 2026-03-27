---
source_url: "https://learn.microsoft.com/ja-jp/azure/cloud-adoption-framework/ready/landing-zone/"
fetched_at: "2026-03-27T21:22:26Z"
vendor: "azure"
layer: "foundation"
---

:::::::::::::::::::::::::::::::::::::: {#main .layout-body-main role="main" bi-name="content" lang="ja-jp" dir="ltr"}
:::: {#ms--content-header .content-header .default-focus .border-bottom-none bi-name="content-header"}
::: {.content-header-controls .margin-xxs .margin-inline-sm-tablet}
[[]{.docon .docon-menu}]{.icon aria-hidden="true"} [ 目次 ]{.contents-expand-title}

[[]{.docon .docon-exit-mode}]{.icon aria-hidden="true"} エディター モードを終了する
:::
::::

:::::::::::::::::::::::::::::::::: {.padding-sm .padding-top-none .padding-top-sm-tablet main-column=""}
:::::::::::::::::::::::::::: {}
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
# Azure ランディング ゾーンとは {#what-is-an-azure-landing-zone}
:::

:::: {#article-metadata .page-metadata-container .display-flex .gap-xxs .justify-content-space-between .align-items-center .flex-wrap-wrap bi-name="article-metadata" test-id="article-metadata"}
::: {#user-feedback .margin-block-xxs .display-none .display-none-print hidden="" hide-on-archived=""}
[ []{.docon .docon-like} ]{.icon aria-hidden="true"} フィードバック
:::
::::

## この記事の内容 {#ms--in-this-article .title .is-6 .margin-block-xs}

::::::: content
Azure ランディング ゾーンは、Azure を利用するすべての組織に対して標準化され、推奨されるアプローチです。 Azure 環境を大規模に設定および管理するための一貫した方法が提供されます。 [プラットフォームとアプリケーションのランディング ゾーン](#platform-landing-zone-vs-application-landing-zones){linktype="self-bookmark"}を通じて、セキュリティ、コンプライアンス、運用効率に関する主要な要件に合わせて調整することで、組織全体の一貫性を確保します。 これらは、8 つの[設計領域](design-principles){linktype="relative-path"}にわたる主要[な設計原則](design-areas){linktype="relative-path"}に沿った、適切に設計された基盤を提供します。

## Azure ランディング ゾーン アーキテクチャ {#azure-landing-zone-architecture}

Azure ランディング ゾーン アーキテクチャはスケーラブルかつモジュール式で、さまざまなデプロイ ニーズを満たします。 反復可能なインフラストラクチャのため、すべてのサブスクリプションに一貫性をもって構成と制御を適用できます。 モジュールによって、要件の発展に合わせて、特定の Azure ランディング ゾーン アーキテクチャのコンポーネントのデプロイおよび変更を行うことが簡単になります。

Azure ランディング ゾーンの参照アーキテクチャ (*図 1 を参照*) は、Azure ランディング ゾーンの承認されたターゲット アーキテクチャを表します。 この参照アーキテクチャを出発点として使用し、 [ニーズに合わせてアーキテクチャを調整する必要があります](tailoring-alz){linktype="relative-path"}。

[ [![Azure ランディング ゾーンの参照アーキテクチャ図。](../enterprise-scale/media/azure-landing-zone-architecture-diagram-hub-spoke.svg){linktype="relative-path"}](../enterprise-scale/media/azure-landing-zone-architecture-diagram-hub-spoke.svg#lightbox){linktype="relative-path"} ]{.mx-imgBorder} *図 1: Azure ランディング ゾーンの参照アーキテクチャ。このアーキテクチャの [Visio ファイル](https://github.com/MicrosoftDocs/cloud-adoption-framework/raw/main/docs/ready/enterprise-scale/media/enterprise-scale-architecture.vsdx){linktype="external"} または [PDF ファイル](https://github.com/MicrosoftDocs/cloud-adoption-framework/raw/main/docs/ready/enterprise-scale/media/enterprise-scale-architecture.pdf){linktype="external"} をダウンロードします。*

**設計領域:** 参照アーキテクチャは、8 つの設計領域間の関係を示しています。 これらの設計領域は、Azure の課金と Microsoft Entra テナント、ID およびアクセス管理、管理グループとサブスクリプションの組織、ネットワーク トポロジと接続、セキュリティ、管理、ガバナンス、プラットフォームの自動化と DevOps になります。 設計領域について詳しくは、[Azure ランディング ゾーン環境の設計領域](design-areas#environment-design-areas){linktype="relative-path"}をご覧ください。

**リソースの編成:** 参照アーキテクチャは、管理グループ階層のサンプルを示しています。 管理グループごとにサブスクリプション (黄色のボックス) を編成します。 \"プラットフォーム\" 管理グループの下のサブスクリプションは、プラットフォーム ランディング ゾーンを構成する共有サービスをホストします。 ランディング ゾーン管理グループの下にあるサブスクリプションは、アプリケーションのランディング ゾーンを表します。 参照アーキテクチャでは、5 つのサブスクリプションの詳細が示されています。 各サブスクリプションのリソースと、適用されたポリシーを確認できます。

[]{#platform-landing-zones-vs-application-landing-zones}

## プラットフォームランディングゾーンとアプリケーションランディングゾーン {#platform-landing-zone-vs-application-landing-zones}

Azure ランディング ゾーンは、1 つのプラットフォーム ランディング ゾーンと 1 つ以上のアプリケーション ランディング ゾーンで構成されます。 両方の機能についてできる限り詳しく説明します。

**プラットフォーム ランディング ゾーン:** プラットフォーム ランディング ゾーンは、アプリケーション ランディング ゾーン内のアプリケーションに共有サービス (ID、接続、管理) を提供します。 多くの場合、これらの共有サービスを統合すると、運用効率が向上します。 1 つ以上の中央チームがプラットフォーム ランディング ゾーンのサービスを管理します。 参照アーキテクチャ (*図 1 を参照*) では、\"ID サブスクリプション\"、\"管理サブスクリプション\"、\"接続サブスクリプション\" はプラットフォーム ランディング ゾーンのコンポーネントです。 参照アーキテクチャは、プラットフォーム ランディング ゾーン共有サービスをホストするサブスクリプションに適用される代表的なリソースとポリシーを示しています。

**アプリケーションランディングゾーン:** アプリケーション ランディング ゾーンには、1 つのワークロード/アプリケーションをホストするためのリソースが含まれています。 ワークロードには、環境 (開発、テスト、または運用環境) ごとにアプリケーション ランディング ゾーンが必要です。 各アプリケーション ランディング ゾーンは、スケーリングとサービスの制限に対応するために必要に応じて、1 つ以上のサブスクリプションで構成されます。 アプリケーション ランディング ゾーンのサブスクリプションは、 [サブスクリプションの自動販売機プロセス](/ja-jp/azure/cloud-adoption-framework/ready/landing-zone/design-area/subscription-vending){linktype="absolute-path"}を使用してコードを使用して事前にプロビジョニングします。一方、ワークロード チームは、アプリケーション ランディング ゾーンにワークロード コンポーネントをデプロイする責任を負います。

アプリケーション ランディング ゾーンは、親管理グループから Azure Policy 定義を継承するために、 `Online` や `Corp`などの適切な管理グループの下に入れ子になっています。 この構造により、ワークロード サブスクリプションは制御された一貫性のある方法でデプロイされますが、個々のワークロードのニーズに柔軟に対応できます。

Azure ランディング ゾーン アーキテクチャ (*図 1 を参照*) では、たとえば、\"ランディング ゾーン A2 サブスクリプション\" はアプリケーションランディング ゾーンです。 このアーキテクチャは、\"ランディング ゾーン A2 サブスクリプション\" に適用される代表的なリソースとポリシーを示しています。 \"ランディング ゾーン P1 サブスクリプション\" は、VM イメージ リポジトリやコンテナー レジストリなど、複数のアプリケーション ランディング ゾーンとチームをサポートするサービスを構築およびデプロイするためにプラットフォーム チームによって使用されます。 これらのサービスはアプリケーション固有ではなく、サブスクリプションは引き続きアプリケーション ランディング ゾーン レベルで適用されるガバナンス ポリシーの対象となります。

[ [![Application Landing Zones と Platform Landing Zone がオーバーレイされた Azure ランディング ゾーンの参照アーキテクチャ図。](media/alz-application-platform.svg){linktype="relative-path"}](media/alz-application-platform.svg#lightbox){linktype="relative-path"} ]{.mx-imgBorder} *図 2: Application Landing Zones と Platform Landing Zone がオーバーレイされた Azure ランディング ゾーン参照アーキテクチャ。このアーキテクチャの [Visio ファイル](https://github.com/MicrosoftDocs/cloud-adoption-framework/raw/main/docs/ready/enterprise-scale/media/enterprise-scale-architecture.vsdx){linktype="external"} または [PDF ファイル](https://github.com/MicrosoftDocs/cloud-adoption-framework/raw/main/docs/ready/enterprise-scale/media/enterprise-scale-architecture.pdf){linktype="external"} をダウンロードします。*

アプリケーション ランディング ゾーンの管理には、3 つの主要なアプローチがあります。 必要に応じて、次のいずれかの管理アプローチを使用する必要があります。

- 中央チームのアプローチ
- アプリケーション チームのアプローチ
- 共有チームのアプローチ

  アプリケーション ランディング ゾーンの管理アプローチ   説明
  ------------------------------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  中央チームによる管理                                   中央 IT チームがランディング ゾーンを完全に運用します。 このチームは、プラットフォームとアプリケーション ランディング ゾーンに制御とプラットフォーム ツールを適用します。
  アプリケーション チームによる管理                      プラットフォーム管理チームは、アプリケーション ランディング ゾーン全体をアプリケーション チームに委任します。 アプリケーション チームは環境を管理し、サポートします。 管理グループ ポリシーにより、プラットフォーム チームは引き続きアプリケーション ランディング ゾーンを管理できます。 サブスクリプション スコープで他のポリシーを追加し、アプリケーション ランディング ゾーンでのデプロイ、セキュリティ保護、または監視に、代替ツールを使用できます。
  共有管理                                               AKS や AVS などのテクノロジ プラットフォームを使用して、中央 IT チームが基になるサービスを管理します。 アプリケーション チームは、テクノロジ プラットフォーム上で実行されているアプリケーションを担当します。 このモデルでは、さまざまな制御またはアクセス許可を使用する必要があります。 これらの制御と権限はアプリケーション ランディング ゾーンを中央で管理するために使用するものとは異なります。

::: TIP
ヒント

さまざまな種類のアプリケーション ランディング ゾーンに関するガイダンスについては、「[共通のサブスクリプションの自動販売機製品ラインを確立する](/ja-jp/azure/cloud-adoption-framework/ready/landing-zone/design-area/subscription-vending-product-lines){linktype="absolute-path"}」を参照してください。
:::

## アプリケーション ランディング ゾーン アクセラレータ {#application-landing-zone-accelerators}

アプリケーション ランディング ゾーン アクセラレータは、アプリケーション ランディング ゾーン サブスクリプションに一般的なワークロードをデプロイするのに役立ちます。 [Azure アーキテクチャ センター](/ja-jp/azure/architecture/landing-zones/landing-zone-deploy#application){linktype="absolute-path"}にある使用可能なアプリケーション ランディング ゾーン アクセラレータの一覧を参照して、シナリオに合致するアクセラレータをデプロイします。

### Azure ランディング ゾーンでの AI {#ai-in-azure-landing-zones}

一般的な質問は、Azure ランディング ゾーンと共に専用の AI ランディング ゾーンが必要かどうかです。 答えは、別の AI ランディング ゾーンは必要ないということです。 代わりに、既存の Azure ランディング ゾーン アーキテクチャを使用して、AI ワークロードをアプリケーションランディング ゾーンにデプロイします。 Azure ランディング ゾーンの設計領域と原則は、AI ワークロードをサポートするのに十分です。これは、AI コンポーネントと非 AI コンポーネントとサービスの両方を含むアプリケーションとワークロードのガバナンス、セキュリティ、管理に必要な基盤を提供するためです。

個別の AI ランディング ゾーンを必要とせずに、AI サービスをアプリケーションのランディング ゾーンに統合できます。 ID とアクセス管理、ネットワーク トポロジと接続性、セキュリティ、ガバナンスなどの Azure ランディング ゾーンアーキテクチャ、設計原則、設計領域は、AI を含むすべてのワークロードに対応するように既に設計されています。

Azure ランディング ゾーンの観点から見ると、AI は、既存の Azure ランディング ゾーンのアーキテクチャ、原則、設計領域を利用して、プラットフォーム チームが他のアプリケーション、ワークロード、またはサービスと同様に、1 つ以上のアプリケーション ランディング ゾーン サブスクリプション内にデプロイ、管理、セキュリティ保護できる別のワークロードまたはサービスにすぎません。

Azure での AI 導入の詳細については、 [AI 導入シナリオ](/ja-jp/azure/cloud-adoption-framework/scenarios/ai/){linktype="absolute-path"}を参照してください。 AI ワークロードとランディング ゾーンに関する具体的な焦点については、 [AI 基盤の確立に関するページを](/ja-jp/azure/cloud-adoption-framework/scenarios/ai/ready#establish-an-ai-foundation){linktype="absolute-path"}参照してください。

## Azure ランディング ゾーンのデプロイと管理 {#deploying-and-managing-azure-landing-zone}

ランディング ゾーンの [実装オプション](implementation-options){linktype="relative-path"}の詳細については、Azure ランディング ゾーン (上記を参照) の一部であるプラットフォーム ランディング ゾーンをデプロイおよび管理する方法が複数あります。 組織のニーズと専門知識に最適な方法を選択できます。 複数のオプションを使用できます。

- [Azure ランディング ゾーンのインフラのコード化 (IaC) アクセラレータ](https://aka.ms/alz/accelerator){linktype="external"}***(推奨アプローチ)***
  - [プラットフォーム ランディング ゾーン (ALZ) 用 Azure Verified Modules (AVM) - Terraform](https://aka.ms/alz/acc/tf){linktype="external"}*(必要に応じてアクセラレータの外部でも使用できます)*
  - [プラットフォーム ランディング ゾーン (ALZ) 用 Azure Verified Modules (AVM) - Bicep](https://aka.ms/alz/acc/bicep){linktype="external"}*(必要に応じて、アクセラレータの外部でも使用できます)*
- [Azure プラットフォーム ランディング ゾーン ポータル アクセラレータ](https://aka.ms/alz/portal){linktype="external"}

Azure ランディング ゾーンのデプロイと管理には、Azure ランディング ゾーンの Infrastructure-as-Code (IaC) アクセラレータを使用して、Bicep や Terraform などのコードとしてのインフラストラクチャ (IaC) オプションを使用することを強くお勧めします。 これらのオプションにより、ポータル アクセラレータと比較して、柔軟性、再現性、スケーラビリティが向上します。

ただし、組織が IaC に必要な専門知識を持っていない場合や、より視覚的なアプローチを好む場合は、ポータル アクセラレータを適切な代替手段にすることができます。 IaC が推奨される方法である理由を理解するのに役立つ詳細については、「 [コードとしてインフラストラクチャを使用して Azure ランディング ゾーンを更新](/ja-jp/azure/cloud-adoption-framework/ready/considerations/infrastructure-as-code-updates){linktype="absolute-path"} する」を参照してください。

## 次のステップ {#next-steps}

Azure ランディング ゾーンの背後にある設計原則を確認して、セキュリティで保護されたスケーラブルな環境を導く方法を理解します。 デプロイする準備ができたら、ランディング ゾーンの作成と管理に使用できる実装オプションを確認します。 AI ランディング ゾーンが必要かどうか、エンタープライズ規模の違いなど、一般的な質問に対する簡単な回答については、FAQ を参照してください。

::: nextstepaction
[設計原則](design-principles){linktype="relative-path"}
:::

::: nextstepaction
[実装オプション](implementation-options){linktype="relative-path"}
:::

::: nextstepaction
[よく寄せられる質問 (FAQ)](/ja-jp/azure/cloud-adoption-framework/ready/enterprise-scale/faq){linktype="absolute-path"}
:::
:::::::

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
::::::::::::::::::::::::::::

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

- [ Last updated on 2025-12-15 ]{.badge .badge-sm .text-wrap-pretty}
:::
::::::::::::::::::::::::::::::::::

::: {#action-panel .action-panel role="region" aria-label="アクション パネル" tabindex="-1"}
:::
::::::::::::::::::::::::::::::::::::::
