// swift-tools-version:5.9
//
// GENERATED. This manifest is rendered by scripts/assemble-swift-package.sh in
// https://github.com/Offline-Protocol/offline-protocol-sdk from
// bindings/swift/Package.swift.template, and every source beside it is a copy
// of a file in that repository. Change it there.
//
// Tools version 5.9 on purpose. It selects the Swift 5 language mode, which
// the generated bindings and the storage providers need: both hold state
// behind their own locks in ways Swift 6's checking refuses.

import PackageDescription

let package = Package(
    name: "OfflineProtocolSDK",
    platforms: [
        // The pod's deployment target, read out of the podspec when this
        // manifest was rendered.
        .iOS("13.0")
    ],
    products: [
        .library(name: "OfflineProtocolSDK", targets: ["OfflineProtocolSDK"])
    ],
    targets: [
        // The Rust library. The name is the clang module the generated Swift
        // imports, which is also the directory its headers sit in.
        .binaryTarget(
            name: "offline_protocolFFI",
            url: "https://github.com/Offline-Protocol/offline-protocol-sdk/releases/download/v0.29.0/offline-protocol-0.29.0-swiftpm-xcframework.zip",
            checksum: "f2b85225d771d2b9f3f56ffe81e7d0bcdb6b965b86f3f121d11261e101ddcefa"
        ),
        .target(
            name: "OfflineProtocolSDK",
            dependencies: ["offline_protocolFFI"],
            path: "Sources/OfflineProtocolSDK",
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        ),
        .testTarget(
            name: "OfflineProtocolSDKTests",
            dependencies: ["OfflineProtocolSDK"],
            path: "Tests/OfflineProtocolSDKTests"
        )
    ]
)
