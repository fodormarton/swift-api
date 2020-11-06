// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageName = "SwiftAPI"
let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: packageName, targets: [packageName]),
    ],
    dependencies: [],
    targets: [
        .target( name: packageName, dependencies: []),
    ],
    swiftLanguageVersions: [.version("5.3")]
)
