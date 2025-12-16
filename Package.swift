// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AIDrivenIOSApp",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "AIDrivenIOSApp",
            targets: ["AIDrivenIOSApp"]),
    ],
    targets: [
        .target(
            name: "AIDrivenIOSApp"),
        .testTarget(
            name: "AIDrivenIOSAppTests",
            dependencies: ["AIDrivenIOSApp"]),
    ]
)
