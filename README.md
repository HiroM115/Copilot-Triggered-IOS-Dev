# Copilot-Triggered-IOS-Dev

AI駆動開発のためのiOSアプリケーションプロジェクト / iOS Application Project for AI-Driven Development

An iOS development repository enhanced with GitHub Copilot custom instructions, development environment configuration, and Model Context Protocol (MCP) server integration.

## 🚀 概要 / Overview

このプロジェクトは、GitHub Copilot Proを最大限活用してiOS開発を行うためのサンプルアプリケーションです。SwiftUIを使用したモダンなiOSアプリケーション開発のベストプラクティスを示します。

This project is a sample application for iOS development that makes full use of GitHub Copilot Pro. It demonstrates best practices for modern iOS application development using SwiftUI.

## 📱 機能 / Features

- **SwiftUI**: 最新のSwiftUIフレームワークを使用した宣言的UI
- **AI機能サンプル**: AI駆動の提案機能のデモ
- **タスク管理**: タスクの作成、編集、完了状態の管理
- **モダンなアーキテクチャ**: MVVMパターンとSwiftの最新機能

- **SwiftUI**: Declarative UI using the latest SwiftUI framework
- **AI Features Sample**: Demo of AI-driven suggestion features
- **Task Management**: Create, edit, and manage task completion status
- **Modern Architecture**: MVVM pattern and latest Swift features

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

## 🛠️ セットアップ / Setup

### 必要要件 / Requirements

- macOS 13.0以降 / macOS 13.0 or later
- Xcode 15.0以降 / Xcode 15.0 or later
- iOS 17.0以降のシミュレータまたは実機 / iOS 17.0+ simulator or device
- GitHub Copilot Proサブスクリプション（推奨）/ GitHub Copilot Pro subscription (recommended)

### インストール / Installation

1. リポジトリをクローン / Clone the repository:
```bash
git clone https://github.com/HiroM115/Copilot-Triggered-IOS-Dev.git
cd Copilot-Triggered-IOS-Dev
```

2. Xcodeでプロジェクトを開く / Open the project in Xcode:
```bash
open CopilotIOSApp/CopilotIOSApp.xcodeproj
```

3. シミュレータまたは実機を選択してビルド / Select a simulator or device and build

4. (オプション) Use the devcontainer for a consistent development environment

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

## 🏗️ プロジェクト構造 / Project Structure

```
CopilotIOSApp/
├── CopilotIOSApp/
│   ├── CopilotIOSAppApp.swift      # アプリケーションエントリポイント
│   ├── ContentView.swift            # メインビュー
│   ├── AIFeaturesView.swift         # AI機能デモ
│   ├── Info.plist                   # アプリ設定
│   ├── Models/
│   │   └── TaskItem.swift           # タスクデータモデル
│   └── Views/
│       └── TaskListView.swift       # タスク一覧ビュー
```

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
