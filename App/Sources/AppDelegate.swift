
import UIKit
import DependencyKit
import OnboardingModuleInterface

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let dependencyRegister = DependencyRegister()
        dependencyRegister.registerDependecies()
        
        @Dependency var onboardingRouter : OnboardingModuleInterfac
        let view = onboardingRouter.onboardingViewController()
        window?.rootViewController = UINavigationController(rootViewController: view)
        
        window?.makeKeyAndVisible()
        return true
    }
}
