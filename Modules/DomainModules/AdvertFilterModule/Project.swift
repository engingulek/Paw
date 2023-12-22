
import ProjectDescription
import ProjectDescriptionHelpers


let interfaceTarget  = Target(
    name: "AdvertFilterModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.AdvertFilterModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []
)


let dependensies : [TargetDependency] = [
    .project(
        target: "AdvertFilterModuleInterface",
        path: .relativeToRoot("Modules/DomainModules/AdvertFilterModule")),
    .project(target: "AdoptingHomeModuleInterface",
             path: .relativeToRoot("Modules/DomainModules/AdoptingHomeModule")),
    .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
    snapKit,
    .project(target: "ModelKit", path: .relativeToRoot("Kits/SharedKits/ModelKit"))

]

let framworkTarget =  Target(
    name: "AdvertFilterModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.AdvertFilterModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: ["Resources"],
    dependencies: dependensies
)

let project = Project(name: "AdvertFilterModule",packages: [.snapKit],targets:[framworkTarget,interfaceTarget])
