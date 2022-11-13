// swift-tools-version:5.3

import PackageDescription
import Foundation

let package = Package(
        name: "ShopScraper",
        platforms: [
            .iOS(.v14),
            .macOS(.v11)
        ],
        products: [
            .library(
                name: "ShoppingBackend",
                targets: ["ShoppingBackend"]),
        ],
        targets: [
//            .target(
//                name: "ShopScraper",
//                dependencies: ["ShoppingBackend"]),
            .binaryTarget(
                name: "ShoppingBackend",
                url: "https://github.com/abukati/rust-swift/archive/refs/tags/pub.zip",
                checksum: "41a314d6d8549c511764acdf439d5bce58dbac8b28031dae31afafb21587f831"),
            .testTarget(
                name: "ShoppingBackendTests",
                dependencies: ["ShoppingBackend"]),
        ]
)
