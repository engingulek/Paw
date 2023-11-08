
import Foundation
import ProjectDescription
import ProjectDescriptionHelpers





let dependencyKit = Target(
    name: "DependencyKit",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.DependencyKit",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    sources: "Sources/**",
    dependencies: []

)

let project = Project(name: "DependencyKit",targets: [dependencyKit])
