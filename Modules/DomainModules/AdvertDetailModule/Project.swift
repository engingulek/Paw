import ProjectDescription

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
             path: .relativeToRoot("Modules/DomainModules/AdvertDetailModule"))
]


let framworkTarget =  Target(
    name: "AdvertDetailModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.AdvertDetailModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: ["Resources"],
    dependencies: dependensies
)


let project = Project(name: "AdvertDetailModule",packages: [],targets:[framworkTarget,interfaceTarget])
