import ProjectDescription
import ProjectDescriptionHelpers

import Foundation


let interfaceTarget  = Target(
    name: "AccountActionModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.AccountActionModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []

)

let dependensies : [TargetDependency] = [
    .project(target: "AccountActionModuleInterface",
             path: .relativeToRoot("Modules/SharedModules/AccountActionModule")),
    .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
    snapKit,
    .project(target: "NetworkKit", path: .relativeToRoot("Kits/DomainKits/NetworkKit"))
]


let framworkTarget =  Target(
    name: "AccountActionModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.AccountActionModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: ["Resources"],
    dependencies: dependensies
)


let project = Project(name: "AccountActionModule",packages: [.snapKit],targets:[framworkTarget,interfaceTarget])
