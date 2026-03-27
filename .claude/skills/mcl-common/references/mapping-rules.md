# ベンダーマッピングルール

## 目的
canonical model の要素を AWS / Azure / GCP のベンダー固有実装にマッピングする方法を定義する。

## 原則
1. **完全カバレッジ**: 全 canonical 要素は対象クラウドごとにマッピングを持つこと
2. **明示的ギャップ**: クラウドに直接的な対応がない場合、ワークアラウンド付きのギャップとして記録する
3. **fidelity 追跡**: 各マッピングの適合度（exact / partial / workaround / gap）を評価する
4. **バージョン意識**: 使用するベンダーサービスのバージョンまたは API バージョンを記録する

## fidelity レベル
- **exact**: ベンダーサービスが canonical 要件を直接的に満たす
- **partial**: ベンダーサービスが大部分をカバーするが全てではない。不足部分を記述する
- **workaround**: 直接的な対応がない。必要なサービスの組み合わせを記述する
- **gap**: 実現可能なマッピングが存在しない。deviation として記録する

## マッピング構造
各マッピングエントリは以下を含む:
- `canonical_ref`: canonical model 要素への参照
- `vendor`: aws | azure | gcp
- `service`: ベンダーサービス名
- `configuration_notes`: 主要な設定上の考慮事項
- `fidelity`: exact | partial | workaround | gap
- `gap_description`: （fidelity が exact 以外の場合）
- `source_refs`: ベンダードキュメントの参照

## 検証ルール
- 全 canonical 要素が各ベンダーのマッピングに含まれていること
- fidelity が明示的に記述されていること
- gap には対応する deviation record があること
- configuration_notes はベンダーのベストプラクティスを参照すること
