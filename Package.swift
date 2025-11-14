// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "swift-stm32c011",
    products: [
        .library(name: "STM32C011", targets: ["STM32C011", "Support"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-mmio", from: "0.1.1"),
        .package(url: "https://github.com/xtremekforever/swift-cortex-m", branch: "feature/update-mmio"),
    ],
    targets: [
        .target(
            name: "STM32C011",
            dependencies: [
                .product(name: "MMIO", package: "swift-mmio"),
                .product(name: "CortexM", package: "swift-cortex-m"),
                "Support",
            ]
        ),
        .target(name: "Support"),
    ]
)
