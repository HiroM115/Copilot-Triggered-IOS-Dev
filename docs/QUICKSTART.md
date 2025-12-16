# クイックスタート / Quick Start

> **所要時間 / Time Required**: 5分 / 5 minutes

このガイドでは、AI駆動iOS開発の基本を素早く理解できます。

This guide helps you quickly understand the basics of AI-driven iOS development.

## 📱 プロジェクト概要 / Project Overview

**AIDrivenIOSApp**は、GitHub Copilotを活用したAI駆動開発の実践例です。

**AIDrivenIOSApp** is a practical example of AI-driven development using GitHub Copilot.

### 主な機能 / Key Features

- ✉️ **メールバリデーション** / Email Validation
- 📅 **日付フォーマット** / Date Formatting  
- 🔢 **UUID生成** / UUID Generation
- 💬 **AIアシスタントチャット** / AI Assistant Chat

## 🚀 5分で始める / Get Started in 5 Minutes

### 1. 必要なもの / Prerequisites

```bash
# macOS環境を確認 / Verify macOS environment
sw_vers

# Xcodeがインストールされているか確認 / Check if Xcode is installed
xcode-select --version
```

**必須要件 / Requirements**:
- macOS 12.0以降 / macOS 12.0 or later
- Xcode 14.0以降 / Xcode 14.0 or later
- iOS 15.0以降対応デバイス / Device supporting iOS 15.0 or later

### 2. プロジェクトのセットアップ / Project Setup

```bash
# リポジトリをクローン / Clone the repository
git clone https://github.com/HiroM115/Copilot-Triggered-IOS-Dev.git
cd Copilot-Triggered-IOS-Dev

# Swift Package Managerでビルド / Build with Swift Package Manager
swift build

# テストを実行 / Run tests
swift test
```

### 3. Xcodeで開く / Open in Xcode

```bash
# Xcodeでプロジェクトを開く / Open project in Xcode
open Package.swift
```

または / Or:
1. Xcodeを起動 / Launch Xcode
2. "Open a project or file" を選択 / Select "Open a project or file"
3. `Package.swift` を選択 / Select `Package.swift`

### 4. アプリを実行 / Run the App

1. **ターゲットを選択** / Select a target: `AIDrivenIOSApp` > iPhone Simulator
2. **実行** / Run: `⌘ + R` またはPlayボタン / or Play button
3. **動作確認** / Verify:
   - メールアドレスを入力してバリデーション / Enter email and validate
   - 日付を選択してフォーマット確認 / Select date to see formatting
   - UUIDを生成 / Generate UUID
   - AIアシスタントを起動 / Launch AI Assistant

## 💡 実践例 / Practical Examples

### 例1: メールバリデーション / Example 1: Email Validation

```swift
import AIDrivenIOSApp

// 有効なメールアドレスをチェック / Check valid email
let isValid = AIDrivenUtilities.isValidEmail("user@example.com")
print(isValid) // true

// 無効なメールアドレス / Invalid email
let isInvalid = AIDrivenUtilities.isValidEmail("invalid.email")
print(isInvalid) // false
```

### 例2: 日付フォーマット / Example 2: Date Formatting

```swift
import Foundation
import AIDrivenIOSApp

let date = Date()

// 長い形式でフォーマット / Format in long style
let formatted = AIDrivenUtilities.formatDate(date)
print(formatted) // "December 16, 2024"

// 相対時間で表示 / Display as relative time
let relative = AIDrivenUtilities.formatRelativeTime(date)
print(relative) // "now"
```

### 例3: UUID生成 / Example 3: UUID Generation

```swift
import AIDrivenIOSApp

// フルUUIDを生成 / Generate full UUID
let uuid = AIDrivenUtilities.generateUUID()
print(uuid) // "E621E1F8-C36C-495A-93FC-0C247A3E6E5F"

// 短いUUIDを生成 / Generate short UUID
let shortId = AIDrivenUtilities.generateShortUUID()
print(shortId) // "E621E1F8"
```

## 🎯 次のステップ / Next Steps

1. **詳細ガイド** / Detailed Guides:
   - [PROJECT_OVERVIEW.md](PROJECT_OVERVIEW.md) - 完全な学習パス / Complete learning path
   - [COPILOT_GUIDE.md](COPILOT_GUIDE.md) - Copilotの高度な使い方 / Advanced Copilot usage

2. **開発環境** / Development Environment:
   - [BUILD_NOTES.md](BUILD_NOTES.md) - ビルド要件の詳細 / Detailed build requirements

3. **実装を深く理解** / Deep Dive into Implementation:
   - `Sources/AIDrivenIOSApp/` - ソースコードを探索 / Explore source code
   - `Tests/` - テストコードから学ぶ / Learn from test code

## ⚡ トラブルシューティング / Troubleshooting

### ビルドエラー / Build Errors

```bash
# Xcodeのコマンドラインツールを設定 / Set up Xcode command line tools
sudo xcode-select --switch /Applications/Xcode.app

# Swiftバージョンを確認 / Check Swift version
swift --version  # Should be 5.9 or later
```

### シミュレータの問題 / Simulator Issues

```bash
# シミュレータをリセット / Reset simulator
xcrun simctl erase all

# 利用可能なシミュレータを確認 / List available simulators
xcrun simctl list devices
```

## 🤝 コントリビューション / Contributing

プロジェクトへの貢献を歓迎します！

Contributions are welcome!

1. このリポジトリをフォーク / Fork this repository
2. フィーチャーブランチを作成 / Create a feature branch
3. 変更をコミット / Commit your changes
4. プルリクエストを作成 / Create a Pull Request

## 📚 関連リソース / Related Resources

- [Swift Documentation](https://swift.org/documentation/)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [GitHub Copilot Documentation](https://docs.github.com/copilot)
