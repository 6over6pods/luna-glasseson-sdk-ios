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
            url: "https://glasseson.jfrog.io/artifactory/luna-glasseson-sdk-ios-local/5.63.1-2836-2837-2839-2841-2843-2845-2847-2849-2851-2853-2855-2857-2859-2861-2863-2865/GlassesOnSDK.xcframework.zip",
            checksum: "d6ab361c60c5906d94581b4dc444611a0a13c27ca828ae3618191d6a361ffe9d"
        )
    ]
)
