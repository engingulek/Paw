
import Foundation
import ProjectDescription
import ProjectDescriptionHelpers
let interfaceTarget  = Target(
    name: "ChatModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.ChatModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []
)

let dependecies : [TargetDependency] = [
    .project(
        target: "ChatModuleInterface",
        path: .relativeToRoot("Modules/SharedModules/ChatModule")),
    .project(target: "NetworkKit", path: .relativeToRoot("Kits/DomainKits/NetworkKit")),
    messageKit
]

let framworkTarget =  Target(
    name: "ChatModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.ChatModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: [],
    dependencies: dependecies
)

let project = Project(
    name: "ChatModule",
    packages: [.messageKit],
targets: [framworkTarget,interfaceTarget])

