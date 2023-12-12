


import ProjectDescription
import ProjectDescriptionHelpers



let interfaceTarget  = Target(
    name: "CreateAdvertModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.CreateAdvertModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []
)

let dependensies : [TargetDependency] = [
    .project(target: "DependencyKit", path: .relativeToRoot("Kits/CoreKits/DependencyKit")),
    .project(target: "CreateAdvertModuleInterface",
             path: .relativeToRoot("Modules/DomainModules/CreateAdvertModule")),
    .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
    snapKit,
    .project(target: "NetworkKit", path: .relativeToRoot("Kits/DomainKits/NetworkKit")),
    kingfisher,
    .project(target: "ModelKit", path: .relativeToRoot("Kits/SharedKits/ModelKit"))
    
    
]

let framworkTarget =  Target(
    name: "CreateAdvertModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.CreateAdvertModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: [""],
    dependencies: dependensies
)





let project = Project(name: "CreateAdvertModule",packages: [.snapKit,.kingfisher],targets:[framworkTarget,interfaceTarget])

