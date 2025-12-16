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
└── PROJECT_OVERVIEW.md       # 完全な学習パス

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

## 💻 開発環境要件 / Development Environment

### 必須 / Required
- **macOS**: 12.0 (Monterey) 以降 / or later
- **Xcode**: 14.0 以降 / or later  
- **Swift**: 5.9 以降 / or later
- **iOS Target**: 15.0 以降 / or later

### 推奨 / Recommended
- macOS 14.0 (Sonoma) 以降
- Xcode 15.0 以降
- 16GB RAM以上
- GitHub Copilot サブスクリプション

### なぜmacOSが必要？ / Why macOS?
SwiftUIはAppleプラットフォーム専用フレームワークで、Linux/Windowsではサポートされていません。詳細は [BUILD_NOTES.md](docs/BUILD_NOTES.md) を参照。

SwiftUI is Apple platform-exclusive and not supported on Linux/Windows. See [BUILD_NOTES.md](docs/BUILD_NOTES.md) for details.

## 🔧 CI/CD & セキュリティ / CI/CD & Security

### GitHub Actionsワークフロー / Workflows

**iOS Build & Test**
- macOS最新ランナー使用
- Swift Package Managerでビルド
- ユニットテスト自動実行
- コードカバレッジレポート

**CodeQL Security Scan**
- Swift言語対応
- プルリクエストごとにスキャン
- 定期スケジュール実行 (毎週土曜)
- セキュリティイベント書き込み権限

### セキュリティ機能 / Security Features

✅ **メモリリーク防止** - Timer無効化in `ThinkingIndicator.onDisappear()`  
✅ **最小権限原則** - Actions permissions: `contents: read`  
✅ **入力検証** - メールアドレス正規表現バリデーション  
✅ **自動スキャン** - CodeQLによる脆弱性検出

## 🎓 学習パス / Learning Path

### 初級 / Beginner (2時間)
1. ✅ [QUICKSTART.md](docs/QUICKSTART.md) で環境セットアップ
2. ✅ アプリを実行してデモ機能を確認
3. ✅ `AIDrivenUtilities.swift` のコードを読む
4. ✅ ユニットテストを実行

### 中級 / Intermediate (5時間)
5. ✅ [COPILOT_GUIDE.md](docs/COPILOT_GUIDE.md) でCopilot活用法を学ぶ
6. ✅ 新しいバリデーション関数を追加（電話番号など）
7. ✅ テストケースをCopilotで生成
8. ✅ ContentViewに新しいUIコンポーネント追加

### 上級 / Advanced (10時間)
9. ✅ [PROJECT_OVERVIEW.md](docs/PROJECT_OVERVIEW.md) でアーキテクチャを理解
10. ✅ 実際のAI APIと統合（OpenAI、Anthropicなど）
11. ✅ データ永続化実装（CoreData/UserDefaults）
12. ✅ CI/CDワークフローのカスタマイズ

## 🤝 コントリビューション / Contributing

プロジェクトへの貢献を歓迎します！ / Contributions are welcome!

### 貢献方法 / How to Contribute

1. **Issueを作成** / Create an issue
   - バグレポート / Bug report
   - 機能リクエスト / Feature request
   - ドキュメント改善 / Documentation improvement

2. **フォーク & ブランチ作成** / Fork & Create branch
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **開発 & テスト** / Develop & Test
   ```bash
   swift build && swift test
   ```

4. **プルリクエスト作成** / Create Pull Request
   - 明確な説明を記載
   - テストが通過していることを確認
   - レビュー待機

### コーディング規約 / Coding Standards
- Swift API Design Guidelinesに従う
- ドキュメントコメントを追加
- ユニットテストを書く
- [.github/copilot-instructions.md](.github/copilot-instructions.md) の規約に従う

## 📊 プロジェクトロードマップ / Roadmap

### ✅ フェーズ1: 基礎実装 (完了 / Completed)
- [x] SwiftUIアプリ構造
- [x] インタラクティブデモUI
- [x] AIチャットインターフェース
- [x] プラットフォーム非依存ユーティリティ
- [x] 包括的ユニットテスト
- [x] 日本語ドキュメント
- [x] CI/CDパイプライン
- [x] CodeQLセキュリティスキャン

### 📋 フェーズ2: 機能拡張 (計画中 / Planned)
- [ ] 実際のAI API統合
- [ ] データ永続化 (CoreData)
- [ ] ネットワーク通信層
- [ ] UIテスト追加
- [ ] より多くのユーティリティ関数

### 🔮 フェーズ3: プロダクション対応 (将来 / Future)
- [ ] App Store準備
- [ ] 完全なローカライゼーション
- [ ] アクセシビリティ完全対応
- [ ] パフォーマンス最適化
- [ ] アナリティクス統合

## 📚 関連リソース / Resources

### 公式ドキュメント / Official Docs
- [Swift Documentation](https://swift.org/documentation/)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [GitHub Copilot Docs](https://docs.github.com/copilot)
- [Xcode Documentation](https://developer.apple.com/xcode/)

### コミュニティ / Community
- [Swift Forums](https://forums.swift.org/)
- [GitHub Discussions](https://github.com/HiroM115/Copilot-Triggered-IOS-Dev/discussions)
- [Hacking with Swift](https://www.hackingwithswift.com/)

## 📄 ライセンス / License

このプロジェクトのライセンスについては、[LICENSE](LICENSE) ファイルを参照してください。

See [LICENSE](LICENSE) file for details.

## 🙏 謝辞 / Acknowledgments

- GitHub Copilot チームによる素晴らしいAI開発ツール
- Swift コミュニティのサポートとリソース
- すべてのコントリビューターの貢献

---

**Made with ❤️ and 🤖 GitHub Copilot**

**日本のiOS開発者コミュニティのために / For Japanese iOS Developer Community**
