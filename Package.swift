// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "vapor-teams",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(name: "Example", targets: ["Example"]),
        .library(name: "VaporTeams", targets: ["VaporTeams"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.77.0"),
        .package(url: "https://github.com/hiimtmac/chat-kit.git", branch: "main"),
    ],
    targets: [
        .executableTarget(name: "Example", dependencies: [
            .target(name: "VaporTeams"),
            .product(name: "TeamsKit", package: "chat-kit"),
            .product(name: "Vapor", package: "vapor")
        ]),
        .target(name: "VaporTeams", dependencies: [
            .product(name: "TeamsKit", package: "chat-kit"),
            .product(name: "Vapor", package: "vapor")
        ]),
        .testTarget(name: "TeamsKitTests", dependencies: [
            .product(name: "XCTVapor", package: "vapor")
        ])
    ]
)
