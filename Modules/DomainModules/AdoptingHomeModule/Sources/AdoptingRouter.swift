
import Foundation
import UIKit
import AdoptingHomeModuleInterface
import AdvertDetailModuleInterface
import AdvertFilterModuleInterface
import DependencyKit

protocol AdoptingRouterInterface {
    func toAdvertDetail(view: AdoptingHomeViewControllerInterfaca?,id:Int)
    func toAdvertFilter(view:AdoptingHomeViewControllerInterfaca?)
}

public final class AdoptingRouter : AdoptingHomeModuleInterface {
    public init() {}
    public func adoptingHomeViewController() -> UIViewController {
        let view = AdoptingHomeViewController()
        let router = AdoptingRouter()
        let interactor = AdoptingHomeService()
        let presenter = AdoptinHomePresenter(router: router, view: view,interactor: interactor)
        view.presenter = presenter
        return view
    }
}

extension AdoptingRouter : AdoptingRouterInterface {
 
    func toAdvertDetail(view : AdoptingHomeViewControllerInterfaca?,id:Int) {
        @Dependency var advertDetailHomeModuleInterface : AdvertDetailModuleInterface
        let viewController = advertDetailHomeModuleInterface.advertDetailViewController(id:id)
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    func toAdvertFilter(
        view: AdoptingHomeViewControllerInterfaca?) {
            @Dependency var advertFilterModuleInterface : AdvertFilterModuleInterface
            let viewController = advertFilterModuleInterface
                .advertFilterController()
            view?.pushViewControllerAble(viewController, animated: true)
    }
}



