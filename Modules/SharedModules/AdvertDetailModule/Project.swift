import ProjectDescription
import ProjectDescriptionHelpers
let interfaceTarget  = Target(
    name: "AdvertDetailModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.AdvertDetailModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []

)

let dependensies : [TargetDependency] = [
    .project(target: "AdvertDetailModuleInterface",
             path: .relativeToRoot("Modules/SharedModules/AdvertDetailModule")),
    .project(
        target: "ChatModuleInterface",
        path: .relativeToRoot("Modules/SharedModules/ChatModule")),
    .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
    snapKit,
    kingfisher,
    .project(target: "NetworkKit", path: .relativeToRoot("Kits/DomainKits/NetworkKit"))
]


let framworkTarget =  Target(
    name: "AdvertDetailModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.AdvertDetailModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: ["Resources/Assets.xcassets/**"],
    dependencies: dependensies
)





let project = Project(name: "AdvertDetailModule",packages: [.snapKit,.kingfisher],targets:[framworkTarget,interfaceTarget])
