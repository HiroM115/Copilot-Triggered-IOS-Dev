# クイックスタートガイド 🚀

GitHub Copilot Pro を使って iPhone/iPad アプリ開発を始めるための簡単なガイドです。

## 1. 環境準備

### 必要なもの
- ✅ Mac (macOS 13.0 以上)
- ✅ Xcode 15.0 以上
- ✅ GitHub Copilot Pro サブスクリプション
- ✅ GitHub Copilot for Xcode 拡張機能

### Copilot for Xcode のインストール

1. **Xcode Copilot 拡張機能をインストール:**
   - [GitHub Copilot for Xcode](https://github.com/github/copilot-for-xcode) からダウンロード
   - または `brew install github-copilot-for-xcode`

2. **拡張機能を有効化:**
   ```
   Xcode > Settings > Extensions > GitHub Copilot にチェック
   ```

3. **GitHub アカウントで認証:**
   - Copilot アイコンをクリック
   - 指示に従ってサインイン

## 2. プロジェクトを開く

```bash
# リポジトリをクローン
git clone https://github.com/HiroM115/Copilot-Triggered-IOS-Dev.git
cd Copilot-Triggered-IOS-Dev

# Xcode で開く
open AIDrivenIOSApp.xcodeproj
# または
open Package.swift
```

## 3. Copilot を使った開発の例

### 例1: 新しいビューを作成

1. 新しい Swift ファイルを作成 (`File > New > File > Swift File`)
2. ファイル名を `UserProfileView.swift` とする
3. コメントを書く:

```swift
import SwiftUI

// Create a user profile view with:
// - Circular profile image at the top
// - User name and email below
// - Bio section
// - Edit profile button at the bottom
```

4. `Tab` キーを押して Copilot の提案を受け入れる

### 例2: API クライアントを実装

```swift
import Foundation

// Create an API client for fetching user data
// Base URL: https://api.example.com
// Endpoints: 
// - GET /users/:id
// - POST /users
// - PUT /users/:id
// Use async/await and handle errors
```

Copilot が完全な実装を提案してくれます！

### 例3: バリデーション関数

```swift
// Validate Japanese postal code format
// Format: 123-4567 (3 digits, hyphen, 4 digits)
// Returns true if valid
func validateJapanesePostalCode(_ code: String) -> Bool {
    // Copilot が実装を提案
}
```

## 4. Copilot の使い方のコツ

### ✅ DO (良い使い方)

```swift
// ✅ 具体的で詳細なコメント
// Create a custom button with:
// - Gradient background (blue to purple)
// - White text
// - Corner radius of 12
// - Shadow effect
// - Haptic feedback on tap
struct CustomButton: View {
```

```swift
// ✅ 型情報を明示
struct User: Codable {
    let id: UUID
    let name: String
    let email: String
    let createdAt: Date
}

// この情報があると Copilot はより正確な提案をします
```

### ❌ DON'T (避けるべき使い方)

```swift
// ❌ 曖昧すぎるコメント
// make a view
struct MyView: View {
```

```swift
// ❌ コンテキスト不足
func process() {
    // 何を処理するのか不明確
}
```

## 5. よく使うショートカット

| ショートカット | 機能 |
|--------------|------|
| `Tab` | 提案を受け入れる |
| `Esc` | 提案を拒否 |
| `Option + ]` | 次の提案 |
| `Option + [` | 前の提案 |
| `Option + \` | 全ての提案を表示 |

## 6. サンプル演習

### 演習1: ログイン画面を作成

```swift
// Exercise: Create a login screen with:
// - App logo at the top
// - Email text field
// - Password secure field
// - Remember me toggle
// - Login button
// - Sign up link at the bottom
// - Input validation
// - Keyboard handling
struct LoginView: View {
    // Copilot に実装を提案させる
}
```

### 演習2: データモデルとViewModel

```swift
// Exercise: Create a TodoItem model and TodoViewModel
// TodoItem should have:
// - id (UUID)
// - title (String)
// - completed (Bool)
// - createdAt (Date)
//
// TodoViewModel should:
// - Use @Published for items array
// - Implement add, delete, toggle methods
// - Support filtering (all, completed, active)
// - Persist to UserDefaults
```

### 演習3: ネットワークレイヤー

```swift
// Exercise: Create a generic network service
// Requirements:
// - Support GET, POST, PUT, DELETE
// - Use URLSession
// - Async/await
// - Error handling
// - Request/Response logging
// - Generic Codable support
protocol NetworkService {
    // Copilot に提案させる
}
```

## 7. トラブルシューティング

### Copilot が提案しない場合

1. **Copilot が有効か確認:**
   - Xcode メニューバーの Copilot アイコンを確認
   - 緑色 = 有効、灰色 = 無効

2. **インターネット接続を確認:**
   - Copilot にはインターネット接続が必要

3. **より詳しいコメントを書く:**
   - コンテキストを追加
   - 期待する動作を明確に記述

4. **Xcode を再起動:**
   - 時々、再起動で問題が解決します

### 提案が正しくない場合

1. `Esc` で提案を拒否
2. コメントを修正して再試行
3. 手動で数行書いてパターンを示す

## 8. 次のステップ

完成したら以下をお試しください:

1. **カスタムコンポーネントの作成:**
   - カード、ボタン、入力フィールドなど

2. **API 統合:**
   - 実際の API と接続
   - データの取得と表示

3. **状態管理:**
   - Combine フレームワーク
   - ObservableObject パターン

4. **アニメーション:**
   - SwiftUI のトランジション
   - カスタムアニメーション

5. **テスト:**
   - ユニットテスト
   - UI テスト

## 9. リソース

- 📖 [COPILOT_GUIDE.md](./COPILOT_GUIDE.md) - 詳細なガイド
- 📖 [BUILD_NOTES.md](./BUILD_NOTES.md) - ビルド情報
- 📖 [README.md](./README.md) - プロジェクト概要
- 🔗 [GitHub Copilot Docs](https://docs.github.com/en/copilot)
- 🔗 [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)

## 10. ヘルプとサポート

問題が発生した場合:

1. [Issues](https://github.com/HiroM115/Copilot-Triggered-IOS-Dev/issues) で検索
2. 新しい Issue を作成
3. コミュニティに質問

---

**Happy Coding with GitHub Copilot Pro!** 🎉

AIの力を活用して、より速く、より良いiOSアプリを作りましょう！
