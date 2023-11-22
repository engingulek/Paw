
import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let networkKit = Target(
    name: "NetworkKit",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.NetworkKit",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    sources: "Sources/**",
    dependencies: [alamofire]
)

let project = Project(
    name: "NetworkKit",
    packages: [.alamofire],
    targets: [networkKit])
