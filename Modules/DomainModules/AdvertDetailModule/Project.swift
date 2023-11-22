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
             path: .relativeToRoot("Modules/DomainModules/AdvertDetailModule")),
    .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
    snapKit,
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

let unitTestTarget = Target(
    name: "AdvertDetailUnitTests",
    platform: .iOS,
    product: .unitTests,
    bundleId: "com.ios.AdvertDetailUnitTests",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: ["Tests/**"],
    dependencies: [
        .target(name: "AdvertDetailModule")
    ]
)



let project = Project(name: "AdvertDetailModule",packages: [.snapKit],targets:[unitTestTarget,framworkTarget,interfaceTarget])
