# ビルドに関する重要な注意事項

## macOS が必要です

このプロジェクトは **iOS/SwiftUI アプリケーション**であるため、ビルドと実行には **macOS** と **Xcode** が必要です。

### なぜ Linux や Windows でビルドできないのか？

SwiftUI は Apple のプラットフォーム専用のフレームワークであり、以下のプラットフォームでのみ利用可能です:
- iOS
- iPadOS
- macOS
- watchOS
- tvOS

### ビルド方法

#### macOS の場合:

1. **Xcode で開く:**
   ```bash
   open Package.swift
   ```

2. **ビルド:**
   - Xcode で `⌘B` を押す
   - または `Product > Build` を選択

3. **実行:**
   - iOS シミュレータを選択
   - `⌘R` を押す
   - または `Product > Run` を選択

#### コマンドラインからビルド (macOS):

```bash
# iOS シミュレータ用にビルド
xcodebuild -scheme AIDrivenIOSApp -destination 'platform=iOS Simulator,name=iPhone 15' build

# macOS 用にビルド (Catalyst アプリの場合)
swift build
```

### CI/CD について

GitHub Actions などの CI/CD パイプラインでビルドする場合は、**macOS ランナー**を使用する必要があります:

```yaml
jobs:
  build:
    runs-on: macos-latest  # macOS ランナーを使用
    steps:
      - uses: actions/checkout@v4
      - name: Build
        run: |
          xcodebuild -scheme AIDrivenIOSApp \
            -destination 'platform=iOS Simulator,name=iPhone 15' \
            build
```

### テストについて

- **ユニットテスト**: `swift test` は macOS でのみ実行可能
- **UI テスト**: Xcode と iOS シミュレータが必要

### 開発環境

推奨環境:
- **OS**: macOS 13.0 以上
- **Xcode**: 15.0 以上
- **Swift**: 5.9 以上
- **デバイス**: 
  - iPhone (iOS 17.0+)
  - iPad (iPadOS 17.0+)
  - iPhone/iPad シミュレータ

### よくある質問

**Q: Windows や Linux で開発できますか？**
A: SwiftUI アプリの開発には macOS と Xcode が必須です。ただし、ロジック部分（Foundation のみ使用）は他のプラットフォームでも開発可能です。

**Q: クロスプラットフォーム開発はできますか？**
A: SwiftUI は Apple プラットフォーム専用です。クロスプラットフォームが必要な場合は、React Native や Flutter などのフレームワークを検討してください。

**Q: GitHub Codespaces で開発できますか？**
A: GitHub Codespaces は Linux ベースのため、SwiftUI の開発には適していません。ローカルの macOS 環境を使用してください。

---

**開発を始めるには、macOS コンピュータまたは Mac を使用してください！**
