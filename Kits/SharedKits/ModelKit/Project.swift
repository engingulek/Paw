
import Foundation
import ProjectDescription

let framworkTarget = Target (
name: "ModelKit",
platform: .iOS,
product: .staticFramework,
bundleId: "com.ios.ModelKit",
deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
infoPlist: .default,
sources: "Sources/**"
)

let project = Project(name: "ModelKit",targets: [framworkTarget])
