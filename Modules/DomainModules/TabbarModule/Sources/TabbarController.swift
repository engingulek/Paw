
import UIKit
import AdoptingHomeModuleInterface
import DependencyKit
import FavListModuleInterface
import MessageUserListModuleInterface
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
        
        //MARK: - MessageUserListContrller
        @Dependency var messageUserLisrModuleInterface : MessageUserListInterfaceModule
        let mulVC = messageUserLisrModuleInterface.messageUserListController()
        mulVC.tabBarItem.image = UIImage(systemName: "message")
        mulVC.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        
        
        setViewControllers([hvc,fvc,mulVC], animated: true)
    }
}


