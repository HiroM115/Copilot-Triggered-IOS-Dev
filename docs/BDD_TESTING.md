# Quick/Nimbleを使ったBDD (振る舞い駆動開発)

## 概要

このプロジェクトでは**Quick**と**Nimble**を使用して、BDD (Behavior-Driven Development) スタイルのテストを実装しています。

### Quick とは？

Quickは、SwiftとObjective-C向けのBDDフレームワークです。RSpecやJasmineなどのBDDフレームワークからインスパイアされており、テストを人間が読みやすい形式で記述できます。

### Nimble とは？

Nimbleは、Quickと組み合わせて使用される表現力豊かなマッチャーライブラリです。テストの期待値を自然な英語に近い形で記述できます。

## インストール

Package.swiftに以下の依存関係が追加されています：

```swift
dependencies: [
    .package(url: "https://github.com/Quick/Quick.git", from: "7.6.2"),
    .package(url: "https://github.com/Quick/Nimble.git", from: "13.6.0"),
]
```

## Specの基本構造

BDDテストは「Spec」として記述します。以下の要素で構成されます：

### `describe`
テスト対象の機能や振る舞いを説明します。ネストして使用することもできます。

```swift
describe("メール検証機能") {
    // テストケースをここに記述
}
```

### `context`
特定の状況や前提条件を定義します。

```swift
context("メールアドレスが有効な場合") {
    // この条件下でのテストケース
}

context("メールアドレスが無効な場合") {
    // この条件下でのテストケース
}
```

### `it`
期待される具体的な振る舞いを記述します。

```swift
it("標準的なメールアドレスに対してtrueを返す") {
    // アサーション
}
```

### `beforeEach` / `afterEach`
各テストの前後に実行される共通のセットアップとクリーンアップ処理です。

```swift
beforeEach {
    // 各テスト前に実行
}

afterEach {
    // 各テスト後に実行
}
```

## 実際の例

`Tests/AIDrivenIOSAppTests/AIDrivenUtilitiesSpec.swift` から抜粋：

```swift
import Quick
import Nimble
@testable import AIDrivenIOSApp

final class AIDrivenUtilitiesSpec: QuickSpec {
    override class func spec() {
        describe("AIDrivenUtilities") {
            
            describe("email validation") {
                context("when email is valid") {
                    it("returns true for standard email") {
                        expect(AIDrivenUtilities.isValidEmail("user@example.com")).to(beTrue())
                    }
                    
                    it("returns true for email with plus sign") {
                        expect(AIDrivenUtilities.isValidEmail("user+tag@example.com")).to(beTrue())
                    }
                }
                
                context("when email is invalid") {
                    it("returns false for email without @") {
                        expect(AIDrivenUtilities.isValidEmail("userexample.com")).to(beFalse())
                    }
                    
                    it("returns false for empty string") {
                        expect(AIDrivenUtilities.isValidEmail("")).to(beFalse())
                    }
                }
            }
        }
    }
}
```

## Nimble マッチャー

Nimbleには多数の便利なマッチャーがあります：

### 基本的なマッチャー

```swift
// 等価性
expect(value).to(equal(expectedValue))
expect(value).toNot(equal(wrongValue))

// ブール値
expect(condition).to(beTrue())
expect(condition).to(beFalse())

// nil チェック
expect(value).to(beNil())
expect(value).toNot(beNil())

// 空チェック
expect(array).to(beEmpty())
expect(string).toNot(beEmpty())
```

### コレクション用マッチャー

```swift
// 要素の包含
expect([1, 2, 3]).to(contain(2))
expect(["a", "b", "c"]).to(contain("a", "c"))

// 要素数
expect(array.count).to(equal(5))
```

### 文字列用マッチャー

```swift
// 部分一致
expect("Hello World").to(contain("World"))

// 前方一致
expect("Hello").to(beginWith("He"))

// 後方一致
expect("Hello").to(endWith("lo"))

// 正規表現
expect(uuid).to(match("^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$"))
```

### 数値用マッチャー

```swift
// 大小比較
expect(value).to(beGreaterThan(10))
expect(value).to(beLessThan(100))
expect(value).to(beGreaterThanOrEqualTo(0))
expect(value).to(beLessThanOrEqualTo(100))

// 範囲チェック
expect(value).to(beCloseTo(expected, within: 0.1))
```

### エラー処理

```swift
// エラーのスロー確認
expect { try somethingThatThrows() }.to(throwError())
expect { try somethingThatThrows() }.to(throwError(MyError.specific))
```

## テストの実行

### すべてのテストを実行

```bash
swift test
```

### 特定のSpecを実行

```bash
swift test --filter AIDrivenUtilitiesSpec
```

### カバレッジ付きで実行

```bash
swift test --enable-code-coverage
```

### Xcodeで実行

1. Xcodeでプロジェクトを開く: `open Package.swift`
2. `⌘ + U` でテストを実行
3. Test Navigatorで個別のテストを実行可能

## BDDのベストプラクティス

### 1. 意味のある記述子を使用

❌ 悪い例：
```swift
it("test1") {
    expect(result).to(beTrue())
}
```

✅ 良い例：
```swift
it("有効なメールアドレスの場合、trueを返す") {
    expect(AIDrivenUtilities.isValidEmail("user@example.com")).to(beTrue())
}
```

### 2. contextで前提条件を明確に

```swift
context("ユーザーがログインしている場合") {
    // ログイン済みの状態でのテスト
}

context("ユーザーが未ログインの場合") {
    // 未ログインの状態でのテスト
}
```

### 3. beforeEachで共通のセットアップ

```swift
describe("日付フォーマット") {
    var testDate: Date!
    
    beforeEach {
        var components = DateComponents()
        components.year = 2024
        components.month = 1
        components.day = 15
        testDate = Calendar.current.date(from: components)
    }
    
    it("長形式でフォーマットする") {
        let formatted = AIDrivenUtilities.formatDate(testDate)
        expect(formatted).to(contain("2024"))
    }
}
```

### 4. 1つの it に1つのアサーション（推奨）

1つの `it` ブロックでは、できるだけ1つの振る舞いに焦点を当てます。

```swift
// 複数のアサーションが必要な場合は分ける
it("正しい長さのUUIDを生成する") {
    let uuid = AIDrivenUtilities.generateUUID()
    expect(uuid.count).to(equal(36))
}

it("有効なUUID形式で生成する") {
    let uuid = AIDrivenUtilities.generateUUID()
    expect(uuid).to(match("^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$"))
}
```

## 参考リンク

- [Quick公式ドキュメント](https://github.com/Quick/Quick)
- [Nimble公式ドキュメント](https://github.com/Quick/Nimble)
- [Quick Examples](https://github.com/Quick/Quick/tree/main/Documentation)

## まとめ

Quick/Nimbleを使用することで：
- ✅ テストコードが読みやすくなる
- ✅ 仕様として機能するドキュメントになる
- ✅ チーム全体で理解しやすいテストが書ける
- ✅ BDDのプラクティスを自然に実践できる

このプロジェクトでは、すべてのユーティリティ関数に対してBDDスタイルのテストを記述し、振る舞い駆動開発を実践しています。
