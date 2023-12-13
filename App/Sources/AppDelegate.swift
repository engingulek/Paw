
import UIKit
import DependencyKit
import OnboardingModuleInterface
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        let dependencyRegister = DependencyRegister()
        dependencyRegister.registerDependecies()
        
        @Dependency var onboardModuleInterface : OnboardingModuleInterfac
        let view = onboardModuleInterface.onboardingViewController()
        window?.rootViewController = UINavigationController(rootViewController: view)
        
        window?.makeKeyAndVisible()
        return true
    }
}
