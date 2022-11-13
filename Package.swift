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
                name: "ShopScraper",
                targets: ["ShopScraper"]),
        ],
        targets: [
//            .target(
//                name: "ShopScraper",
//                dependencies: ["ShoppingBackend"]),
            .binaryTarget(
                name: "ShopScraper",
                url: "https://github.com/abukati/rust-swift/bundle.zip",
                checksum: "22913f75ea6b98ab74b4757d9c0692331716050272da7731e537218d8382cc82"),
            .testTarget(
                name: "ShoppingBackendTests",
                dependencies: ["ShoppingBackend"]),
        ]
)
