
import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let interfaceTarget  = Target(
    name: "MessageUserListModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.MessageUserListModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []

)

let dependensies :  [TargetDependency] = [
    .project(
        target: "MessageUserListModuleInterface",
        path: .relativeToRoot("Modules/SharedModules/MessageUserListModule")),
    .project(
        target: "ChatModuleInterface",
        path: .relativeToRoot("Modules/SharedModules/ChatModule")),
    .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
    snapKit,
    kingfisher,
    .project(target: "NetworkKit", path: .relativeToRoot("Kits/DomainKits/NetworkKit"))
]

let framworkTarget =  Target(
    name: "MessageUserListModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.MessageUserListModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: [],
    dependencies: dependensies
)

let project = Project(
    name: "MessageUserListModule",
    packages: [.snapKit,.kingfisher],
targets: [framworkTarget,interfaceTarget])

