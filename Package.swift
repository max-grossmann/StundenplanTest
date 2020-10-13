// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftWindowsTest1",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.10.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftWindowsTest1",
            dependencies: ["OpenCombine",
                            .product(name: "OpenCombineDispatch", package: "OpenCombine"),
                            .product(name: "OpenCombineFoundation", package: "OpenCombine")]),
        .testTarget(
            name: "SwiftWindowsTest1Tests",
            dependencies: ["SwiftWindowsTest1"]),
    ]
)
