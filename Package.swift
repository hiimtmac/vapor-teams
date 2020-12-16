// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "teams-kit",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "Example", targets: ["Example"]),
        .library(name: "VaporTeams", targets: ["VaporTeams", "TeamsKit"]),
        .library(name: "TeamsKit", targets: ["TeamsKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-crypto.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "Example", dependencies: [
            .target(name: "VaporTeams"),
            .target(name: "TeamsKit"),
            .product(name: "Vapor", package: "vapor")
        ]),
        .target(name: "VaporTeams", dependencies: [
            .target(name: "TeamsKit"),
            .product(name: "Vapor", package: "vapor")
        ]),
        .target(name: "TeamsKit", dependencies: [
            .product(name: "Crypto", package: "swift-crypto")
        ]),
        .testTarget(name: "TeamsKitTests", dependencies: [
            "TeamsKit",
            .product(name: "XCTVapor", package: "vapor")
        ])
    ]
)
