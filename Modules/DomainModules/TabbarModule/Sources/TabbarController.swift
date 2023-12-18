
import UIKit
import AdoptingHomeModuleInterface
import DependencyKit
import FavListModuleInterface
import CreateAdvertModuleInterface
import CreateAdvertListModuleInterface


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
        
        //MARK: CreateAdvertViewController
        @Dependency var createAdvertViewController : CreateAdvertModuleInterface
        let cavc = UINavigationController(rootViewController: createAdvertViewController.createAdvertViewController())
        cavc.tabBarItem.image = UIImage(systemName: "plus")
        cavc.tabBarItem.selectedImage = UIImage(systemName: "plus")
        
        //MARK: CreateAdvertListViewController
        @Dependency var createAdvertListViewController : CreateAdvertListModuleInterface
        let calvc = UINavigationController (rootViewController: createAdvertListViewController.createAdvertListViewController())
        calvc.tabBarItem.image = UIImage(systemName: "list.dash")
        calvc.tabBarItem.selectedImage = UIImage(systemName: "list.dash")

        setViewControllers([hvc,cavc,fvc,calvc], animated: true)
    }
}


