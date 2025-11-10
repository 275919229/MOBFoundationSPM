// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MOBFoundationSPM",
    platforms: [.iOS(.v10)], // 匹配OC Framework支持的最低版本
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MOBFoundationSPM",
            targets: ["MOBFoundationSPM"]),
    ],
    dependencies: [.package(url: "https://github.com/275919229/FlyVerifyCSDKSPM.git",from: "1.0.0")],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(name: "MOBFoundationSPMBin",
                      path: "Frameworks/MOBFoundation.xcframework"),
        .target(
            name: "MOBFoundationSPM",
            dependencies: ["MOBFoundationSPMBin",.product(name: "FlyVerifyCSDKSPM", package: "FlyVerifyCSDKSPM")],
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
                .linkedFramework("Security"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit"),
//                .unsafeFlags(["-ObjC"])
            ]),
        .testTarget(
            name: "MOBFoundationSPMTests",
            dependencies: ["MOBFoundationSPM"]
        ),
    ]
)
