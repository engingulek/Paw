import ProjectDescription

let interfaceTarget  = Target(
    name: "TabbarModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.TabbarModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []

)

let dependensies : [TargetDependency] = [
    //.project(target: "DependencyKit", path: .relativeToRoot("Kits/CoreKits/DependencyKit")),
    .project(target: "TabbarModuleInterface",
             path: .relativeToRoot("Modules/DomainModules/TabbarModule")),
    .project(target: "AdoptingHomeModuleInterface", path: .relativeToRoot("Modules/DomainModules/AdoptingHomeModule")),
]

let framworkTarget =  Target(
    name: "TabbarModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.TabbarModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: nil,
    dependencies: dependensies
)



let project = Project(name: "TabbarModule",packages: [],targets:[framworkTarget,interfaceTarget])
