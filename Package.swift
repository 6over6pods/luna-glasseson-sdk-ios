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
            url: "https://github.com/airbnb/lottie-ios.git",
            exact: "3.1.3"
        ),
        .package(
            url: "https://github.com/kirualex/SwiftyGif.git",
            "5.4.4" ..< "6.0.0"
        ) 
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GlassesOnWrapper",
            dependencies: [
                .target(name: "GlassesOnSDK"),
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "SwiftyGif", package: "SwiftyGif") //,
//                .product(name: "Mixpanel", package: "mixpanel-swift")
            ]
        ),
        .binaryTarget(
            name: "GlassesOnSDK",
            url: "https://glasseson.jfrog.io/artifactory/luna-glasseson-sdk-ios-local/5.61.0-2665/GlassesOnSDK.xcframework.zip",
            checksum: "2e5d9c790e507058f35668a85185dbb8826e4ec3c0ed38965dee86545c76b980"
        )
    ]
)
