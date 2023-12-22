
import UIKit
import AdoptingHomeModuleInterface
import DependencyKit
import FavListModuleInterface
import CreateAdvertModuleInterface
import CreateAdvertListModuleInterface


final class TabbarController : UITabBarController {
   
    //MARK: - AdoptingHomeModuleInterface
    private lazy var adoptingHomeViewController : UIViewController = {
        @Dependency  var adoptingHomeModuleInterface : AdoptingHomeModuleInterface
        let vc = UINavigationController(rootViewController: adoptingHomeModuleInterface.adoptingHomeViewController())
        vc.tabBarItem.image = UIImage(systemName: "house")
        vc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        return vc
    }()
    
    //MARK: - FavListModuleInterface
    private lazy var favListViewController : UIViewController = {
        @Dependency var favListModuleInterface : FavListModuleInterface
        let vc = UINavigationController(rootViewController: favListModuleInterface.favListViewController())
        vc.tabBarItem.image = UIImage(systemName: "heart")
        vc.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        return vc
    }()
    
    //MARK: - CreateAdvertModuleInterface
    private lazy var createAdvertViewController : UIViewController = {
        @Dependency var createAdvertViewController : CreateAdvertModuleInterface
        let vc = UINavigationController(rootViewController: createAdvertViewController.createAdvertViewController())
        vc.tabBarItem.image = UIImage(systemName: "plus")
        vc.tabBarItem.selectedImage = UIImage(systemName: "plus")
        return vc
    }()
    
    //MARK: - CreateAdvertListModuleInterface
    private lazy var createAdvertListViewController: UIViewController = {
        @Dependency var createAdvertListViewController : CreateAdvertListModuleInterface
        let vc = UINavigationController (rootViewController: createAdvertListViewController.createAdvertListViewController())
        vc.tabBarItem.image = UIImage(systemName: "list.dash")
        vc.tabBarItem.selectedImage = UIImage(systemName: "list.dash")
        return vc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            adoptingHomeViewController,
            favListViewController,
            createAdvertViewController,
            createAdvertListViewController
        ]
    }
}
