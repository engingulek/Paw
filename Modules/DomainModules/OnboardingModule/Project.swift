
import ProjectDescription
import ProjectDescriptionHelpers



let interfaceTarget  = Target(
    name: "OnboardingModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.OnboardingModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "InterfaceSource/**",
    dependencies: []

)

let dependensies : [TargetDependency] = [
    .project(target: "DependencyKit", path: .relativeToRoot("Kits/CoreKits/DependencyKit")),
    .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
    .project(target: "OnboardingModuleInterface", path: .relativeToRoot("Modules/DomainModules/OnboardingModule")),
    .project(target: "TabbarModuleInterface", path: .relativeToRoot("Modules/DomainModules/TabbarModule")),
    snapKit
]

let framworkTarget =  Target(
    name: "OnboardingModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.OnboardingModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: ["Resources/Assets.xcassets/**"],
    dependencies: dependensies
)





let project = Project(name: "OnboardingModule",packages: [.snapKit],targets:[framworkTarget,interfaceTarget])
