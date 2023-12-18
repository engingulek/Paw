import ProjectDescription
import ProjectDescriptionHelpers


let interfaceTarget  = Target(
    name: "CreateAdvertListModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.CreateAdvertListModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []
)


let dependensies : [TargetDependency] = [
    .project(target: "DependencyKit", path: .relativeToRoot("Kits/CoreKits/DependencyKit")),
    .project(target: "CreateAdvertListModuleInterface", path: .relativeToRoot("Modules/DomainModules/CreateAdvertListModule")),
    .project(target: "AdvertDetailModuleInterface",
             path: .relativeToRoot("Modules/SharedModules/AdvertDetailModule")),
    .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
    .project(target: "NetworkKit", path: .relativeToRoot("Kits/DomainKits/NetworkKit")),
    snapKit,
    kingfisher
]

let framworkTarget =  Target(
    name: "CreateAdvertListModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.CreateAdvertListModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: ["Resources"],
    dependencies: dependensies
)

let project = Project(name: "CreateAdvertListModule",packages: [.snapKit,.kingfisher],targets:[framworkTarget,interfaceTarget])



