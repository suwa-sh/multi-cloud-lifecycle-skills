# Implementation Pack スキーマ

## 目的
vendor mapping から生成される implementation artifact の構造を定義する。

## Implementation Pack の内容
特定スコープ（foundation / shared-platform / product）の implementation pack は以下を含む:

1. **implementation_spec YAML**: vendor mapping から導出された詳細な実装仕様
2. **IaC スケルトン**: 対象クラウドごとの Infrastructure as Code テンプレート
3. **conformance_report YAML**: canonical 要件に対する検証結果
4. **target_architecture Markdown**: 可読性の高いアーキテクチャドキュメント

## Implementation Spec の構造
```yaml
schema_version: "1.0"
artifact_type: "implementation_spec"
scope: "foundation | shared_platform | product"
vendor: "aws | azure | gcp"
components:
  - name: "コンポーネント名"
    canonical_ref: "canonical 要素への参照"
    vendor_service: "サービス名"
    configuration:
      # ベンダー固有の設定
    dependencies: []
    validation_rules: []
```

## IaC スケルトンのガイドライン
- 静的検証（dry-run Tier B）に合格するスケルトンファイルを生成する
- ベンダー推奨の IaC ツールを使用する（Terraform、CloudFormation、Bicep、Deployment Manager）
- プレースホルダー値には `# TODO:` コメントを明確に付与する
- モジュール/スタック構成は canonical model の境界に合わせる

## Conformance Report の構造
- 各 canonical 要件を一覧化する
- 対応する implementation コンポーネントを示す
- 適合ステータスを報告する: conformant / partial / non_conformant / deferred
- エビデンス参照を含める
