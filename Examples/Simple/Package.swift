// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "Simple",
  platforms: [
    .macOS(.v12),
    .iOS(.v17),
  ],
  dependencies: [
    .package(path: "../..")
  ],
  targets: [
    .executableTarget(
      name: "Simple",
      dependencies: [
        "Data2gRPC"
      ]
    )
  ]
)
