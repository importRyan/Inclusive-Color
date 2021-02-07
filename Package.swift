// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "InclusiveColor",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13),
        .tvOS(.v10),
        .watchOS(.v6)
    ],
    products: [
        
        // These two products have different uses.
        //
        // (1) Core tools are in "InclusiveColorTools". You can link this to production executables.
        //
        // (2) For unit testing targets only, "InclusiveColor" wraps the InclusiveColorTools' methods with custom assertions and error handling.
        //
        // Linking the latter XCTest-extending library to production targets will cause build errors. How Swift Package Manager chooses to handle XCTest extensions requires that little linking workaround and a symlink between the libraries within this package.

        .library(
            name: "InclusiveColor",
            targets: ["InclusiveColor"]),
        .library(
            name: "InclusiveColorTools",
            targets: ["InclusiveColorTools"]),
    ],
    targets: [
        .target(
            name: "InclusiveColor",
            dependencies: []),
        .target(
            name: "InclusiveColorTools",
            dependencies: []),
        .testTarget(
            name: "InclusiveColorTests",
            dependencies: ["InclusiveColor"]),
    ]
)
