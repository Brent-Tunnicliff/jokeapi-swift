// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
// Copyright © 2025 Brent Tunnicliff <brent@tunnicliff.dev>

import PackageDescription

let package = Package(
    name: "swift-joke",
    defaultLocalization: "en",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "SwiftJoke",
            targets: ["SwiftJoke"]
        ),
        .executable(
            name: "joke",
            targets: ["joke"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/apple/swift-crypto.git", .upToNextMajor(from: "4.2.0")),
        .package(url: "https://github.com/Brent-Tunnicliff/swift-format-plugin", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "602.0.0"),
        .package(path: "../lib-url-macro-swift")
    ],
    targets: [
        .target(
            name: "SwiftJoke",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto"),
                .product(name: "URLMacro", package: "lib-url-macro-swift")
            ]
        ),
        .testTarget(
            name: "SwiftJokeTests",
            dependencies: ["SwiftJoke"]
        ),
        .executableTarget(
            name: "joke",
            dependencies: [
                "SwiftJoke",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            path: "Sources/JokeExecutable"
        )
    ]
)

// MARK: - Common target settings

// Sets values that are common for every target.
// Plugins cannot contain plugins or swift settings.
for target in package.targets where target.type != .plugin {
    // MARK: Plugins

    let commonPlugins: [PackageDescription.Target.PluginUsage] = [
        .plugin(name: "LintBuildPlugin", package: "swift-format-plugin")
    ]

    target.plugins = (target.plugins ?? []) + commonPlugins

    // MARK: Swift compliler settings

    let commonSwiftSettings: [PackageDescription.SwiftSetting] = [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + commonSwiftSettings
}
