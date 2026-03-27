---
source_url: "https://cloud.google.com/architecture/framework?hl=ja"
fetched_at: "2026-03-27T23:08:56Z"
vendor: "gcp"
layer: "product"
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

# Google Cloud Well-Architected Framework [ コレクションでコンテンツを整理 ]{slot="popout-heading"} [ 必要に応じて、コンテンツの保存と分類を行います。 ]{slot="popout-contents"} {#google-cloud-well-architected-framework-コレクションでコンテンツを整理-必要に応じてコンテンツの保存と分類を行います .devsite-page-title tabindex="-1"}

:::: {.devsite-article-body .clearfix}
::: last-reviewed
Last reviewed 2026-01-28 UTC
:::

Well-Architected Framework のすべてのコンテンツを 1 ページに表示する場合や、コンテンツの PDF 出力を取得する場合は、[1 ページに表示する](https://docs.cloud.google.com/architecture/framework/printable?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="solution"}をご覧ください。

Well-Architected Framework は、アーキテクト、デベロッパー、管理者、その他のクラウドの実務担当者が、安全で効率的、復元性が高く、高パフォーマンスで費用対効果に優れ、持続可能なクラウド トポロジを設計および運用するための最適化案を提供します。

Google の複数の部門にまたがるエキスパートのチームが、Well-Architected Framework の推奨事項を検証します。チームが Well-Architected Framework をキュレートし、 Google Cloudの拡張機能、業界のベスト プラクティス、コミュニティの知識、ユーザーからのフィードバックを反映させます。Well-Architected Framework の主な変更の概要については、[新機能](https://docs.cloud.google.com/architecture/framework/whats-new?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="solution"}をご覧ください。

Well-Architected Framework は、クラウド用に構築されたアプリケーションと、オンプレミスから Google Cloudに移行されたワークロード、ハイブリッド クラウドのデプロイ、マルチクラウド環境に関連しています。

## Well-Architected Framework の柱と視点 {#pillars_and_perspectives data-text="Well-Architected Framework の柱と視点" tabindex="-1"}

次の図に示すように、Well-Architected Framework の推奨事項は柱と柱間の視点に分類されています。

![Well-Architected Framework。](https://docs.cloud.google.com/static/architecture/framework/images/af-infographic.svg?hl=ja){modal-dialog-id="af-infographic"} ![Well-Architected Framework。](https://docs.cloud.google.com/static/architecture/framework/images/af-infographic.svg?hl=ja)

- Well-Architected Framework の[柱]{#pillar}は、セキュリティ、信頼性、パフォーマンス、費用、運用、サステナビリティなど、特定の非機能領域に関する原則と推奨事項を提供します。

- Well-Architected Framework の[視点]{#perspective}は、特定のテクノロジー、ドメイン、セクターに関する推奨事項の柱を横断したビューです。視点の推奨事項は、柱の基本原則と推奨事項に沿っています。

  たとえば、金融サービス（FS）の視点では、データ所在地に関する規制要件を満たす障害復旧戦略が推奨されています。この FS 固有の推奨事項は、データ所在地要件がフェイルオーバー リージョンの選択に影響し、結果として復旧目標に影響するため、信頼性に関する柱の現実的な目標の原則に沿ったものです。

### 柱 {#pillars data-text="柱" tabindex="-1"}

[construction]{.material-icons aria-hidden="true" style="font-size: 24px" translate="no"} [オペレーショナル エクセレンス](https://docs.cloud.google.com/architecture/framework/operational-excellence?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="solution"}
:   クラウド ワークロードを効率的にデプロイ、運用、モニタリング、管理します。

[security]{.material-icons aria-hidden="true" style="font-size: 24px" translate="no"} [セキュリティ、プライバシー、コンプライアンス](https://docs.cloud.google.com/architecture/framework/security?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="solution"}
:   クラウド内のデータとワークロードのセキュリティを最大化し、プライバシーを考慮した設計を行い、規制要件と標準に対応します。

[restore]{.material-icons aria-hidden="true" style="font-size: 24px" translate="no"} [信頼性](https://docs.cloud.google.com/architecture/framework/reliability?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="solution"}
:   クラウドで復元性と高可用性を備えたワークロードを設計し、運用します。

[payment]{.material-icons aria-hidden="true" style="font-size: 24px" translate="no"} [費用の最適化](https://docs.cloud.google.com/architecture/framework/cost-optimization?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="solution"}
:   Google Cloudへの投資のビジネス価値を最大化します。

[speed]{.material-icons aria-hidden="true" style="font-size: 24px" translate="no"} [パフォーマンスの最適化](https://docs.cloud.google.com/architecture/framework/performance-optimization?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="solution"}
:   パフォーマンスが最適化されるようにクラウド リソースを設計、調整します。

[eco]{.material-symbols-outlined style="font-size:24px;color:green;vertical-align:text-bottom"} [Sustainability](https://docs.cloud.google.com/architecture/framework/sustainability?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="solution"}
:   環境的に持続可能なクラウド ワークロードを構築して管理します。

### 柱の枠を超えた視点 {#cross-pillar_perspectives data-text="柱の枠を超えた視点" tabindex="-1"}

[saved_search]{.material-icons aria-hidden="true" style="font-size: 24px" translate="no"} [AI と ML](https://docs.cloud.google.com/architecture/framework/perspectives/ai-ml?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="solution"}
:   AI ワークロードと ML ワークロードに関するテクノロジー固有の推奨事項の柱を横断したビュー。

[saved_search]{.material-icons aria-hidden="true" style="font-size: 24px" translate="no"} [金融サービス](https://docs.cloud.google.com/architecture/framework/perspectives/fsi?hl=ja){track-metadata-position="body" track-name="internalLink" track-type="solution"}
:   FS ワークロードに関する推奨事項の柱を横断したビュー。

## 基本原則 {#core_principles data-text="基本原則" tabindex="-1"}

Well-Architected Framework の各柱の推奨事項を確認する前に、次の基本原則を確認してください。

### 変化に対応する設計 {#design_for_change data-text="変化に対応する設計" tabindex="-1"}

静的なシステムはありません。ユーザーのニーズ、システムを構築するチームの目標、システム自体は常に変化しています。変更の必要性を念頭に置いて、チームが定期的に小規模な変更を配布し、その変更について迅速にフィードバックを取得できるように、開発プロセスと本番環境プロセスを構築します。変更をデプロイする能力を常に示すことは、システムを担当するチームやシステムのユーザーなどのステークホルダーと信頼関係を築くうえで役立ちます。[DORA のソフトウェア デリバリーの指標](https://dora.dev/guides/dora-metrics-four-keys/){track-metadata-position="body" track-name="externalLink"}を使用すると、システムの変更の速度、容易さ、安全性をモニタリングできます。

### アーキテクチャの文書化 {#document_your_architecture data-text="アーキテクチャの文書化" tabindex="-1"}

ワークロードのクラウドへの移行やアプリケーションの構築を開始する際に、システムに関するドキュメントが不足していることが大きな障害となる場合があります。現在のデプロイのアーキテクチャを正しく可視化するには、ドキュメントが特に重要です。

質の高いドキュメントは、ドキュメントの量ではなく、システムの変更に応じて明確で有用な内容を維持することで実現できます。

クラウド アーキテクチャを適切に文書化することで、共通の言語と標準が確立され、部門横断的なチーム間でのコミュニケーションとコラボレーションを効果的に行いやすくなります。また、将来的な設計上の意思決定を促し、指針にするために必要な情報も提供します。設計上の意思決定に対応する内容を提供するため、ユースケースを念頭に置いてドキュメントを作成する必要があります。

時間の経過とともに、設計上の意思決定は進化、変化していきます。変更履歴があれば、チームが構想を調整し、重複を避け、時間の経過に沿ったパフォーマンスの変化を効果的に測定するために必要な背景情報が得られます。現在の設計、戦略、過去の経緯をよく理解していない新しいクラウド アーキテクトをオンボーディングする場合、変更ログは特に役立ちます。

[DORA による分析](https://dora.dev/capabilities/documentation-quality/){track-metadata-position="body" track-name="externalLink"}で、ドキュメントの品質と組織のパフォーマンス（組織のパフォーマンス目標と収益性目標を達成する能力）の間に明確な関連性があることが判明しました。

### 設計を簡素化し、フルマネージド サービスを利用する {#simplify_your_design_and_use_fully_managed_services data-text="設計を簡素化し、フルマネージド サービスを利用する" tabindex="-1"}

設計にはシンプルさが重要です。アーキテクチャが複雑すぎて理解しにくい場合、設計を実装して時間の経過とともに管理することが難しくなります。可能であれば、フルマネージド サービスを使用して、ベースライン システムの管理とメンテナンスに伴うリスク、時間、労力を最小限に抑えてください。

本番環境ですでにワークロードを実行している場合は、マネージド サービスでテストして、運用の複雑さがどのように軽減されるかをご確認ください。新しいワークロードを開発している場合は、単純なものから最小実装製品（MVP）を確立して、オーバー エンジニアリングへの抵抗感を和らげてください。特殊なユースケースを特定し、イテレーションを行い、時間をかけて段階的にシステムを改善していくことができます。

### アーキテクチャを分離する {#decouple_your_architecture data-text="アーキテクチャを分離する" tabindex="-1"}

[DORA の調査](https://dora.dev/capabilities/loosely-coupled-teams/){track-metadata-position="body" track-name="externalLink"}によると、アーキテクチャは継続的デリバリーを達成するための重要な予測要素です。分離とは、アプリケーションやサービス コンポーネントを、独立して動作できる小さなコンポーネントに分離するために使用される手法です。たとえば、モノリシック アプリケーション スタックを個別のサービス コンポーネントに分離できます。疎結合アーキテクチャでは、さまざまな依存関係に関係なく、アプリケーションで機能を個別に実行できます。

アーキテクチャを分離することで、柔軟性が向上し、次のことが可能になります。

- 独立したアップグレードを適用する。
- 特定のセキュリティ管理を実施する。
- サブシステムごとに信頼性の目標を設定する。
- 正常性をモニタリングする。
- パフォーマンスとコストのパラメータをきめ細かく制御する。

分離プロセスは、設計の早い段階から始めることも、規模の拡大に伴うシステム アップグレードの一部として行うこともできます。

### ステートレス アーキテクチャを使用する {#use_a_stateless_architecture data-text="ステートレス アーキテクチャを使用する" tabindex="-1"}

ステートレス アーキテクチャでは、アプリケーションの信頼性とスケーラビリティの両方を向上させることができます。

ステートフル アプリケーションは、ローカル キャッシュのデータなど、さまざまな依存関係を使用してタスクを実行します。ステートフル アプリケーションでは、多くの場合、進捗状況をキャプチャして正常に再起動するための追加のメカニズムが必要です。ステートレス アプリケーションは、共有ストレージやキャッシュ サービスを使用することで、ローカルの依存関係をさほど利用することなくタスクを実行できます。ステートレス アーキテクチャを使用すると、ブート依存関係を最小限に抑え、アプリケーションを迅速にスケールアップできます。アプリケーションは強制的な再起動に耐え、ダウンタイムを短縮し、エンドユーザーのパフォーマンスを高めることができます。
::::

フィードバックを送信

::: devsite-floating-action-buttons
:::

特に記載のない限り、このページのコンテンツは[クリエイティブ・コモンズの表示 4.0 ライセンス](https://creativecommons.org/licenses/by/4.0/)により使用許諾されます。コードサンプルは [Apache 2.0 ライセンス](https://www.apache.org/licenses/LICENSE-2.0)により使用許諾されます。詳しくは、[Google Developers サイトのポリシー](https://developers.google.com/site-policies?hl=ja)をご覧ください。Java は Oracle および関連会社の登録商標です。

最終更新日 2026-01-28 UTC。

::: devsite-content-data
ご意見をお聞かせください

\[\[\[\"わかりやすい\",\"easyToUnderstand\",\"thumb-up\"\],\[\"問題の解決に役立った\",\"solvedMyProblem\",\"thumb-up\"\],\[\"その他\",\"otherUp\",\"thumb-up\"\]\],\[\[\"わかりにくい\",\"hardToUnderstand\",\"thumb-down\"\],\[\"情報またはサンプルコードが不正確\",\"incorrectInformationOrSampleCode\",\"thumb-down\"\],\[\"必要な情報 / サンプルがない\",\"missingTheInformationSamplesINeed\",\"thumb-down\"\],\[\"翻訳に関する問題\",\"translationIssue\",\"thumb-down\"\],\[\"その他\",\"otherDown\",\"thumb-down\"\]\],\[\"最終更新日 2026-01-28 UTC。\"\],\[\],\[\]\]
:::
::::::::::
