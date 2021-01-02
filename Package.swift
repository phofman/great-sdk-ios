// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "GreatSDK",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "GreatSDK", type: .dynamic, targets: ["GreatSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/yahoojapan/SwiftyXMLParser/", from: "5.3.0"),
    ],
    targets: [
        .target(
            name: "GreatSDK",
            dependencies: ["SwiftyXMLParser"],
            path: "GreatSDK/GreatSDK",
            exclude: ["Info.plist"]),
        .testTarget(
            name: "GreatSDKTests",
            dependencies: ["GreatSDK"],
            path: "GreatSDK/GreatSDKTests",
            exclude: ["Info.plist"])
    ]
)
