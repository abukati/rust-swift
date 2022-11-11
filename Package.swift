// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
  name: "ShoppingBackend",
  platforms: [
    .iOS(*)
  ],
  products: [
    .library(
      name: "ShoppingBackend",
      targets: ["ShoppingBackend"]
    )
  ],
  targets: [
    .target(
      name: "ShoppingBackend",
      dependencies: ["ShoppingBackend"]
    )
    .binaryTarget(
      name: "ShoppingBackend",
      path: "./RustShopping.xcframework",
      url: "https://github.com/abukati/rust-swift",
      checksum: "22913f75ea6b98ab74b4757d9c0692331716050272da7731e537218d8382cc82"
    )
    // .testTarget(
    //   name: "RustShopping",
    //   dependencies: ["RustShopping"]
    // )
  ]
)