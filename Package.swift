// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOSVersionSupportChecker",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "ivsc", targets: ["iOSVersionSupportChecker"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "iOSVersionSupportChecker",
            dependencies: []),
        .testTarget(
            name: "iOSVersionSupportCheckerTests",
            dependencies: ["iOSVersionSupportChecker"]),
    ]
)
