# ビルドノート / Build Notes

このドキュメントでは、プロジェクトのビルド要件と環境について説明します。

This document explains the build requirements and environment for the project.

## 🍎 macOSとXcodeが必要な理由 / Why macOS and Xcode are Required

### SwiftUIの制約 / SwiftUI Constraints

**SwiftUI**は、Appleが開発したUIフレームワークで、以下の理由によりmacOS環境でのみビルド可能です。

**SwiftUI** is a UI framework developed by Apple and can only be built in a macOS environment for the following reasons:

1. **Appleプラットフォーム専用** / Apple Platform Exclusive
   - SwiftUIはiOS、macOS、watchOS、tvOS専用
   - Linux/Windowsではサポートされていない
   - SwiftUI is exclusive to iOS, macOS, watchOS, tvOS
   - Not supported on Linux/Windows

2. **Xcodeツールチェーン** / Xcode Toolchain
   - SwiftUIのビルドにはXcodeのツールチェーンが必要
   - コード署名とプロビジョニング
   - Requires Xcode's toolchain to build SwiftUI
   - Code signing and provisioning

3. **フレームワーク依存** / Framework Dependencies
   - UIKit、Foundation、Combineなどのフレームワーク
   - macOS SDKが必須
   - Frameworks like UIKit, Foundation, Combine
   - macOS SDK is required

## 🛠️ ビルド環境 / Build Environment

### 必須要件 / Required

```bash
# macOS バージョン確認 / Check macOS version
sw_vers
# 推奨: macOS 12.0 (Monterey) 以降
# Recommended: macOS 12.0 (Monterey) or later

# Xcode バージョン確認 / Check Xcode version
xcodebuild -version
# 推奨: Xcode 14.0 以降
# Recommended: Xcode 14.0 or later

# Swift バージョン確認 / Check Swift version
swift --version
# 必須: Swift 5.9 以降
# Required: Swift 5.9 or later
```

### 推奨構成 / Recommended Configuration

| コンポーネント / Component | 最小 / Minimum | 推奨 / Recommended |
|---------------------------|----------------|-------------------|
| macOS | 12.0 Monterey | 14.0 Sonoma以降 / or later |
| Xcode | 14.0 | 15.0以降 / or later |
| Swift | 5.9 | 5.9以降 / or later |
| RAM | 8 GB | 16 GB以降 / or later |
| Storage | 20 GB | 50 GB以降 / or later |

## 📦 ビルド方法 / Build Methods

### 1. Swift Package Manager (推奨 / Recommended)

```bash
# プロジェクトルートで / In project root
swift build

# リリースビルド / Release build
swift build -c release

# テスト実行 / Run tests
swift test

# 特定のテストのみ実行 / Run specific tests
swift test --filter AIDrivenUtilitiesTests
```

**利点 / Advantages**:
- ✅ 軽量で高速 / Lightweight and fast
- ✅ バージョン管理が容易 / Easy version control
- ✅ CI/CDとの統合が簡単 / Simple CI/CD integration

### 2. Xcode

```bash
# Xcodeでプロジェクトを開く / Open project in Xcode
open Package.swift

# または / Or
xed .
```

**Xcodeでのビルド手順 / Build steps in Xcode**:
1. プロジェクトを開く / Open project
2. スキームを選択: `AIDrivenIOSApp` / Select scheme: `AIDrivenIOSApp`
3. ターゲットを選択: iPhoneシミュレータ / Select target: iPhone Simulator
4. `⌘ + B` でビルド / Build with `⌘ + B`
5. `⌘ + R` で実行 / Run with `⌘ + R`

**利点 / Advantages**:
- ✅ デバッグツールが豊富 / Rich debugging tools
- ✅ Interface Builderが使える / Interface Builder available
- ✅ プレビュー機能 / Preview functionality

## 🐧 Linux環境での制限 / Linux Limitations

### ユーティリティレイヤーのみビルド可能 / Only Utility Layer Builds

Linux環境では、SwiftUIに依存しないコードのみビルド可能です。

In Linux environment, only code without SwiftUI dependencies can be built.

```bash
# Linuxでビルド可能 / Can build on Linux
# - AIDrivenUtilities.swift (プラットフォーム非依存 / platform-independent)

# Linuxでビルド不可 / Cannot build on Linux
# - AIDrivenApp.swift (SwiftUI依存 / SwiftUI dependent)
# - ContentView.swift (SwiftUI依存 / SwiftUI dependent)
# - AIAssistantView.swift (SwiftUI依存 / SwiftUI dependent)
```

### Linux用の条件付きコンパイル / Conditional Compilation for Linux

将来的にLinux対応が必要な場合:

For future Linux support if needed:

```swift
#if canImport(SwiftUI)
import SwiftUI

struct ContentView: View {
    // SwiftUI implementation
}
#else
// Linux用の代替実装 / Alternative implementation for Linux
#endif
```

