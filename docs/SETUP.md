# 開発環境セットアップガイド / Development Environment Setup Guide

## macOSの準備 / Preparing macOS

### 1. Xcodeのインストール / Installing Xcode

1. App Storeを開く / Open App Store
2. "Xcode"を検索してインストール / Search for "Xcode" and install
3. インストール後、Xcodeを起動して追加コンポーネントをインストール / Launch Xcode after installation to install additional components

または / Or:

```bash
# Command Line Toolsをインストール / Install Command Line Tools
xcode-select --install
```

### 2. Homebrewのインストール（オプション）/ Installing Homebrew (Optional)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. Gitの設定 / Git Configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## GitHub Copilot Proのセットアップ / Setting up GitHub Copilot Pro

### 1. GitHub Copilot Proサブスクリプション / GitHub Copilot Pro Subscription

1. [GitHub Copilot](https://github.com/features/copilot)にアクセス
2. "Copilot Pro"を選択してサブスクライブ
3. 支払い情報を入力して完了

### 2. Xcodeでの設定 / Configuration in Xcode

#### Xcode用Copilot拡張機能のインストール / Installing Copilot Extension for Xcode

現在、Xcodeネイティブのサポートは限定的です。以下の方法でCopilotを活用できます：

Currently, native Xcode support is limited. You can use Copilot through:

1. **VS Codeでの開発** / Development in VS Code:
   - Swiftファイルの編集にVS Codeを使用
   - Use VS Code for editing Swift files

2. **GitHub Copilot for Xcode（サードパーティ）** / GitHub Copilot for Xcode (Third-party):
   ```bash
   brew install --cask copilot-for-xcode
   ```

### 3. VS Codeのセットアップ（推奨）/ VS Code Setup (Recommended)

```bash
# VS Codeのインストール / Install VS Code
brew install --cask visual-studio-code

# Swift拡張機能をインストール / Install Swift extension
code --install-extension sswg.swift-lang
```

VS Code設定 / VS Code settings:

```json
{
  "github.copilot.enable": {
    "*": true,
    "swift": true
  },
  "swift.path": "/usr/bin/swift"
}
```

## プロジェクトのセットアップ / Project Setup

### 1. リポジトリのクローン / Clone Repository

```bash
git clone https://github.com/HiroM115/Copilot-Triggered-IOS-Dev.git
cd Copilot-Triggered-IOS-Dev
```

### 2. プロジェクトを開く / Open Project

```bash
open CopilotIOSApp/CopilotIOSApp.xcodeproj
```

### 3. 依存関係のインストール（必要な場合）/ Install Dependencies (if needed)

Swift Package Managerを使用している場合：
If using Swift Package Manager:

1. Xcodeでプロジェクトを開く / Open project in Xcode
2. File > Add Packages... / File > Add Packages...
3. 必要なパッケージを追加 / Add required packages

## シミュレータの設定 / Simulator Configuration

### 1. シミュレータの起動 / Launch Simulator

```bash
# 利用可能なシミュレータのリスト / List available simulators
xcrun simctl list devices

# シミュレータを起動 / Launch simulator
open -a Simulator
```

### 2. シミュレータの作成 / Create Simulator

Xcode > Window > Devices and Simulators

1. "Simulators"タブを選択 / Select "Simulators" tab
2. "+"をクリックして新しいシミュレータを作成 / Click "+" to create new simulator
3. デバイスタイプとOSバージョンを選択 / Select device type and OS version

## 開発ツール / Development Tools

### 1. SwiftFormat（コードフォーマッター）/ SwiftFormat (Code Formatter)

```bash
brew install swiftformat

# プロジェクトでフォーマット / Format project
swiftformat .
```

### 2. SwiftLint（リンター）/ SwiftLint (Linter)

```bash
brew install swiftlint

# Lintを実行 / Run lint
swiftlint
```

### 3. SourceKit-LSP（Language Server）/ SourceKit-LSP (Language Server)

VS CodeでSwift開発を行う場合、SourceKit-LSPが自動的に使用されます。

SourceKit-LSP is automatically used when developing Swift in VS Code.

## トラブルシューティング / Troubleshooting

### Xcodeビルドエラー / Xcode Build Errors

```bash
# ビルドフォルダをクリーン / Clean build folder
rm -rf ~/Library/Developer/Xcode/DerivedData/*

# Xcodeを再起動 / Restart Xcode
```

### シミュレータが起動しない / Simulator Won't Launch

```bash
# シミュレータをリセット / Reset simulator
xcrun simctl erase all
```

### Copilotが動作しない / Copilot Not Working

1. GitHub Copilotのステータスを確認 / Check GitHub Copilot status
2. VS Codeを再起動 / Restart VS Code
3. 拡張機能を再インストール / Reinstall extension

## 推奨設定 / Recommended Settings

### .gitignore

プロジェクトには既に.gitignoreが含まれています。

The project already includes .gitignore.

### .swiftformat

```swift
--indent 4
--swiftversion 5.9
--disable redundantSelf
```

### .swiftlint.yml

```yaml
disabled_rules:
  - line_length
  - trailing_whitespace

opt_in_rules:
  - empty_count
  - explicit_init

excluded:
  - Pods
  - DerivedData
```

## 次のステップ / Next Steps

1. [Copilot使用ガイド](COPILOT_GUIDE.md)を読む / Read the Copilot Usage Guide
2. サンプルアプリを実行 / Run the sample app
3. 新しい機能を追加してみる / Try adding new features
4. Copilotを使ってテストを書く / Write tests using Copilot

## 参考資料 / References

- [Xcode Documentation](https://developer.apple.com/documentation/xcode)
- [Swift.org](https://swift.org)
- [GitHub Copilot Docs](https://docs.github.com/en/copilot)
- [iOS Development Guide](https://developer.apple.com/ios/)
