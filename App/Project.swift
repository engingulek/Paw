import ProjectDescription



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
        .project(target: "DependencyKit", path: .relativeToRoot("Core/DependencyKit")),
        .project(target: "OnboardingModule", path: .relativeToRoot("Modules/DomainModules/OnboardingModule"))
    ]
)

let project = Project(name: "Paw",packages: [],targets: [appTarget])
