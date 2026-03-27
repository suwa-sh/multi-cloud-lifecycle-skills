# 正規化ルール

## 目的
ベンダー固有のガイダンスをベンダー中立の canonical model に変換する方法を定義する。

## 原則
1. **ベンダー中立性**: canonical model はベンダー固有のサービス名や機能を参照してはならない
2. **capability 指向**: 要件は実装ではなく capability として表現する
3. **構成可能性**: 各 canonical 要素は独立して参照できること
4. **追跡可能性**: 全 canonical 要素はソース参照にリンクすること

## プロセス
1. ベンダーソースから capability または関心事を特定する
2. ベンダー固有の用語を抽象化する
3. 測定可能な属性を持つ capability 要件として表現する
4. 安定した canonical 識別子を付与する
5. 追跡可能性のためソース参照を記録する

## 命名規約
- 全識別子に lowercase snake_case を使用する
- スコープ接頭辞を付ける: `foundation.`, `shared_platform.`, `product.`
- ベンダー製品名ではなく capability 名を使用する

## 例
```text
ベンダー固有: "AWS Organizations with SCPs"
Canonical: organization_boundary.policy_enforcement
```

## 競合解決
ベンダー間でガイダンスが競合する場合:
1. 競合を `decision_record` に記録する
2. デフォルトでは最も制限的な解釈を選択する
3. `deviation_record` による明示的な逸脱を許容する
4. 根拠とリスク評価を記録する
