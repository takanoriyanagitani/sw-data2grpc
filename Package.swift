// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "Data2gRPC",
  platforms: [
  	.macOS(.v12),
	.iOS(.v17),
  ],
  products: [
    .library(
      name: "Data2gRPC",
      targets: ["Data2gRPC"])
  ],
  dependencies: [
    .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.22.0"),
    .package(url: "https://github.com/apple/swift-nio.git", from: "2.64.0"),
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0")
  ],
  targets: [
    .target(
      name: "DataProto",
      dependencies: [
        .product(name: "GRPC", package: "grpc-swift")
      ]
    ),
    .target(
      name: "Data2gRPC",
      dependencies: [
        .product(name: "GRPC", package: "grpc-swift"),
        .product(name: "NIOCore", package: "swift-nio"),
		"DataProto"
      ]
    ),
    .testTarget(
      name: "Data2gRPCTests",
      dependencies: ["Data2gRPC"]),
  ]
)
