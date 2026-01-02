// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AIDrivenIOSApp",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "AIDrivenIOSApp",
            targets: ["AIDrivenIOSApp"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Quick/Quick.git", from: "7.6.2"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "13.6.0"),
    ],
    targets: [
        .target(
            name: "AIDrivenIOSApp",
            dependencies: [],
            path: "Sources/AIDrivenIOSApp"),
        .testTarget(
            name: "AIDrivenIOSAppTests",
            dependencies: [
                "AIDrivenIOSApp",
                .product(name: "Quick", package: "Quick"),
                .product(name: "Nimble", package: "Nimble"),
            ],
            path: "Tests/AIDrivenIOSAppTests"),
    ]
)
