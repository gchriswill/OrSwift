// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Or",
    products: [
        .library(
            name: "Or",
            targets: ["Or"]),
    ],
    targets: [
        .target(
            name: "Or"),
        .testTarget(
            name: "OrTests",
            dependencies: ["Or"]),
    ]
)
