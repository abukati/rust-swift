// swift-tools-version:5.3

import PackageDescription
import Foundation

let package = Package(
        name: "ShoppingBackend",
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
            .target(
                name: "ShoppingBackend",
                dependencies: ["ShopScraper"]),
            .binaryTarget(
                name: "ShoppingBackend",
                url: "https://github.com/abukati/rust-swift/blob/main/bundle.zip",
                checksum: "22913f75ea6b98ab74b4757d9c0692331716050272da7731e537218d8382cc82"),
            .testTarget(
                name: "ShoppingBackendTests",
                dependencies: ["ShoppingBackend"]),
        ]
)
