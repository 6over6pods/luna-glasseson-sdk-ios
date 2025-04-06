// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GlassesOnSDK",
    defaultLocalization: "en-US",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GlassesOnSDK",
            targets: ["GlassesOnWrapper"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/airbnb/lottie-spm.git",
            exact: "4.5.1"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GlassesOnWrapper",
            dependencies: [
                .target(name: "GlassesOnSDK"),
                .product(name: "Lottie", package: "lottie-spm")
            ]
        ),
        .binaryTarget(
            name: "GlassesOnSDK",
            url: "https://glasseson.jfrog.io/artifactory/luna-glasseson-sdk-ios-local/5.63.1-2929/GlassesOnSDK.xcframework.zip",
            checksum: "d30c4182166511b00ef3ce5e5ec46b2840ed8298b931c1eb21c002048069664d"
        )
    ]
)
