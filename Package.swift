// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WrapperSPM",
    platforms: [
        .macOS(.v10_13), .macCatalyst(.v13), .iOS(.v12), .tvOS(.v12), .watchOS(.v4), .custom("visionos", versionString: "1.0")
    ],
    products: [
        // Объединённая обёртка
        .library(
            name: "WrapperSPM",
            type: .dynamic,
            targets: ["WrapperSPM"]
        )
    ],
    dependencies: [
        // Подключение всех библиотек как зависимости
        .package(url: "https://github.com/airsidemobile/JOSESwift", from: "2.4.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.8.2"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.19.3"),
        .package(url: "https://github.com/roberthein/TinyConstraints.git", from: "4.0.2")
    ],
    targets: [
        // Таргет для объединённой обёртки
        .target(
            name: "WrapperSPM",
            dependencies: [
                .product(name: "JOSESwift", package: "JOSESwift"),
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                .product(name: "SDWebImage", package: "SDWebImage"),
                .product(name: "TinyConstraints", package: "TinyConstraints")
            ],
            path: "Sources/WrapperSPM"
        )
    ],
    swiftLanguageModes: [.v5]
)

// Поддержка DocC для документации
#if swift(>=5.6)
package.dependencies.append(
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0")
)
#endif
