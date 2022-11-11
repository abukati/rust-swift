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
      url: "https://github.com/abukati/rust-swift/bundle.zip",
      checksum: "97d6eb3425c3bcab090900cce385d00113206187b98b190ba74f1b27ed4f7150"
    )
    // .testTarget(
    //   name: "RustShopping",
    //   dependencies: ["RustShopping"]
    // )
  ]
)