# AI駆動型iOS開発 / AI-Driven iOS Development

GitHub Copilotを活用したプロダクション対応のiOSアプリケーション実装例

Production-ready iOS application demonstrating AI-driven development with GitHub Copilot

[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2015.0+-lightgrey.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GitHub Actions](https://github.com/HiroM115/Copilot-Triggered-IOS-Dev/workflows/iOS%20Build/badge.svg)](https://github.com/HiroM115/Copilot-Triggered-IOS-Dev/actions)

## ✨ 主な機能 / Key Features

### 📱 SwiftUI アプリケーション
- **インタラクティブデモ** - メール検証、日付フォーマット、UUID生成
- **AIチャットUI** - メッセージバブル、タイピングインジケーター、リアルタイム応答
- **モダンなUI/UX** - SwiftUIベースの洗練されたインターフェース
- **メモリ安全** - 適切なタイマーライフサイクル管理

### 🛠️ プラットフォーム非依存ユーティリティ
- ✉️ メールアドレス検証（RFC 5322準拠）
- 📅 日付フォーマット（長形式・相対時間）
- 🔢 UUID生成（フル・短縮形式）
- ✅ 包括的なユニットテスト

### 🔒 プロダクション品質
- **CodeQL統合** - 自動セキュリティスキャン
- **CI/CDパイプライン** - iOS自動ビルド・テスト
- **メモリリーク対策** - ThinkingIndicatorでのTimer無効化
- **最小権限** - GitHub Actions permissions: `contents: read`

## 🚀 クイックスタート / Quick Start

### 必須環境 / Prerequisites

```bash
# macOS 12.0+ および Xcode 14.0+ が必要
# Requires macOS 12.0+ and Xcode 14.0+
sw_vers
xcode-select --version
```

### インストールと実行 / Installation & Run

```bash
# 1. リポジトリをクローン / Clone repository
git clone https://github.com/HiroM115/Copilot-Triggered-IOS-Dev.git
cd Copilot-Triggered-IOS-Dev

# 2. ビルド / Build
swift build

# 3. テスト実行 / Run tests
swift test

# 4. Xcodeで開く / Open in Xcode
open Package.swift
```

**Xcodeでの実行** / Run in Xcode:
1. スキーム選択: `AIDrivenIOSApp`
2. ターゲット: iPhone Simulator
3. `⌘ + R` で実行

### 📚 ドキュメント / Documentation

| ドキュメント | 説明 | 所要時間 |
|------------|------|---------|
| [QUICKSTART.md](docs/QUICKSTART.md) | 5分で始める実践ガイド | 5分 |
| [COPILOT_GUIDE.md](docs/COPILOT_GUIDE.md) | Copilot活用パターン・ショートカット | 30分 |
| [BUILD_NOTES.md](docs/BUILD_NOTES.md) | macOS/Xcode要件の詳細説明 | 15分 |
| [PROJECT_OVERVIEW.md](docs/PROJECT_OVERVIEW.md) | 学習パス・貢献ガイド | 1時間 |
| [SETUP.md](docs/SETUP.md) | 開発環境セットアップガイド | 15分 |
| [AI_DRIVEN_DEVELOPMENT.md](docs/AI_DRIVEN_DEVELOPMENT.md) | AI駆動開発のベストプラクティス | 30分 |

## 🧪 テスト / Testing

### ユニットテスト例 / Unit Test Example

```swift
func testEmailValidation() throws {
    // Given: 有効なメールアドレス
    XCTAssertTrue(AIDrivenUtilities.isValidEmail("user@example.com"))
    
    // Given: 無効なメールアドレス
    XCTAssertFalse(AIDrivenUtilities.isValidEmail("invalid.email"))
}
```

**テスト実行** / Run Tests:
```bash
swift test                           # 全テスト
swift test --enable-code-coverage   # カバレッジ付き
```

**注意** / Note: SwiftUI UIコンポーネントはmacOS + Xcode必須。Linuxビルドは意図的にUI部分で失敗しますが、ユーティリティ層のテストは通過します。

## 🏗️ プロジェクト構成 / Project Structure

```
Sources/AIDrivenIOSApp/
├── AIDrivenApp.swift          # @main エントリーポイント
├── ContentView.swift          # メインUI・インタラクティブデモ
├── AIAssistantView.swift      # チャットUI（バブル・タイピング表示）
└── AIDrivenUtilities.swift    # プラットフォーム非依存ユーティリティ

Tests/AIDrivenIOSAppTests/
└── AIDrivenUtilitiesTests.swift # ユニットテスト

docs/
├── QUICKSTART.md              # 5分クイックスタート
├── COPILOT_GUIDE.md          # Copilot高度な使い方
├── BUILD_NOTES.md            # ビルド要件詳細
├── PROJECT_OVERVIEW.md       # 完全な学習パス
├── SETUP.md                  # 開発環境セットアップ
└── AI_DRIVEN_DEVELOPMENT.md  # AI駆動開発ガイド

.github/workflows/
├── ios-build.yml             # iOS CI/CD
└── codeql.yml                # セキュリティスキャン
```

## 🤖 GitHub Copilot Configuration

This repository is configured to provide an enhanced development experience with GitHub Copilot through:

### Custom Instructions

Custom instructions are defined in `.github/copilot-instructions.md` to provide Copilot with:
- Project-specific context and conventions
- iOS development best practices
- Code style guidelines
- Security and privacy considerations
- Testing and documentation standards

These instructions help Copilot generate more relevant and context-aware suggestions tailored to iOS development.

### Development Environment

A development container configuration is available in `.devcontainer/devcontainer.json` that includes:
- Pre-configured development tools and extensions
- GitHub Copilot and Copilot Chat extensions
- Optimized VS Code settings for iOS development
- Support for Swift and Objective-C file associations
- Automatic formatting and linting setup

**Note:** This container provides general development tools and Copilot configuration. Actual iOS app compilation requires macOS with Xcode installed. The devcontainer is suitable for documentation, scripts, configuration, and leveraging Copilot's assistance.

To use the development container:
1. Install Docker and VS Code with the Remote-Containers extension
2. Open this repository in VS Code
3. When prompted, click "Reopen in Container" or use the command palette: "Remote-Containers: Reopen in Container"

### Model Context Protocol (MCP) Servers

MCP server configuration in `.github/copilot-mcp-config.json` enables Copilot to:
- Access filesystem for reading and writing project files
- Interact with GitHub API for repository operations
- Perform Git operations for version control
- Fetch web content for documentation and resources

To use MCP servers with Copilot:
1. Ensure you have Node.js installed (for npx commands)
2. Set up the required environment variables (e.g., `GITHUB_TOKEN`)
3. Configure your GitHub Copilot to use the MCP configuration file

## 💡 Copilot Proを使った開発のコツ / Tips for Development with Copilot Pro

### 1. コメント駆動開発 / Comment-Driven Development

Copilotは自然言語のコメントから高品質なコードを生成します。

Copilot generates high-quality code from natural language comments.

```swift
// ユーザーのプロフィール画像を円形にクリップして表示
// Display user's profile image clipped in a circle
```

### 2. 関数名からの実装 / Implementation from Function Names

明確な関数名を書くと、Copilotが実装を提案します。

Write clear function names and Copilot will suggest implementations.

```swift
func validateEmailAddress(_ email: String) -> Bool {
    // Copilotが実装を提案 / Copilot suggests implementation
}
```

### 3. テスト駆動開発 / Test-Driven Development

テストケースを先に書くと、Copilotが実装を提案します。

Write test cases first and Copilot will suggest implementations.

```swift
func testUserAuthentication() {
    // テストケースを書く / Write test cases
    // Copilotが実装を提案 / Copilot suggests implementation
}
```

### 4. パターンの活用 / Utilizing Patterns

既存のコードパターンを認識し、一貫したコードを生成します。

Recognizes existing code patterns and generates consistent code.

## 🎯 開発のベストプラクティス / Development Best Practices

1. **小さくコミット** / Small commits
2. **明確な命名** / Clear naming conventions
3. **コメントを活用** / Utilize comments
4. **型安全性** / Type safety
5. **SwiftUIのプレビュー活用** / Use SwiftUI previews

## 📚 参考資料 / References

- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [Swift Programming Language](https://swift.org/documentation/)

## 🤝 コントリビューション / Contributing

プルリクエストを歓迎します！大きな変更の場合は、まずissueを開いて変更内容を議論してください。

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

When contributing to this project, please follow the guidelines in `.github/copilot-instructions.md` to maintain consistency with the project's coding standards and best practices.

## 📄 ライセンス / License

MIT License

## 👨‍💻 作者 / Author

Created with ❤️ using GitHub Copilot Pro
