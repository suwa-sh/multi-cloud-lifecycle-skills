---
source_url: "https://learn.microsoft.com/ja-jp/azure/cost-management-billing/costs/overview-cost-management"
fetched_at: "2026-03-27T21:22:26Z"
vendor: "azure"
layer: "foundation"
---

::::::::::::::::::::::::::::::::::: {#main .layout-body-main role="main" bi-name="content" lang="ja-jp" dir="ltr"}
:::: {#ms--content-header .content-header .default-focus .border-bottom-none bi-name="content-header"}
::: {.content-header-controls .margin-xxs .margin-inline-sm-tablet}
[[]{.docon .docon-menu}]{.icon aria-hidden="true"} [ 目次 ]{.contents-expand-title}

[[]{.docon .docon-exit-mode}]{.icon aria-hidden="true"} エディター モードを終了する
:::
::::

::::::::::::::::::::::::::::::: {.padding-sm .padding-top-none .padding-top-sm-tablet main-column=""}
::::::::::::::::::::::::: {}
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
# Microsoft Cost Management とは何か {#what-is-microsoft-cost-management}
:::

:::: {#article-metadata .page-metadata-container .display-flex .gap-xxs .justify-content-space-between .align-items-center .flex-wrap-wrap bi-name="article-metadata" test-id="article-metadata"}
::: {#user-feedback .margin-block-xxs .display-none .display-none-print hidden="" hide-on-archived=""}
[ []{.docon .docon-like} ]{.icon aria-hidden="true"} フィードバック
:::
::::

## この記事の内容 {#ms--in-this-article .title .is-6 .margin-block-xs}

:::: content
Microsoft Cost Management は、組織が Microsoft Cloud のコストの分析、監視、最適化を行うのに役立つ FinOps ツールのスイートです。 Cost Management は、課金アカウント、サブスクリプション、リソース グループ、または管理グループへのアクセスを持つすべてのユーザーが利用できます。 Cost Management には、課金とリソース管理のエクスペリエンス内でアクセスすることも、複数のスコープにわたってコストを管理する FinOps チーム向けに最適化されたスタンドアロン ツールとして個別にアクセスすることもできます。 また、ネイティブ機能を自動化して拡張したり、コストを伴う独自のツールやプロセスを強化したりして、すべての関係者とともに組織の可視性とアカウンタビリティを最大化し、最適化と効率性の目標をより迅速に実現できます。

Cost Management で行えることの例には次のいくつかが含まれます。

- Azure portal、Microsoft 365 管理センター、または Power BI でコストを報告して分析します。
- 予算、異常、予約の使用状況、スケジュールされたアラートに関するコストを事前に監視します。
- タグの継承を有効にし、コスト割り当てルールを使用して共有コストを分割します。
- ビジネス プロセスを自動化したり、データをエクスポートすることで外部ツールにコストを統合したりします。

## 料金の処理方法 {#how-charges-are-processed}

Cost Management のしくみを理解するには、まず Commerce システムを理解する必要があります。 Microsoft Commerce の中核となるのは、コンシューマーでも商用でも、すべての Microsoft 商用取引を支えるデータ パイプラインです。 サインアップや Marketplace の購入エクスペリエンスなど、このパイプラインへの入力と接続は多数ありますが、この記事では、コストの監視、割り当て、最適化に役立つコンポーネントに焦点を当てます。

[![Commerce データ パイプラインを示す図。](media/overview-cost-management/commerce-pipeline.svg){linktype="relative-path"}](media/overview-cost-management/commerce-pipeline.svg#lightbox){linktype="relative-path"}

左側では、Azure、Microsoft 365、Dynamics 365、Power Platform のサービスによって、使用および購入する製品とサービスが最も細かいレベルで測定されます。 各サービスは、測定された使用と購入の数量を、異なる周期で Commerce データ パイプラインにプッシュします。 一般に、あるサービスのデータが別のサービスより遅い場合は、それらのサービスが使用量と料金を発行する頻度が原因です。

データがパイプラインを通過する間に、評価システムがユーザー固有の価格シートに基づいて割引を適用し、\"評価済み使用量\" を生成します。これには各コスト レコードの価格と数量が含まれます。 単位の \"ブロック\" (例: \"100 時間\") で使用量を評価するブロック価格などの多様な価格モデルが原因で、測定された使用と購入の数量と価格数量は異なる場合があることに注意することが重要です。 使用と購入の数量は下位レベルの測定単位で提供されることが多いのに対して、価格数量の単位は上位レベルの価格単位である可能性があります。 Cost Management では測定単位で数量が表示されるのに対して、価格シートと請求書では価格単位で数量が表示されます。 月末にクレジットが適用され、請求書が発行されます。 このプロセスは、請求期間の終了 (ほとんどのアカウントで通常はカレンダー月の最終日) から 72 時間後に開始されます。 たとえば、請求期間が 3 月 31 日に終了した場合、4 月 4 日午前 0 時に料金が確定します。

::: IMPORTANT
重要

クレジットは、請求書が生成される前に、ギフト カードやその他の支払い方法と同様に適用されます。 新しい料金がデータ パイプラインに流れ込むたびにクレジット状態が追跡されますが、クレジットがこれらの料金に明示的に適用さるのは月末を過ぎてからです。
:::

ここまでのすべてが、料金の確定、割引の適用、請求書の発行を行う請求プロセスを構成します。 課金アカウントと課金プロファイルの所有者は、Azure portal または Microsoft 365 管理センター内の Billing エクスペリエンスの一部として、このプロセスをよく知っているかもしれません。 Billing エクスペリエンスを使うと、クレジットの確認、請求先住所と支払い方法の管理、請求書の支払いなど、Microsoft との課金リレーションシップの管理に関連するすべてのことを行うことができます。

- [異常検出](../understand/analyze-unexpected-charges){linktype="relative-path"}モデルにより、正規化された使用状況 (評価された使用状況ではなく) に基づいて、毎日異常が識別されます。
- コスト配分エンジンにより、タグの継承が適用され、[共有コストが分割されます](allocate-costs){linktype="relative-path"}。
- Azure Advisor のコストに関する推奨事項が取り込まれ、サブスクリプションとリソース グループに関するコスト削減の分析情報が得られます。
- 構成された設定に基づき、[予算](tutorial-acm-create-budgets){linktype="relative-path"}、[異常](../understand/analyze-unexpected-charges#create-an-anomaly-alert){linktype="relative-path"}、[スケジュールされたアラート](save-share-views#subscribe-to-scheduled-alerts){linktype="relative-path"}などについてコスト アラートが送信されます。

最後に、コストの詳細は Azure portal の [Cost Analysis](quick-acm-cost-analysis){linktype="relative-path"} から入手でき、 [スケジュールされたエクスポート](tutorial-improved-exports){linktype="relative-path"}を介してストレージ アカウントに発行されます。

## Cost Management と Billing の関係 {#how-cost-management-and-billing-relate}

[Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement/Menu){linktype="external"} は、コストの分析、管理、最適化を可能にする一連の FinOps ツールです。

[Billing](https://portal.azure.com/#view/Microsoft_Azure_GTM/ModernBillingMenuBlade){linktype="external"} は、課金アカウントの管理と請求書の支払いに必要なすべてのツールを提供します。

Cost Management は課金エクスペリエンス内から利用できますが、Cost Management は、Azure portal 内のすべてのサブスクリプション、リソース グループ、管理グループからも利用できます。これにより、全員が自分が責任を負うコストを完全に把握し、効率を最大化するためにワークロードを最適化することができます。 Cost Management は、複数の課金アカウント、サブスクリプション、リソース グループ、管理グループ間でコストを管理するプロセスを合理化するために、個別に使用することもできます。

[![課金組織と Cost Management の関係を示す図。](media/overview-cost-management/cost-management-availability.svg){linktype="relative-path"}](media/overview-cost-management/cost-management-availability.svg#lightbox){linktype="relative-path"}

## Cost Management と Billing に含まれるデータ {#what-data-is-included-in-cost-management-and-billing}

Billing エクスペリエンス内では、自分が使用するすべての製品、サブスクリプション、定期購入を管理し、クレジットとコミットメントを確認し、請求書の表示と支払いを行うことができます。 オンラインまたは PDF として請求書を利用でき、請求されるすべての料金と適用される税金が含まれます。 クレジットは、請求書の生成時に合計請求金額に適用されます。 この請求プロセスは、Cost Management のデータ処理と並行して行われます。つまり、Cost Management にはクレジット、税金、一部の購入 (MCA 以外のアカウントでのサポート料金など) は含まれません。

従来のクラウド ソリューション プロバイダー (CSP) とスポンサー プランのサブスクリプションは、Cost Management ではサポートされていません。 これらのサブスクリプションは、Microsoft 顧客契約に移行した後でサポートされます。

サポートされるオファー、含まれるデータ、または Cost Management でのデータの更新と保持方法について詳しくは、「[Cost Management のデータを理解する](understand-cost-mgt-data){linktype="relative-path"}」をご覧ください。

## クラウド コストを見積もる {#estimate-your-cloud-costs}

クラウドの旅を続ける中では、次のような価格を理解するのに役立つツールが多数利用できます。

- [Azure Migrate](https://azure.microsoft.com/products/azure-migrate/){linktype="external"} は、オンプレミスのワークロードを分析し、クラウド移行を計画するのに役立つ無料のツールです。
- [Azure 料金計算ツール](https://azure.microsoft.com/pricing/calculator/){linktype="external"}は、ユーザーが Azure サービスと製品のコストを理解して見積もる無料のコスト管理ツールです。 これは、Azure にソリューションをデプロイする際に予想されるコストを構成して予算を設定できる唯一の認証されていないエクスペリエンスとして機能します。 交渉済みの見積価格を表示する必要があるお客様には、認証されたバージョンがあります。 Azure 料金計算ツールを使用すると、組織はクラウドの費用を計画および予測し、さまざまな構成と価格モデルを評価し、サービスの選択とデプロイオプションに関する情報に基づいた意思決定を行うことができます。

## コストについて報告して分析する {#report-on-and-analyze-costs}

Cost Management と Billing には、請求された Microsoft Cloud のコストを理解し、報告し、分析するのに役立ついくつかのツールが含まれています。

- **[コスト分析](quick-acm-cost-analysis){linktype="relative-path"}** は、アドホック コスト探索のためのツールです。 軽量なインサイトと分析を使ってすばやく回答を得ます。 **Power BI** は、より広範なダッシュボードや複雑なレポートを作成したり、コストを他のデータと組み合わせたりするための、高度なソリューションです。 Power BI は、課金アカウントと課金プロファイルに使用できます。
- [**Exports API と Cost Details API**](../automate/usage-details-best-practices){linktype="relative-path"} を使うと、コストの詳細を外部システムやビジネス プロセスに統合できます。

詳細については、「[レポートの使用開始](reporting-get-started){linktype="relative-path"}」を参照してください。

## コストを整理して割り当てる {#organize-and-allocate-costs}

コストの整理と割り当ては、請求書が正しい部署に送られ、内部請求 (\"チャージバック\" とも呼ばれます) のためにさらに分割できるようにするために不可欠です。 クラウド コストを割り当てるための最初の手順は、理にかなったレポートとチャージバックを促進する方法でサブスクリプションとリソースを整理することです。 Microsoft はリソースとサブスクリプションを整理するための次のオプションを提供しています。

- MCA の**課金プロファイル**と**請求書セクション**は、[サブスクリプションを請求書にグループ化する](../manage/mca-section-invoice){linktype="relative-path"}ために使われます。 各請求プロファイルは異なる部署に請求できる個別の請求書を表し、各請求書セクションはそれらの請求書内で個別に分割されます。 コスト分析の請求プロファイルまたは請求書セクションでコストを表示することもできます。
- EA **部門** と **登録アカウント** は概念的には請求書セクションに似ていますが、サブスクリプションのグループですが、請求書 PDF には表示されません。 ただし、各請求書の基になるコストの詳細には含まれます。 Cost Analysis では、部門または登録アカウント別のコストを表示することもできます。
- **管理グループ**でサブスクリプションをグループ化することもできますが、いくつか重要な違いがあります。
  - 管理グループのアクセスは、サブスクリプションとリソースに継承されます。
  - 管理グループは複数のレベルに階層化でき、サブスクリプションは任意のレベルに配置できます。
  - 管理グループは、コストの詳細には含まれません。
  - すべての履歴コストは、その階層内の現在のサブスクリプションに基づき、管理グループに対して返されます。 サブスクリプションが移動すると、すべての履歴コストが移動します。
  - Azure Policy は管理グループをサポートしており、コスト ガバナンス戦略のコンプライアンス レポートを自動化するためのルールを割り当てることができます。
- **サブスクリプション**と**リソース グループ**は、クラウド ソリューションを整理できる最も低いレベルです。 Microsoft では、すべての製品が (1 つのリージョンに制限されることはあっても) 独自のサブスクリプション内で管理されます。 それによりコスト ガバナンスは簡単になりますが、サブスクリプション管理のために必要なオーバーヘッドが増えます。 ほとんどの組織では、事業単位にサブスクリプションを使用し、開発とテストの環境を運用環境や他の環境から分けてから、製品にリソース グループを使用します。 リソース グループの所有者にはリソース グループをまたがってコストを管理する方法がないため、コスト管理が複雑になります。 一方で、ほとんどのリソースベースの料金に誰が責任を持つのかを理解する簡単な方法です。 すべての料金がリソースから発生するわけではなく、リソース グループやサブスクリプションが関連付けられていないものもあることに注意してください。 エンタイトルメント オファーの購入トランザクションにリンクされているサブスクリプションとリソース グループは、コミットメントの恩恵を受ける使用状況に関連付けられているものと異なる場合があることを理解しておくことが重要です。 たとえば、予約を購入すると、トランザクションは課金サブスクリプションに関連付けられます。 その後、予約特典が実際の使用状況に適用されます。共有スコープを選択すると、別のサブスクリプションとリソース グループに記録される可能性があります。 また、MCA の課金アカウントに移行しても変更されます。
- **リソース タグ**は、コストの詳細に独自のビジネス コンテキストを追加する唯一の方法であり、おそらく、リソースをアプリケーション、部署、環境、所有者などにマップするための最も柔軟な方法です。制限事項と重要な考慮事項について詳しくは、「[コストと使用状況のデータでのタグの使用方法](understand-cost-mgt-data#how-tags-are-used-in-cost-and-usage-data){linktype="relative-path"}」をご覧ください。

リソースとサブスクリプションが、サブスクリプション階層を使用して整理され、さらなる割り当てを容易にするために必要なメタデータ (タグ) を備えるようになったら、Cost Management 内の次のツールを使用してコスト レポートを効率化します。

- [タグの継承](enable-tag-inheritance){linktype="relative-path"}は、サブスクリプションとリソース グループのタグをコスト データ内のリソースにまでコピーすることで、タグの適用を簡略化します。 これらのタグは、リソース自体には保存されません。 この変更は Cost Management 内でのみ行われ、Azure Policy などの他のサービスでは使用できません。
- [コスト割り当て](allocate-costs){linktype="relative-path"}は、あるサブスクリプション、リソース グループ、またはタグから別のサブスクリプション、リソース グループ、またはタグに共有コストを \"移動\" または分割する機能を提供します。 コストの割り当てでは、請求書は変更されません。 コスト割り当ての目的は、オーバーヘッドを削減し、最終的に (間接的にであれ) 料金がどこから発生しているかをより正確に報告することです。これにより、より完全なアカウンタビリティが促進されます。

コストを整理して割り当てる方法は、組織内のユーザーがコストを管理および最適化する方法において大きな役割を果たします。 必ず事前に計画し、毎年割り当て戦略を見直してください。

## アラートを使用してコストを監視する {#monitor-costs-with-alerts}

情報を常に把握し、アカウントと発生したコストを事前に管理できるように、Cost Management と Billing には、さまざまな種類のメールとアラートが用意されています。

- [**予算アラート**](tutorial-acm-create-budgets){linktype="relative-path"}は、定義されたコストまたは予想金額をコストが超えたときに受信者に通知します。 予算はコスト分析で視覚化でき、Cost Management でサポートされているすべてのスコープで使用できます。 サブスクリプションとリソース グループの予算を構成して、それ以上料金がかかるのを減らしたり止めたりするために、自動化されたアクションを実行するようアクション グループに通知することもできます。

- [**異常アラート**](../understand/analyze-unexpected-charges){linktype="relative-path"}は、毎日の使用状況で予期しない変化が検出されたときに受信者に通知します。 それは急増または急減となる可能性があります。 異常検出はサブスクリプションでのみ使用でき、Cost Analysis スマート ビュー内で表示できます。 異常アラートは、コスト アラート ページから構成できます。

- **[スケジュールされたアラートは](save-share-views#subscribe-to-scheduled-alerts){linktype="relative-path"}** 、コスト分析の保存されたコスト ビューに基づいて、毎日、毎週、または毎月のスケジュールで最新のコストについて受信者に通知します。 アラート メールには、ビューの視覚的なグラフ表現が含まれており、必要に応じて CSV ファイルを含めることができます。 ビューは Cost Analysis で構成されていますが、受信者がメール、グラフ、またはリンクされた CSV を送信するときに表示するために、Azure portal または Cost Management にアクセスする必要はありません。

- **EA コミットメント残高アラート**は、残高の 90% または 100% が使われると、EA 課金アカウントで構成されているすべての通知連絡先に自動的に送信されます。

- **請求書アラート**は、MCA 課金プロファイルおよび Microsoft オンライン サービス プログラム (MOSP) のサブスクリプションに対して構成できます。 詳しくは、[Azure の請求書の表示とダウンロード](../understand/download-azure-invoice){linktype="relative-path"}に関する記事をご覧ください。

詳細については、「[コスト アラートを使用した使用量と支出の監視](cost-mgt-alerts-monitor-usage-spending){linktype="relative-path"}」を参照してください。

## コストを最適化する {#optimize-costs}

Microsoft は、コストを最適化するためのさまざまなツールを提供しています。 これらのツールの一部は、Cost Management と Billing のエクスペリエンスの外部で使用できますが、完全のために含まれています。

- Azure には多くの[**無料サービス**](https://azure.microsoft.com/pricing/free-services/){linktype="external"}があります。 必ず制約に細心の注意を払ってください。 無料期間は、サービスにより無期限、12 か月、または 30 日です。 一部は特定の使用量まで無料であり、一部は無料ではない他のサービスに依存している場合があります。
- 既存のリソースの最適化に関心がある場合は、[**Azure Advisor のコストに関する推奨事項**](tutorial-acm-opt-recommendations){linktype="relative-path"}が最初に役立つはずです。 Advisor の推奨事項は毎日更新され、お客様の使用パターンに基づいています。 Advisor は、サブスクリプションとリソース グループで使用できます。 管理グループのユーザーは推奨事項を表示することもできますが、必要なサブスクリプションを選択する必要があります。 Billing のユーザーは、アクセス権を持つリソースがあるサブスクリプションに関する推奨事項のみを表示できます。
- [**Azure 節約プラン**](../savings-plan/){linktype="relative-path"}では、Azure コンピューティング リソースの一貫した使用がある場合にコストを節約できます。 この節約プランにより、リソースを大幅に削減でき、従量課金制の料金を最大 65% 削減できます。
- **[Azure の予約](https://azure.microsoft.com/reservations/){linktype="external"}**は、一定の期間について特定の使用量を事前にコミットすることで、従量課金制料金と比較して最大 72% の節約に役立ちます。
- [**Azure ハイブリッド特典**](https://azure.microsoft.com/pricing/hybrid-benefit/){linktype="external"}は、オンプレミスの Windows Server と SQL Server のライセンス、または Azure 上の RedHat と SUSE Linux のサブスクリプションを使用して、コストを大幅に削減するのに役立ちます。

## 次のステップ {#next-steps}

その他のオプションについては、「[Azure の特典とインセンティブ](https://azure.microsoft.com/pricing/offers/#cloud){linktype="external"}」をご覧ください。
::::

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
:::::::::::::::::::::::::

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

- [ Last updated on 2025-07-02 ]{.badge .badge-sm .text-wrap-pretty}
:::
:::::::::::::::::::::::::::::::

::: {#action-panel .action-panel role="region" aria-label="アクション パネル" tabindex="-1"}
:::
:::::::::::::::::::::::::::::::::::
