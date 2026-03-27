---
source_url: "https://learn.microsoft.com/ja-jp/azure/azure-monitor/logs/data-platform-logs"
fetched_at: "2026-03-27T21:22:26Z"
vendor: "azure"
layer: "foundation"
---

::::::::::::::::::::::::::::::::::::::::::: {#main .layout-body-main role="main" bi-name="content" lang="ja-jp" dir="ltr"}
:::: {#ms--content-header .content-header .default-focus .border-bottom-none bi-name="content-header"}
::: {.content-header-controls .margin-xxs .margin-inline-sm-tablet}
[[]{.docon .docon-menu}]{.icon aria-hidden="true"} [ 目次 ]{.contents-expand-title}

[[]{.docon .docon-exit-mode}]{.icon aria-hidden="true"} エディター モードを終了する
:::
::::

::::::::::::::::::::::::::::::::::::::: {.padding-sm .padding-top-none .padding-top-sm-tablet main-column=""}
::::::::::::::::::::::::::::::::: {}
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
# Azure Monitor ログの概要 {#azure-monitor-logs-overview}
:::

:::: {#article-metadata .page-metadata-container .display-flex .gap-xxs .justify-content-space-between .align-items-center .flex-wrap-wrap bi-name="article-metadata" test-id="article-metadata"}
::: {#user-feedback .margin-block-xxs .display-none .display-none-print hidden="" hide-on-archived=""}
[ []{.docon .docon-like} ]{.icon aria-hidden="true"} フィードバック
:::
::::

## この記事の内容 {#ms--in-this-article .title .is-6 .margin-block-xs}

:::::::::::: content
Azure Monitor ログは、Azure および Azure 以外のリソースとアプリケーションによって生成されたテレメトリ データを収集、分析、操作するための一元化されたサービスとしてのソフトウェア (SaaS) プラットフォームです。

主要な Azure Monitor ログ リソースである、1 つの [Log Analytics ワークスペース](#log-analytics-workspace){linktype="self-bookmark"}で、ログの収集、ログ データとコストの管理、さまざまな種類のデータの使用を行うことができます。 つまり、データを移動したり、他のストレージを管理したりする必要がなく、さまざまなデータ型を必要な期間だけ、または必要な分だけ保持できます。

この記事では、Azure Monitor ログのしくみの概要を示し、組織内のさまざまな担当者のニーズとスキルに Azure Monitor ログがどのように対処するかについて説明します。

::: NOTE
注意

Azure Monitor ログは、Azure Monitor をサポートするデータ プラットフォームの片方です。 もう一方は、時系列データベースに数値データを格納する [Azure Monitor メトリック](../essentials/data-platform-metrics){linktype="relative-path"}です。
:::

## Azure Monitor ログのしくみ {#how-azure-monitor-logs-works}

Azure Monitor ログには、次のツールが用意されています。

- Azure Monitor データ収集メソッドを使用して**任意のデータを収集します**。 コストの最適化、個人データの削除などのニーズに基づいてデータを変換し、Log Analytics ワークスペース内のテーブルにデータをルーティングします。
- テーブル スキーマ、テーブル プラン、データ保持、データ集計、誰がどのデータにアクセスできるか、ログ関連のコストなど、Log Analytics ワークスペースとログ テーブルを構成することで、**ログ データとコストを管理および最適化します**。
- Kusto 照会言語 (KQL)、または KQL の知識を必要としない KQL ベースのツールと機能 (Log Analytics ユーザー インターフェイスのシンプル モード、Insights という事前構築済みのキュレーションされた監視エクスペリエンス、定義済みのクエリなど) を使用して、**ほぼリアル タイムでデータを取得します**。
- データ分析、トラブルシューティング、アラート、ダッシュボードとレポート、カスタム アプリケーション、その他の Azure サービスや Azure 以外のサービスなど、さまざまなユース ケースに合わせて**データを柔軟に使用します**。

[ [![ログ データの収集、管理、取得、操作のためのエンドツーエンド ソリューションを Azure Monitor と Azure Monitor Logs がどのように実現するかを示すダイアグラム。](media/data-platform-logs/azure-monitor-logs-overview.png){linktype="relative-path"}](media/data-platform-logs/azure-monitor-logs-overview.png#lightbox){linktype="relative-path"} ]{.mx-imgBorder}

## データ収集、ルーティング、変換 {#data-collection-routing-and-transformation}

Azure Monitor のデータ収集機能を使用すると、Azure、他のクラウド、オンプレミスで実行されているすべてのアプリケーションとリソースからデータを収集できます。 強力なインジェスト パイプラインにより、データのフィルター処理、変換、Log Analytics ワークスペース内の宛先テーブルへのルーティングが可能になり、コスト、分析機能、クエリ パフォーマンスが最適化されます。

[ [![データ ソースから収集され、変換されて Log Analytics ワークスペース内のテーブルに送信されるデータを示すダイアグラム。](media/data-platform-logs/azure-monitor-logs-collection-ingestion.png){linktype="relative-path"}](media/data-platform-logs/azure-monitor-logs-collection-ingestion.png#lightbox){linktype="relative-path"} ]{.mx-imgBorder}

データ収集と変換の詳細については、「[Azure Monitor データ ソースとデータ収集方法](../data-sources){linktype="relative-path"}」と「[Azure Monitor でのデータ収集の変換](../essentials/data-collection-transformations){linktype="relative-path"}」を参照してください。

## Log Analytics ワークスペース {#log-analytics-workspace}

[Log Analytics ワークスペース](log-analytics-workspace-overview){linktype="relative-path"}は、データを収集するテーブルを保持するデータ ストアです。

Log Analytics ワークスペースを使用するさまざまなユーザーのデータ ストレージと消費のニーズに対処するには、次の方法があります。

- データ消費量とコスト管理のニーズに基づいて、[テーブル プランを定義](#table-plans){linktype="self-bookmark"}します。
- 各テーブル[の低コストの長期リテンション期間と分析リテンション期間を管理](data-retention-configure){linktype="relative-path"}します。
- ワークスペースと特定のテーブルへの[アクセスを管理](manage-access){linktype="relative-path"}します。
- [要約ルールを使用してデータを集計](summary-rules){linktype="relative-path"}し、要約されたテーブルを作成します。 これにより、時間の経過とともに収集されたデータを最適化して、アクションにつながる分析情報を取得し、継続的な分析、ダッシュボード、ビジネス レポートで使用することができます。
- 特定のユーザーに合わせて、すぐに実行できる[保存済みクエリ](save-query){linktype="relative-path"}、[視覚化](../best-practices-analysis#built-in-visualization-tools){linktype="relative-path"}、[アラート](../alerts/alerts-create-log-alert-rule){linktype="relative-path"}を作成します。

[ [![Azure portal の Log Analytics ワークスペースのスクリーンショット。](media/data-platform-logs/log-analytics-workspace-for-all-log-data.png){linktype="relative-path"}](media/data-platform-logs/log-analytics-workspace-for-all-log-data.png#lightbox){linktype="relative-path"} ]{.mx-imgBorder}

また、ネットワーク分離を構成し、リージョン間でワークスペースをレプリケートし、[ビジネス ニーズに基づいてワークスペース アーキテクチャを設計](workspace-design){linktype="relative-path"}することもできます。

## テーブル プラン {#table-plans}

1 つの Log Analytics ワークスペースを使用して、あらゆる目的に必要な任意の種類のログを格納できます。 次に例を示します。

- **監査とコンプライアンスのために低コストの長期ストレージ**を必要とする大量の詳細データ
- 開発者による**トラブルシューティング**のためのアプリとリソース データ
- 継続的な**オペレーショナル エクセレンスとセキュリティ**を確保するためのスケーリングとアラートの主要なイベントとパフォーマンスのデータ
- **高度分析と機械学習**のための集計された長期的なデータ傾向

テーブル プランを使用すると、テーブル内のデータを使用する頻度と、データが必要な分析の種類に基づいてデータ コストを管理できます。

このビデオでは、Azure Monitor ログでテーブル プランによって多層ログを有効にする方法について概要を説明しています。

::::::: embeddedvideo
:::::: iframe
::: {#player}
:::

:::: player-unavailable
# エラーが発生しました。 {#エラーが発生しました .message}

::: submessage
JavaScript を実行できませんでした。
:::
::::
::::::
:::::::

以下の図と表は、分析、基本、補助テーブル プランを比較しています。 対話型と長期保有の詳細については、「[Log Analytics ワークスペースでのデータ保持の管理](data-retention-configure){linktype="relative-path"}」を参照してください。 テーブル プランを選択または変更する方法については、[テーブル プランの選択](logs-table-plans){linktype="relative-path"}に関するページを参照してください。

[ [![分析、基本、補助テーブル プランによって提供される機能の概要を示す図。](media/data-platform-logs/azure-monitor-logs-data-plans.png){linktype="relative-path"}](media/data-platform-logs/azure-monitor-logs-data-plans.png#lightbox){linktype="relative-path"} ]{.mx-imgBorder}

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  機能                                                                                Analytics                                                                            Basic                                                                                                                                                                                                                                         補助
  ----------------------------------------------------------------------------------- ------------------------------------------------------------------------------------ --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  最適な用途                                                                          継続的な監視、リアルタイムの検出、パフォーマンス分析に使用される価値の高いデータ。   トラブルシューティングとインシデント応答に必要なミディアムタッチのデータ。                                                                                                                                                                    詳細ログなどのロータッチ データと、監査とコンプライアンスに必要なデータ。

  サポートされている[テーブルの種類](manage-logs-tables){linktype="relative-path"}    すべてのテーブルの種類                                                               [基本ログをサポートする Azure テーブル](basic-logs-azure-tables){linktype="relative-path"}および DCR ベースのカスタム テーブル                                                                                                                DCR ベースのカスタム テーブル

  取り込みコスト                                                                      Standard                                                                             減少                                                                                                                                                                                                                                          最小限

  クエリ価格が含まれる                                                                ✅                                                                                   ❌                                                                                                                                                                                                                                            ❌

  最適化されたクエリ パフォーマンス                                                   ✅                                                                                   ✅                                                                                                                                                                                                                                            ❌ 低速なクエリ。\
                                                                                                                                                                                                                                                                                                                                                                                                                         監査に適しています。 リアルタイム分析用に最適化されていません。

  クエリ機能                                                                          [完全なクエリ機能](get-started-queries){linktype="relative-path"}。                  [単一テーブル上の完全な Kusto 照会言語 (KQL)](basic-logs-query){linktype="relative-path"}。[lookup](/ja-jp/azure/data-explorer/kusto/query/lookup-operator){linktype="absolute-path"} を使用して Analytics テーブルのデータで拡張できます。   [単一テーブル上の完全な KQL](basic-logs-query){linktype="relative-path"}。[lookup](/ja-jp/azure/data-explorer/kusto/query/lookup-operator){linktype="absolute-path"} を使用して、Analytics テーブルのデータで拡張できます。

  [警告](../alerts/alerts-overview){linktype="relative-path"}                         ✅                                                                                   ✅ (単純なログ アラート)                                                                                                                                                                                                                      ❌

  [分析情報](../insights/insights-overview){linktype="relative-path"}                 ✅                                                                                   ❌                                                                                                                                                                                                                                            ❌

  [ダッシュボード](../visualize/best-practices-visualize){linktype="relative-path"}   ✅                                                                                   ✅ ダッシュボードの更新にかかるクエリあたりのコストは含まれません。^1^                                                                                                                                                                        可能ですが、更新に時間がかかります。ダッシュボードの更新にかかるクエリあたりのコストは含まれません。^1^

  [データのエクスポート](logs-data-export){linktype="relative-path"}                  ✅                                                                                   ✅                                                                                                                                                                                                                                            ❌

  [Microsoft Sentinel](/ja-jp/azure/sentinel/overview){linktype="absolute-path"}      ✅                                                                                   ✅                                                                                                                                                                                                                                            ✅

  [検索ジョブ](search-jobs){linktype="relative-path"}                                 ✅                                                                                   ✅                                                                                                                                                                                                                                            ✅

  [集計ルール](summary-rules){linktype="relative-path"}                               ✅                                                                                   ✅ KQL は単一のテーブルに制限されます                                                                                                                                                                                                         ✅ KQL は単一のテーブルに制限されます

  [復元](restore){linktype="relative-path"}                                           ✅                                                                                   ✅                                                                                                                                                                                                                                            ❌

  分析データ保持                                                                      30 日 (Microsoft Sentinel および Application Insights の場合は 90 日)。\             適用外                                                                                                                                                                                                                                        適用外
                                                                                      日割り計算された月単位の長期保有料金で、最大 2 年間まで延長できます。                                                                                                                                                                                                                                                              

  合計保有期間                                                                        最大 12 年                                                                           最大 12 年                                                                                                                                                                                                                                    最大 12 年
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

^1^ 基本テーブル プランと補助テーブル プランは現在、Workbooks と Grafana をサポートしています。一方で、Azure Monitor ダッシュボードはサポートされていません。

::: NOTE
注意

基本および補助テーブル プランは、[従来の価格レベル](cost-logs#legacy-pricing-tiers){linktype="relative-path"}のワークスペースでは使用できません。
:::

::: NOTE
注意

現在、補助テーブル プランでは、次の機能はサポートされていません。

- [Log Analytics ワークスペースのレプリケーション](workspace-replication){linktype="relative-path"}。Azure Monitor では、補助プランを使用してテーブル内のデータをセカンダリ ワークスペースにレプリケートしません。 そのため、当該データは、リージョンでの障害が発生した場合のデータ損失から保護されず、セカンダリ ワークスペースに切り替えても使用できません。
- [Microsoft Azure のカスタマー ロックボックス](/ja-jp/azure/security/fundamentals/customer-lockbox-overview){linktype="absolute-path"}。Lockbox インターフェイスを使用すると、顧客が開始したサポート チケットまたは Microsoft によって特定された問題に応答して、顧客データ アクセス要求を確認および承認または拒否できます。これは、補助プランのテーブルには適用されません。
:::

## Kusto 照会言語 (KQL) と Log Analytics {#kusto-query-language-kql-and-log-analytics}

Log Analytics ワークスペースからデータを取得するには、[Kusto 照会言語 (KQL)](/ja-jp/azure/data-explorer/kusto/query/){linktype="absolute-path"} クエリを使用します。これは、データを処理して結果を返す読み取り専用の要求です。 KQL は、数百万のレコードをすばやく分析できる強力なツールです。 KQL を使用して、ログの調査、データの変換と集計、パターンの検出、異常値や外れ値の特定などを行います。

Log Analytics は、ログ クエリを実行し、その結果を分析するための Azure portal のツールです。 [Log Analytics 簡易モード](log-analytics-simple-mode){linktype="relative-path"}では、KQL の知識に関係なく、すべてのユーザーが 1 回のクリックで 1 つ以上のテーブルからデータを取得できます。 一連のコントロールを使用すると、よく使われる Azure Monitor ログ機能を直感的でスプレッドシートのようなエクスペリエンスで使用して、取得したデータについて確認および分析できます。

[ [![Log Analytics の簡易モードを示すスクリーンショット。](media/log-analytics-explorer/log-analytics-simple-mode-user-interface.png){linktype="relative-path"}](media/log-analytics-explorer/log-analytics-simple-mode-user-interface.png#lightbox){linktype="relative-path"} ]{.mx-imgBorder}

KQL に精通している場合は、Log Analytics KQL モードを使用してクエリを編集および作成し、アラートやブックなどの Azure Monitor 機能で使用したり、他のユーザーと共有したりできます。

Log Analytics の詳細については、「[Azure Monitor の Log Analytics の概要](log-analytics-overview){linktype="relative-path"}」を参照してください。

## 組み込みのインサイトとカスタム ダッシュボード、ワークブック、レポート {#built-in-insights-and-custom-dashboards-workbooks-and-reports}

Azure Monitor の[すぐに使用できるキュレーションされた Insights エクスペリエンス](../insights/insights-overview){linktype="relative-path"}の多くは、データを Azure Monitor ログに格納し、このデータを直感的な方法で表示するため、クラウドおよびハイブリッド アプリケーションとそれらのサポート コンポーネントのパフォーマンスと可用性を監視できます。

[ [![Azure Monitor に組み込まれたコンテナーの分析情報の監視エクスペリエンスを示すスクリーンショット。](../containers/media/kubernetes-monitoring-overview/containers-insights-experience.png){linktype="relative-path"}](../containers/media/kubernetes-monitoring-overview/containers-insights-experience.png#lightbox){linktype="relative-path"} ]{.mx-imgBorder}

ブック、ダッシュボード、Power BI を使用して[、独自の視覚化とレポートを作成](../best-practices-analysis#built-in-visualization-tools){linktype="relative-path"}します。

::: TIP
ヒント

大規模なデータ セットや長い時間範囲に対して複雑なクエリを実行するのではなく、[要約ルール](summary-rules){linktype="relative-path"}を使用して、カスタム ダッシュボード、ブック、レポート用にデータを集計します。 データが Log Analytics ワークスペースに到着すると、要約ルールによって 1 つ以上のテーブルのデータが集計されます。 1 つ以上のテーブルの生データに対してクエリを実行するのではなく、要約されたデータのカスタム テーブルから直接集計データを視覚化すると、クエリのパフォーマンスが向上し、クエリ エラーとタイムアウトが減ります。
:::

## 利用事例 {#use-cases}

この表は、Azure Monitor ログで収集したデータを使用して運用面とビジネス面の価値を引き出す方法をいくつか説明したものです。

+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 能力                                           | 説明                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
+:===============================================+:=======================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| 分析                                           | Azure portal で [Log Analytics](log-analytics-tutorial){linktype="relative-path"} を使用して[ログ クエリ](log-query-overview){linktype="relative-path"}を書き込み、強力な分析エンジンを使用してログ データを対話形式で分析します。                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 集計                                           | [集計ルール](summary-rules){linktype="relative-path"}を使用して、取り込んだ生のログ データからアラートと分析に必要な情報を集計します。 これにより、コスト、分析機能、クエリのパフォーマンスを最適化できます。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 異常を検出して分析する                         | [組み込みまたはカスタムの異常検出アルゴリズムを使用](kql-machine-learning-azure-monitor){linktype="relative-path"}して、ログ データの異常なパターンや動作を特定します。 これは、潜在的な問題を早期に検出するのに役立ちます。                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| アラート                                       | [ログ検索アラート ルール](../alerts/alerts-log){linktype="relative-path"}または[ログのメトリック アラート](../alerts/alerts-metric-logs){linktype="relative-path"}を構成して、特定の条件が発生したときに通知を送信したり、[自動アクション](../alerts/action-groups){linktype="relative-path"}を実行したりできます。                                                                                                                                                                                                                                                                                                                                                                                    |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 視覚化                                         | テーブルまたはグラフとして表示されるクエリ結果を [Azure ダッシュボード](/ja-jp/azure/azure-portal/azure-portal-dashboards){linktype="absolute-path"}にピン留めします。\                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|                                                | [ワークブック](../visualize/workbooks-overview){linktype="relative-path"}を作成して、対話型レポートで複数のデータセットを結合します。\                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|                                                | クエリの結果を [Power BI](log-powerbi){linktype="relative-path"} にエクスポートし、さまざまな視覚化を使用して Azure の外部のユーザーと共有します。\                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|                                                | クエリの結果を [Grafana](../visualize/visualize-grafana-overview){linktype="relative-path"} にエクスポートし、そのダッシュボード機能を活用して、他のデータ ソースと結合します。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 分析情報の取得                                 | [Insights](../insights/insights-overview){linktype="relative-path"} は、特定のリソースやサービスを監視するためのカスタマイズされたエクスペリエンスを提供します。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 取得する                                       | アクセスログクエリ結果は次のものからです。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|                                                | - [Azure CLI](/ja-jp/cli/azure/monitor/log-analytics){linktype="absolute-path"} または [Azure PowerShell コマンドレット](/ja-jp/powershell/module/az.operationalinsights){linktype="absolute-path"}を使用するコマンド ライン。                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|                                                | - [REST API](/ja-jp/rest/api/loganalytics/){linktype="absolute-path"}、または [.NET](/ja-jp/dotnet/api/overview/azure/Monitor.Query-readme){linktype="absolute-path"}、[Go](https://pkg.go.dev/github.com/Azure/azure-sdk-for-go/sdk/monitor/query/azlogs#section-readme){linktype="external"}、[Java](/ja-jp/java/api/overview/azure/monitor-query-readme){linktype="absolute-path"}、[JavaScript](/ja-jp/javascript/api/overview/azure/monitor-query-readme){linktype="absolute-path"}、または [Python](/ja-jp/python/api/overview/azure/monitor-query-readme){linktype="absolute-path"} 用クライアント ライブラリを使用するカスタム アプリ。                                                        |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| インポート                                     | [REST API](/ja-jp/azure/azure-monitor/logs/logs-ingestion-api-overview){linktype="absolute-path"} か、[.NET](/ja-jp/dotnet/api/overview/azure/Monitor.Ingestion-readme){linktype="absolute-path"}、[Go](https://pkg.go.dev/github.com/Azure/azure-sdk-for-go/sdk/monitor/ingestion/azlogs){linktype="external"}、[Java](/ja-jp/java/api/overview/azure/monitor-ingestion-readme){linktype="absolute-path"}、[JavaScript](/ja-jp/javascript/api/overview/azure/monitor-ingestion-readme){linktype="absolute-path"}、または [Python](/ja-jp/python/api/overview/azure/monitor-ingestion-readme){linktype="absolute-path"} のクライアント ライブラリを介してカスタム アプリからログをアップロードします。 |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 輸出                                           | Azure Storage アカウントまたは Azure Event Hubs への[ログ データの自動エクスポート](logs-data-export){linktype="relative-path"}を構成します。\                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|                                                | [Azure Logic Apps](/ja-jp/azure/connectors/connectors-azure-monitor-logs){linktype="absolute-path"} を使用し、ログ データを取得して外部の場所にコピーするワークフローを構築します。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 独自の解析を持ち込む                           | [ノートブックを使用して Azure Monitor ログのデータを分析し](notebooks-azure-monitor-logs){linktype="relative-path"}、Azure Monitor ログで収集したデータの上に合理化されたマルチステップ プロセスを作成します。 これは、[機械学習パイプラインの構築と実行](../aiops/aiops-machine-learning#create-your-own-machine-learning-pipeline-on-data-in-azure-monitor-logs){linktype="relative-path"}、高度な分析、サポート ニーズに対応したトラブルシューティング ガイド (TSG) などの目的に特に役立ちます。                                                                                                                                                                                                    |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 監査とコンプライアンスのためにデータを保持する | [Auxiliary プランを使用してデータをテーブルに直接送信](create-custom-table-auxiliary){linktype="relative-path"}し、[任意のテーブルのデータ保持期間を延長](data-retention-configure){linktype="relative-path"}して、監査とコンプライアンス用にデータを最長 12 年間保存します。 低コストの Auxiliary テーブル プランとワークスペース内での長期保有により、コストを削減し、必要なときにデータを迅速かつ簡単に使用できます。                                                                                                                                                                                                                                                                               |
+------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

## Microsoft Sentinel と Microsoft Defender for Cloud の操作 {#working-with-microsoft-sentinel-and-microsoft-defender-for-cloud}

Azure の[セキュリティ監視](/ja-jp/azure/sentinel/overview){linktype="absolute-path"}は [Microsoft Sentinel](/ja-jp/azure/defender-for-cloud/defender-for-cloud-introduction){linktype="absolute-path"} と [Microsoft Defender for Cloud](../best-practices-plan#security-monitoring-solutions){linktype="relative-path"} によって実行されます。

これらのサービスによってデータは Azure Monitor ログに保存されるので、Azure Monitor によって収集された他のログ データと共に分析することができます。

### 詳細情報 {#learn-more}

+-----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| サービス                          | 詳細                                                                                                                                                                                     |
+:==================================+:=========================================================================================================================================================================================+
| Microsoft Sentinel                | - [Microsoft Sentinel データの保存場所](/ja-jp/azure/sentinel/geographical-availability-data-residency#where-microsoft-sentinel-data-is-stored){linktype="absolute-path"}                |
|                                   | - [Log Analytics ワークスペース アーキテクチャを設計する](workspace-design){linktype="relative-path"}                                                                                    |
|                                   | - [Microsoft Sentinel のサンプル ワークスペースの設計](/ja-jp/azure/sentinel/sample-workspace-designs){linktype="absolute-path"}                                                         |
|                                   | - [Microsoft Sentinel で複数のワークスペースとテナントを準備する](/ja-jp/azure/sentinel/prepare-multiple-workspaces){linktype="absolute-path"}                                           |
|                                   | - [Log Analytics ワークスペースで Microsoft Sentinel を有効にする](/ja-jp/azure/sentinel/quickstart-onboard){linktype="absolute-path"}。                                                 |
|                                   | - [Microsoft Sentinel でのログ管理](/ja-jp/azure/sentinel/log-plans){linktype="absolute-path"}                                                                                           |
|                                   | - [Microsoft Azure Sentinel の価格](https://azure.microsoft.com/pricing/details/microsoft-sentinel/){linktype="external"}                                                                |
|                                   | - [Microsoft Sentinel を含むワークスペースの料金](cost-logs#workspaces-with-microsoft-sentinel){linktype="relative-path"}                                                                |
+-----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Microsoft Defender for Cloud      | - [Microsoft Defender for Cloud データを継続的にエクスポートする](/ja-jp/azure/defender-for-cloud/continuous-export){linktype="absolute-path"}                                           |
|                                   | - [データの使用](/ja-jp/azure/defender-for-cloud/data-security#data-consumption){linktype="absolute-path"}                                                                               |
|                                   | - [Microsoft Defender for Cloud で使われる Log Analytics ワークスペースについてよく寄せられる質問](/ja-jp/azure/defender-for-cloud/faq-data-collection-agents){linktype="absolute-path"} |
|                                   | - [Microsoft Defender for Cloud の価格](https://azure.microsoft.com/pricing/details/defender-for-cloud/){linktype="external"}                                                            |
|                                   | - [Microsoft Defender for Cloud を含むワークスペースの料金](cost-logs#workspaces-with-microsoft-defender-for-cloud){linktype="relative-path"}                                            |
+-----------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

## 関連コンテンツ {#related-content}

- Log Analytics ワークスペースからデータを取得して分析する[ログ クエリ](log-query-overview){linktype="relative-path"}について説明します。
- [Azure Monitor でのメトリック](../essentials/data-platform-metrics){linktype="relative-path"}を確認します。
- Azure のさまざまなリソースで[入手できる監視データ](../data-sources){linktype="relative-path"}を確認します。
::::::::::::

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
:::::::::::::::::::::::::::::::::

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

- [ Last updated on 2025-04-01 ]{.badge .badge-sm .text-wrap-pretty}
:::
:::::::::::::::::::::::::::::::::::::::

::: {#action-panel .action-panel role="region" aria-label="アクション パネル" tabindex="-1"}
:::
:::::::::::::::::::::::::::::::::::::::::::
