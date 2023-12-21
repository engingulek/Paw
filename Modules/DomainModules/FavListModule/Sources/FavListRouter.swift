import UIKit
import AdvertDetailModuleInterface
import FavListModuleInterface
import DependencyKit

protocol FavListRouterInterface {
    func toAdvertDetail(view:FavListViewControllerInterface?,id:Int)
}

public final class FavListRouter : FavListModuleInterface {
    public init() {}
    public func favListViewController() -> UIViewController {
        let viewController = FavListViewController()
        let router = FavListRouter()
        let interactor = FavAdvertsInteractor()
        let presenter = FavListPresenter(view: viewController,router: router,interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}


extension FavListRouter : FavListRouterInterface {
    func toAdvertDetail(view:FavListViewControllerInterface?,id:Int) {
        @Dependency var advertDetailHomeModuleInterface : AdvertDetailModuleInterface
        let viewController = advertDetailHomeModuleInterface.advertDetailViewController(id:id)
        view?.pushViewControllerAble(viewController, animated: true)
    }
}
