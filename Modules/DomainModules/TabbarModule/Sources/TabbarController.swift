
import UIKit
import AdoptingHomeModuleInterface
import DependencyKit
import FavListModuleInterface
final class TabbarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        @Dependency var adoptingHomeModuleInterface : AdoptingHomeModuleInterface
        //MARK: AdoptingHomeViewController
        let hvc = UINavigationController(rootViewController: adoptingHomeModuleInterface.adoptingHomeViewController() )
        hvc.tabBarItem.image = UIImage(systemName: "house")
        hvc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        //MARK: FavListViewController
        @Dependency var favListModuleInterface : FavListModuleInterface
        let fvc = UINavigationController(rootViewController: favListModuleInterface.favListViewController())
        fvc.tabBarItem.image = UIImage(systemName: "heart")
        fvc.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        
        setViewControllers([hvc,fvc], animated: true)
    }
}


