// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Groundwork",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Groundwork",
            targets: ["Groundwork"]),
    ],
    dependencies: [
        .package(name: "SnapKit", url: "https://github.com/SnapKit/SnapKit", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "Groundwork",
            dependencies: ["SnapKit"]),
        .testTarget(
            name: "GroundworkTests",
            dependencies: ["Groundwork"]),
    ]
)
