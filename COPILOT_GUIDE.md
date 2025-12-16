# GitHub Copilot Pro 使用ガイド（iOS 開発向け）

## はじめに

このガイドでは、GitHub Copilot Pro を iOS 開発で効果的に活用する方法を説明します。

## セットアップ

### 1. GitHub Copilot のインストール

1. Xcode の拡張機能として GitHub Copilot をインストール
2. GitHub アカウントで認証
3. Copilot Pro サブスクリプションが有効であることを確認

### 2. Xcode での設定

```
Xcode > Preferences > Extensions > GitHub Copilot
```

チェックボックスをオンにして拡張機能を有効化

## 効果的な使用方法

### コメント駆動開発

**良い例:**
```swift
// Create a function that validates Japanese phone numbers
// Format: 090-1234-5678 or 03-1234-5678
// Returns true if valid, false otherwise
func validateJapanesePhoneNumber(_ phoneNumber: String) -> Bool {
    // Copilot will generate the implementation
}
```

**改善が必要な例:**
```swift
// validate phone
func validate() {
    // Too vague - Copilot needs more context
}
```

### SwiftUI ビュー生成

```swift
// Create a modern card view for displaying user profiles
// Include: profile image (circle), name, bio, and follow button
// Use SF Symbols for icons
// Apply gradient background
struct UserProfileCard: View {
    // Copilot will suggest the complete view structure
}
```

### API クライアントの実装

```swift
// API client for fetching weather data
// Base URL: https://api.weather.com
// Supports async/await
// Includes error handling
class WeatherAPIClient {
    // Copilot will suggest methods and properties
}
```

### テストケースの生成

```swift
// Test suite for UserViewModel
// Test cases:
// 1. User login with valid credentials
// 2. User login with invalid credentials
// 3. User logout
// 4. Fetch user profile
class UserViewModelTests: XCTestCase {
    // Copilot will generate test methods
}
```

## ショートカット

- **提案を受け入れる**: `Tab`
- **次の提案を表示**: `Option + ]`
- **前の提案を表示**: `Option + [`
- **提案を拒否**: `Esc`
- **複数の提案を表示**: `Option + \`

## ベストプラクティス

### 1. 明確な型定義

```swift
struct User {
    let id: UUID
    let name: String
    let email: String
    let createdAt: Date
}

// Copilot は型情報を使って適切なコードを提案
```

### 2. 一貫した命名規則

```swift
// Good - Copilot can understand the pattern
func fetchUserProfile() async throws -> User
func fetchUserPosts() async throws -> [Post]
func fetchUserFollowers() async throws -> [User]
```

### 3. プロトコルとエクステンション

```swift
protocol NetworkService {
    func fetch<T: Codable>(_ endpoint: String) async throws -> T
}

// Copilot will suggest conforming implementations
```

### 4. ドキュメンテーション

```swift
/// Manages user authentication and session
/// 
/// This service handles:
/// - User login/logout
/// - Token management
/// - Session persistence
class AuthenticationService {
    // Copilot uses documentation for better suggestions
}
```

## iOS 特有のパターン

### Combine フレームワーク

```swift
import Combine

// Create a publisher that emits search results as user types
// Debounce: 0.3 seconds
// Remove duplicates
// Switch to latest search
class SearchViewModel: ObservableObject {
    // Copilot will suggest Combine pipeline
}
```

### Core Data

```swift
// Core Data manager for offline data persistence
// Entity: TodoItem
// Properties: id, title, completed, createdAt
// Includes CRUD operations
class CoreDataManager {
    // Copilot will suggest Core Data stack setup
}
```

### SwiftUI Animations

```swift
// Create a smooth card flip animation
// Duration: 0.6 seconds
// Use 3D rotation effect
// Include haptic feedback
struct FlipCard: View {
    // Copilot will suggest animation code
}
```

## トラブルシューティング

### Copilot が提案しない場合

1. **コンテキストを追加**: より詳細なコメントを書く
2. **型を明示**: 変数や引数の型を明確にする
3. **命名を改善**: より説明的な名前を使用
4. **インポートを確認**: 必要なフレームワークがインポートされているか確認

### 提案が不適切な場合

1. **Tab を押さずに無視**
2. **コメントを修正**して再試行
3. **手動で数行記述**してパターンを示す

## 高度なテクニック

### コード変換

```swift
// Convert this UIKit code to SwiftUI
// Original: UITableView with custom cells
// Target: SwiftUI List with custom rows

// Copilot can help with migration
```

### パフォーマンス最適化

```swift
// Optimize this image loading function
// Add caching layer
// Implement lazy loading
// Handle memory warnings
func loadImage(from url: URL) async throws -> UIImage {
    // Copilot will suggest optimizations
}
```

### セキュリティ

```swift
// Implement secure keychain storage
// Store: API tokens, user credentials
// Include encryption
// Handle errors gracefully
class KeychainService {
    // Copilot will suggest secure implementation
}
```

## まとめ

GitHub Copilot Pro は強力なツールですが、以下を忘れないでください:

1. **コードレビューは必須**: AI が生成したコードも必ず確認
2. **理解してから使用**: 提案されたコードを理解する
3. **セキュリティチェック**: セキュリティに関わる部分は特に注意
4. **テストの作成**: AI 生成コードにもテストを書く

---

Happy Coding with GitHub Copilot Pro! 🚀
