// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CopilotIOSApp",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "CopilotIOSApp",
            targets: ["CopilotIOSApp"]),
    ],
    dependencies: [
        // Add your dependencies here
        // Example:
        // .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0"),
    ],
    targets: [
        .target(
            name: "CopilotIOSApp",
            dependencies: []),
        .testTarget(
            name: "CopilotIOSAppTests",
            dependencies: ["CopilotIOSApp"]),
    ]
)
