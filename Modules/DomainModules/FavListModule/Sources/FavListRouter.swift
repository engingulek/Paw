import UIKit
import FavListModuleInterface

protocol FavListRouterInterface {
    
}

public final class FavListRouter : FavListModuleInterface {
    public init() {}
    public func favListViewController() -> UIViewController {
        let viewController = FavListViewController()
        return viewController
    }
}


extension FavListRouter : FavListRouterInterface {
    
}
