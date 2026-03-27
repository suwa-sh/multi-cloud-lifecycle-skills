---
source_url: "https://cloud.google.com/sql/docs/postgres/concepts?hl=ja"
fetched_at: "2026-03-27T23:08:56Z"
vendor: "gcp"
layer: "product"
---

::::::::::: {#main-content .devsite-main-content role="main" has-book-nav="" has-sidebar=""}
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

  [Databases](https://docs.cloud.google.com/docs/databases?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="3" track-type="globalNav" track-name="breadcrumb" track-metadata-position="3" track-metadata-eventdetail="Databases"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [Cloud SQL](https://docs.cloud.google.com/sql/docs?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="4" track-type="globalNav" track-name="breadcrumb" track-metadata-position="4" track-metadata-eventdetail="Cloud SQL"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [PostgreSQL](https://docs.cloud.google.com/sql/docs/postgres?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="5" track-type="globalNav" track-name="breadcrumb" track-metadata-position="5" track-metadata-eventdetail="Cloud SQL for PostgreSQL"}

- ::: {.devsite-breadcrumb-guillemet .material-icons aria-hidden="true"}
  :::

  [ガイド](https://docs.cloud.google.com/sql/docs/postgres/features?hl=ja){.devsite-breadcrumb-link .gc-analytics-event category="Site-Wide Custom Events" data-label="Breadcrumbs" data-value="6" track-type="globalNav" track-name="breadcrumb" track-metadata-position="6" track-metadata-eventdetail=""}
:::

フィードバックを送信

# Cloud SQL の概要 [ コレクションでコンテンツを整理 ]{slot="popout-heading"} [ 必要に応じて、コンテンツの保存と分類を行います。 ]{slot="popout-contents"} {#cloud-sql-の概要-コレクションでコンテンツを整理-必要に応じてコンテンツの保存と分類を行います .devsite-page-title tabindex="-1"}

::::: {.devsite-article-body .clearfix}
:::: {.nocontent style="font-size:medium; margin-bottom:40px; border-top:1px solid black;"}
::: {style="float:right"}
[MySQL](https://docs.cloud.google.com/sql/docs/mysql/introduction?hl=ja "MySQL データベース エンジンに関するこのページを見る"){track-name="mysqlLink" track-type="sqlSwitcher"} [  \|  ]{style="color:light-gray"}[PostgreSQL]{style="font-weight:bold"} [  \|  ]{style="color:light-gray"}[SQL Server](https://docs.cloud.google.com/sql/docs/sqlserver/introduction?hl=ja "SQL Server データベース エンジンに関するこのページを見る"){track-name="sqlServerLink" track-type="sqlSwitcher"}
:::
::::

Cloud SQL は、MySQL、PostgreSQL、SQL Server 用のフルマネージド リレーショナル データベース サービスです。これにより、データベース管理タスクから解放され、データの管理により多くの時間をかけることができます。

このページでは、 Google Cloudの SQL データ ストレージを提供する Cloud SQL の基本コンセプトと用語について説明します。主なコンセプトの詳細については、[主な用語](https://docs.cloud.google.com/sql/docs/key-terms?hl=ja)と[機能](https://docs.cloud.google.com/sql/docs/features?hl=ja)のページをご覧ください。Cloud SQL データベースの比較については、[データベース エンジンによる Cloud SQL の機能サポート](https://docs.cloud.google.com/sql/docs/feature_support?hl=ja)をご覧ください。

## Cloud SQL のユースケース {#use-cases-for-cloud-sql data-text="Cloud SQL のユースケース" tabindex="-1"}

Cloud SQL は、ローカル MySQL、PostgreSQL、SQL Server データベースの代替となるクラウドベースのサービスです。Cloud SQL を使用することで、データベースの管理にかかる時間を減らし、データベースを使用する時間を増やすことができます。

Compute Engine、App Engine、 Google Cloud の他のサービスで実行されている多くのアプリケーションでは、データベース ストレージに Cloud SQL を使用します。

## Cloud SQL が提供するもの {#what-cloud-sql-provides data-text="Cloud SQL が提供するもの" tabindex="-1"}

Cloud SQL には多数のサービスが用意されているため、そうしたサービスを自分で構築して管理する必要はありません。ユーザーはデータそのものに集中し、次のようなオペレーションを Cloud SQL に任せることができます。

- [バックアップ](https://docs.cloud.google.com/sql/docs/postgres/backup-recovery/backups?hl=ja)
- [高可用性とフェイルオーバー](https://docs.cloud.google.com/sql/docs/postgres/high-availability?hl=ja)
- [データ暗号化](https://docs.cloud.google.com/sql/docs/postgres/faq?hl=ja#encryption)
- [ネットワーク接続](https://docs.cloud.google.com/sql/docs/postgres/connect-overview?hl=ja)
- [ストレージ](https://docs.cloud.google.com/sql/docs/mysql/faq?hl=ja#data-storage,-replication,-and-authentication)
- [エクスポートとインポート](https://docs.cloud.google.com/sql/docs/postgres/import-export?hl=ja)
- [レプリケーション](https://docs.cloud.google.com/sql/docs/postgres/replication?hl=ja)
- [メンテナンスと更新](https://docs.cloud.google.com/sql/docs/postgres/maintenance?hl=ja)
- [モニタリング](https://docs.cloud.google.com/sql/docs/postgres/monitor-instance?hl=ja)
- [ロギング](https://docs.cloud.google.com/sql/docs/postgres/logging?hl=ja)

## Cloud SQL インスタンスとは {#what-is-cloud-sql-instance data-text="Cloud SQL インスタンスとは" tabindex="-1"}

各 Cloud SQL インスタンスは、ホスト Google Cloud サーバー上で実行されている仮想マシン（VM）を利用します。各 VM は、MySQL サーバー、PostgreSQL、SQL Server などのデータベース プログラムと、ロギングやモニタリングなどのサポート サービスを提供するサービス エージェントを運用します。また、高可用性オプションでは、別のゾーンにプライマリ VM と同一の構成を持つスタンバイ VM も用意されています。

データベースは、スケーラビリティと耐久性に優れたネットワーク ストレージ デバイスに保存されます。このデバイスは `persistent disk`{dir="ltr" translate="no"} と呼ばれ、VM にアタッチされます。静的 IP アドレスは各 VM に割り当てられ、アプリケーションの接続先の IP アドレスが Cloud SQL インスタンスの全存続期間を通して持続するようにします。

Cloud SQL インスタンスの概要:

![](https://docs.cloud.google.com/static/sql/images/intro2.png?hl=ja){alt-text="Shows a
Cloud SQL instance, where the VM contains a database, logging, monitoring, and
other services. An application connects to the VM using static IP. The instance
connects to persistent disk for storage. The instance connects to an HA standby." height="67%" width="67%"}

## データベース管理 {#database_administration data-text="データベース管理" tabindex="-1"}

Cloud SQL を使ってデータベースとデータベース ユーザーを作成、削除することもできますが、Cloud SQL はデータベース管理ツールではありません。データベース エンジンに応じて、次のようなさまざまなデータベース管理ツールを選択できます。

- MySQL 向けの [phpMyAdmin](https://www.phpmyadmin.net/)
- MySQL 向けの [MySQL Workbench](https://www.mysql.com/products/workbench/)
- MySQL と PostgreSQL 向けの [Toad Edge](https://www.quest.com/products/toad-edge/)
- PostgreSQL 向けの [pgAdmin.org](https://www.pgadmin.org/)
- SQL Server 向けの [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15)
- SQL Server 向けの [Visual Studio Code](https://code.visualstudio.com/)

## Cloud SQL の料金 {#cloud-sql-pricing data-text="Cloud SQL の料金" tabindex="-1"}

Cloud SQL の料金は構成の設定や以下の要素によって異なります。

- プロビジョニングしたストレージの量（GiB/月）
- Cloud SQL インスタンスに選択する CPU の数
- Cloud SQL インスタンスに選択したメモリ量
- データのホストとして選択した場所
- インスタンスから出るネットワーク トラフィックの量
- 割り当てて使用する IP アドレスの数

詳細については、[料金](https://cloud.google.com/sql/pricing?hl=ja)ページまたは[料金計算ツール](https://cloud.google.com/products/calculator?hl=ja)をご覧ください。

アカウントを作成して、実際のシナリオでの Cloud SQL のパフォーマンスを評価してください。新規のお客様には、Cloud SQL でワークロードを実行、テスト、デプロイできる無料クレジット \$300 分を差し上げます。アップグレードするまで料金は発生しません。

[こちらから登録](https://console.cloud.google.com/freetrial?redirectPath=%2Fsql&hl=ja){track-metadata-end-goal="signUp" track-metadata-position="cloud_sql_freetrial" track-name="consoleLink" track-type="freeTrial"}して Cloud SQL をお試しください。

## Cloud SQL マネージド データベースに接続する {#connect-to-cloud-sql-managed-database data-text="Cloud SQL マネージド データベースに接続する" tabindex="-1"}

Cloud SQL マネージド データベースへの接続は、セルフマネージド データベースに接続する場合と同様です。Cloud SQL インスタンスは、構成方法に応じて、パブリック IP アドレス（Google Cloud外部からインターネット経由でアクセス可能）またはプライベート IP アドレス（[Virtual Private Cloud（VPC）ネットワーク](https://docs.cloud.google.com/vpc/docs/overview?hl=ja)経由でのみアクセス可能）を使用します。さらに、Cloud SQL には [Cloud SQL Auth Proxy](https://docs.cloud.google.com/sql/docs/postgres/sql-proxy?hl=ja) をはじめ、インスタンスに接続できるユーザーを制御するためのさまざまな認可オプションが用意されています。

Cloud SQL インスタンスに接続して、認証と認可を行う方法については、[接続の概要](https://docs.cloud.google.com/sql/docs/postgres/connect-overview?hl=ja)ページをご覧ください。

## Cloud SQL の更新 {#cloud-sql-updates data-text="Cloud SQL の更新" tabindex="-1"}

Cloud SQL インスタンスの利用期間中は、次の 2 種類の更新が発生する可能性があります。

- **構成の更新**。ユーザーが行った更新。
- Cloud SQL で実行される**システム更新**。

### 構成の更新 {#configuration_updates data-text="構成の更新" tabindex="-1"}

データベースの使用量が増加し、新しいワークロードが追加されるのに応じ、ユーザー側でデータベースの構成を更新できます。構成の更新には、次のようなものがあります。

- コンピューティング リソースの増加
- データベース フラグの変更
- 高可用性の有効化

こうした更新は、Cloud SQL を使用すれば[ボタン](https://docs.cloud.google.com/sql/docs/postgres/edit-instance?hl=ja)をクリックするだけで可能ですが、構成を更新するとなるとダウンタイムが必要な場合があります。ただし、Cloud SQL には、ダウンタイムを最小限に抑えてデータベースを引き続き使用できるようにするオプションがいくつか用意されています。

### システムの更新 {#system_updates data-text="システムの更新" tabindex="-1"}

データベース インスタンスの稼働状態を維持するには、構成の更新以外にも運用上の多くの作業が求められます。サーバーやディスクの交換およびアップグレードが必要ですし、新しい脆弱性が発見された場合には、オペレーティング システムにパッチを適用しなければなりません。データベース ソフトウェア プロバイダが新機能をリリースし、新しい問題を修正するたびに、データベース プログラムをアップグレードする必要も生じます。データベース管理者は通常、システムの信頼性と安全性を保ち、最新の状態に保つために、これらの更新を定期的に実行します。Cloud SQL は、こうした定期的なシステム更新に対応するため、データベースの管理に費やす時間を削減し、優れたアプリケーションを開発するための時間を確保できます。

Cloud SQL がシステム更新を実行するプロセスは、更新されるシステムの部分によって異なります。一般に、Cloud SQL のシステム更新は、ハードウェアの更新、オンラインの更新、メンテナンスの 3 つのカテゴリに分類されます。

**ハードウェア更新**では、欠陥のあるマシンホストの交換や古いディスクの交換など、物理インフラストラクチャの改善が行われます。Google Cloud により、アプリケーションを中断することなくハードウェアが更新されます。たとえば、データベース サーバーを更新する場合、 Google Cloudではライブ マイグレーションを使用します。これは、VM を実行中のまま、元のホストから新しいホストに確実に移行する高度なテクノロジーです。

**オンラインの更新**により、VM のデータベース プログラムに隣接するサポート サービス エージェントのソフトウェアが強化されます。この更新は、データベースが稼働してトラフィックを処理している間に実行されます。オンラインの更新によってアプリケーションのダウンタイムが発生することはありません。

[**メンテナンス**](https://docs.cloud.google.com/sql/docs/postgres/maintenance?hl=ja)により、オペレーティング システムとデータベース プログラムがアップグレードされます。これらの更新ではインスタンスの再起動が必要になるため、ダウンタイムが発生します。このため、Cloud SQL では、アプリケーションへの影響を最小限に抑えながら、メンテナンスのスケジュールを設定できるようになっています。[Cloud SQL Enterprise Plus エディション](https://docs.cloud.google.com/sql/docs/postgres/editions-intro?hl=ja#availability-enhancements)を使用している場合は、ダウンタイムを [1 秒未満のダウンタイム](https://docs.cloud.google.com/sql/docs/postgres/maintenance?hl=ja#nearzero)に制限できます。

## 次のステップ {#whats_next data-text="次のステップ" tabindex="-1"}

以下のクイックスタートをお試しください。

- [MySQL](https://docs.cloud.google.com/sql/docs/mysql/connect-instance-cloud-shell?hl=ja)
- [PostgreSQL](https://docs.cloud.google.com/sql/docs/postgres/connect-instance-cloud-shell?hl=ja)
- [SQL Server](https://docs.cloud.google.com/sql/docs/sqlserver/connect-instance-cloud-shell?hl=ja)
:::::

フィードバックを送信

::: devsite-floating-action-buttons
:::

特に記載のない限り、このページのコンテンツは[クリエイティブ・コモンズの表示 4.0 ライセンス](https://creativecommons.org/licenses/by/4.0/)により使用許諾されます。コードサンプルは [Apache 2.0 ライセンス](https://www.apache.org/licenses/LICENSE-2.0)により使用許諾されます。詳しくは、[Google Developers サイトのポリシー](https://developers.google.com/site-policies?hl=ja)をご覧ください。Java は Oracle および関連会社の登録商標です。

最終更新日 2026-01-23 UTC。

::: devsite-content-data
ご意見をお聞かせください

\[\[\[\"わかりやすい\",\"easyToUnderstand\",\"thumb-up\"\],\[\"問題の解決に役立った\",\"solvedMyProblem\",\"thumb-up\"\],\[\"その他\",\"otherUp\",\"thumb-up\"\]\],\[\[\"わかりにくい\",\"hardToUnderstand\",\"thumb-down\"\],\[\"情報またはサンプルコードが不正確\",\"incorrectInformationOrSampleCode\",\"thumb-down\"\],\[\"必要な情報 / サンプルがない\",\"missingTheInformationSamplesINeed\",\"thumb-down\"\],\[\"翻訳に関する問題\",\"translationIssue\",\"thumb-down\"\],\[\"その他\",\"otherDown\",\"thumb-down\"\]\],\[\"最終更新日 2026-01-23 UTC。\"\],\[\],\[\]\]
:::
:::::::::::
