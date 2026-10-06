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
            url: "https://github.com/Offline-Protocol/offline-protocol-sdk/releases/download/v0.28.0/offline-protocol-0.28.0-swiftpm-xcframework.zip",
            checksum: "56f6d0af6c30749c274c9b21a7c6a363f1d7438531daa9f54518a0f0becd0fc4"
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
