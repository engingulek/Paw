
import Foundation
import ProjectDescription

let framworkTarget = Target (
name: "CommonKit",
platform: .iOS,
product: .staticFramework,
bundleId: "com.ios.CommonKit",
deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
infoPlist: .default,
sources: "Sources/**"
)

let project = Project(name: "CommonKit",targets: [framworkTarget])
