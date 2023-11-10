

import ProjectDescription




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
    .project(target: "AdoptingHomeModuleInterface",
             path: .relativeToRoot("Modules/DomainModules/AdoptingHomeModule"))
]

let framworkTarget =  Target(
    name: "AdoptingHomeModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.AdoptingHomeModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: ["Resources"],
    dependencies: dependensies
)



let project = Project(name: "AdoptingHomeModule",packages: [],targets:[framworkTarget,interfaceTarget])
