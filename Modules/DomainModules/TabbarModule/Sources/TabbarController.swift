
import UIKit
import AdoptingHomeModuleInterface
import DependencyKit
final class TabbarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        @Dependency var adoptingHomeModuleInterface : AdoptingHomeModuleInterface
        let hvc = UINavigationController(rootViewController: adoptingHomeModuleInterface.adoptingHomeViewController() )
        
        hvc.tabBarItem.image = UIImage(systemName: "house")
        hvc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        setViewControllers([hvc], animated: true)
    }
}


