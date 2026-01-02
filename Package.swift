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
    ],
    targets: [
        .target(
            name: "AIDrivenIOSApp",
            dependencies: [],
            path: "Sources/AIDrivenIOSApp"),
    ]
)
