
import ProjectDescription


/*let interfaceTarget = Target(
    name: "OnboardingModuleInterface",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.OnboardingModuleInterface",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    sources: "InterfaceSource/**")

let interfaceTargetDependency : TargetDependency =  Project(
    name: )
                              */*/

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
    .project(target: "DependencyKit", path: .relativeToRoot("Core/DependencyKit")),
    .project(target: "OnboardingModuleInterface", path: .relativeToRoot("Modules/DomainModules/OnboardingModule"))
   
]

let framworkTarget =  Target(
    name: "OnboardingModule",
    platform: .iOS,
    product: .staticFramework,
    bundleId: "com.ios.OnboardingModule",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .default,
    sources: "Sources/**",
    resources: ["Resources"],
    dependencies: dependensies
)



let project = Project(name: "OnboardingModule",packages: [],targets:[framworkTarget,interfaceTarget])
