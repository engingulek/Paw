import ProjectDescription
import ProjectDescriptionHelpers



let appTarget = Target(
    name: "Paw",
    platform: .iOS,
    product: .app,
    bundleId: "com.ios.app",
    deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
    infoPlist: .extendingDefault(with: ["UILaunchStoryboardName": "LaunchScreen"]),
    sources: "Sources/**",
    resources:"Resources/**",
    dependencies: [
        .project(target: "DependencyKit", path: .relativeToRoot("Kits/CoreKits/DependencyKit")),
        .project(target: "CommonKit", path: .relativeToRoot("Kits/SharedKits/CommonKit")),
        
        .project(target: "OnboardingModule", path: .relativeToRoot("Modules/DomainModules/OnboardingModule")),
        .project(target: "AdoptingHomeModule", path: .relativeToRoot("Modules/DomainModules/AdoptingHomeModule"))
    ]
)

let project = Project(name: "Paw",packages: [.snapKit],targets: [appTarget])
