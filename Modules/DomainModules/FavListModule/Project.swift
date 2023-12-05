import ProjectDescription
import ProjectDescriptionHelpers


let interfaceTarget  = Target(
    name: "FavListModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.FavListModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []
)

let dependensies : [TargetDependency] = [
    .project(target: "DependencyKit", path: .relativeToRoot("Kits/CoreKits/DependencyKit")),
    .project(target: "FavListModuleInterface", path: .relativeToRoot("Modules/DomainModules/FavListModule")),
    .project(target: "AdvertDetailModuleInterface",
             path: .relativeToRoot("Modules/SharedModules/AdvertDetailModule")),
    .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
    snapKit,
    kingfisher
]

let framworkTarget =  Target(
    name: "FavListModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.FavListModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: ["Resources"],
    dependencies: dependensies
)

let project = Project(name: "FavListModule",packages: [.snapKit,.kingfisher],targets:[framworkTarget,interfaceTarget])

