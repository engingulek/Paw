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
        .project(
            target: "OnboardingModule",
            path: .relativeToRoot("Modules/DomainModules/OnboardingModule")),
        
        .project(
            target: "TabbarModule",
            path: .relativeToRoot("Modules/DomainModules/TabbarModule")),
        
      .project(
            target: "AdoptingHomeModule",
            path: .relativeToRoot("Modules/DomainModules/AdoptingHomeModule")),
        
         .project(
            target: "FavListModule",
            path: .relativeToRoot("Modules/DomainModules/FavListModule")),
        
        .project(
            target: "AdvertDetailModule",
            path: .relativeToRoot("Modules/SharedModules/AdvertDetailModule")),
        
        .project(
            target: "AdvertFilterModule",
            path:.relativeToRoot("Modules/DomainModules/AdvertFilterModule")),
        
        .project(
            target: "CreateAdvertModule",
            path: .relativeToRoot("Modules/DomainModules/CreateAdvertModule")),
        
        .project(
            target: "CreateAdvertListModule",
            path: .relativeToRoot("Modules/DomainModules/CreateAdvertListModule"))
        
    ]
)

let project = Project(name: "Paw",packages: [],targets: [appTarget])
