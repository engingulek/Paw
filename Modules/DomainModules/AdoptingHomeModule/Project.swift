

import ProjectDescription
import ProjectDescriptionHelpers



let interfaceTarget  = Target(
    name: "AdoptingHomeModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.AdoptingHomeModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []
)

let dependensies : [TargetDependency] = [
    .project(target: "DependencyKit", path: .relativeToRoot("Kits/CoreKits/DependencyKit")),
    .project(target: "AdoptingHomeModuleInterface",
             path: .relativeToRoot("Modules/DomainModules/AdoptingHomeModule")),
    .project(
        target: "AdvertFilterModuleInterface",
        path: .relativeToRoot("Modules/SharedModules/AdvertFilterModule")),
    .project(target: "AdvertDetailModuleInterface",
             path: .relativeToRoot("Modules/DomainModules/AdvertDetailModule")),
    .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
    snapKit,
    .project(target: "NetworkKit", path: .relativeToRoot("Kits/DomainKits/NetworkKit")),
    kingfisher
    
]

let framworkTarget =  Target(
    name: "AdoptingHomeModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.AdoptingHomeModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: ["Resources/Assets.xcassets/**"],
    dependencies: dependensies
)





let project = Project(name: "AdoptingHomeModule",packages: [.snapKit,.kingfisher],targets:[framworkTarget,interfaceTarget])