## 🔧 トラブルシューティング / Troubleshooting

### ビルドエラー / Build Errors

#### エラー: "No such module 'SwiftUI'"

```bash
# 原因 / Cause: Xcode未インストール or 古いバージョン
# Reason: Xcode not installed or old version

# 解決策 / Solution:
# 1. Xcodeをインストール / Install Xcode
open -a "App Store"
# App StoreでXcodeを検索してインストール

# 2. コマンドラインツールを設定 / Set up command line tools
sudo xcode-select --switch /Applications/Xcode.app
sudo xcodebuild -license accept
```

#### エラー: "Building for iOS, but the linked framework was built for macOS"

```bash
# 原因 / Cause: プラットフォーム設定の不一致
# Reason: Platform configuration mismatch

# 解決策 / Solution:
# Package.swiftでプラットフォームを確認
# Check platforms in Package.swift
swift package clean
swift build
```

#### エラー: "Swift Compiler Error"

```bash
# 原因 / Cause: Swiftバージョンの不一致
# Reason: Swift version mismatch

# 解決策 / Solution:
swift --version  # バージョン確認 / Check version
# Swift 5.9以降が必要 / Requires Swift 5.9 or later

# Xcodeを更新 / Update Xcode
```

### シミュレータの問題 / Simulator Issues

```bash
# シミュレータをリスト表示 / List simulators
xcrun simctl list devices

# シミュレータをリセット / Reset simulator
xcrun simctl erase all

# 特定のシミュレータを起動 / Boot specific simulator
xcrun simctl boot "iPhone 15 Pro"
```

### キャッシュのクリア / Clear Cache

```bash
# Swift Package Managerのキャッシュをクリア
# Clear Swift Package Manager cache
swift package clean
rm -rf .build

# Xcodeの派生データをクリア / Clear Xcode derived data
rm -rf ~/Library/Developer/Xcode/DerivedData/*

# シミュレータのキャッシュをクリア / Clear simulator cache
xcrun simctl delete unavailable
```

## 🚀 CI/CD環境 / CI/CD Environment

### GitHub Actions

このプロジェクトはGitHub Actionsを使用しています。

This project uses GitHub Actions.

```yaml
# .github/workflows/ios-build.yml
jobs:
  build:
    runs-on: macos-latest  # macOSランナーが必須 / macOS runner required
    steps:
      - uses: actions/checkout@v4
      - name: Build
        run: swift build
      - name: Test
        run: swift test
```

**重要 / Important**:
- macOSランナーのみがSwiftUIをビルド可能
- Only macOS runners can build SwiftUI
- Linuxランナーではビルドが失敗する
- Linux runners will fail to build
- これは意図的な動作です / This is intentional behavior

## 📊 ビルド時間の目安 / Build Time Estimates

| 環境 / Environment | クリーンビルド / Clean Build | インクリメンタル / Incremental |
|-------------------|----------------------------|-------------------------------|
| MacBook Pro M1 | ~30秒 / ~30s | ~5秒 / ~5s |
| MacBook Air Intel | ~60秒 / ~60s | ~10秒 / ~10s |
| GitHub Actions | ~120秒 / ~120s | ~30秒 / ~30s |

## 🎯 ベストプラクティス / Best Practices

### 開発環境 / Development Environment

1. **Xcodeを最新に保つ** / Keep Xcode Updated
   ```bash
   # App Storeで更新を確認
   # Check for updates in App Store
   ```

2. **依存関係を最小限に** / Minimize Dependencies
   - 外部ライブラリは慎重に選択 / Carefully select external libraries
   - Swift Package Managerを優先 / Prefer Swift Package Manager

3. **ビルド設定の最適化** / Optimize Build Settings
   - デバッグビルドは高速化優先 / Prioritize speed for debug builds
   - リリースビルドは最適化優先 / Prioritize optimization for release builds

### CI/CDの設定 / CI/CD Configuration

1. **macOSランナーを使用** / Use macOS Runners
2. **キャッシュを活用** / Utilize Caching
3. **並列実行** / Parallel Execution
4. **タイムアウトの設定** / Set Timeouts

## 📚 参考資料 / References

- [Xcode Documentation](https://developer.apple.com/documentation/xcode)
- [Swift Package Manager](https://www.swift.org/package-manager/)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [GitHub Actions for iOS](https://docs.github.com/actions/guides/building-and-testing-swift)

## 💡 まとめ / Summary

- ✅ SwiftUIアプリはmacOS + Xcode環境が必須
- ✅ SwiftUI apps require macOS + Xcode environment
- ✅ ユーティリティコードはクロスプラットフォーム
- ✅ Utility code is cross-platform
- ✅ CI/CDはmacOSランナーを使用
- ✅ CI/CD uses macOS runners
- ✅ 適切な環境で高速なビルドが可能
- ✅ Fast builds possible in proper environment
