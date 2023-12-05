
import Foundation
import UIKit
import AdoptingHomeModuleInterface
import AdvertDetailModuleInterface
import AdvertFilterModuleInterface
import DependencyKit
import ModelKit
protocol AdoptingRouterInterface {
    func toAdvertDetail(view: AdoptingHomeViewControllerInterfaca?,id:Int)
    func toAdvertFilter(
        view:AdoptingHomeViewControllerInterfaca?,
        adoptingAdverts:[AdoptingAdvert],
        delefate:AdvertFilterControllerDelegate?)
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
    func toAdvertFilter(
        view: AdoptingHomeViewControllerInterfaca?,
        adoptingAdverts: [ModelKit.AdoptingAdvert],
        delefate delegate: AdvertFilterControllerDelegate?) {
            @Dependency var advertFilterModuleInterface : AdvertFilterModuleInterface
            let viewController = advertFilterModuleInterface
                .advertFilterController(adoptingAdverts: adoptingAdverts, delegate: delegate)
            view?.pushViewControllerAble(viewController, animated: true)
    }
    func toAdvertDetail(view : AdoptingHomeViewControllerInterfaca?,id:Int) {
        @Dependency var advertDetailHomeModuleInterface : AdvertDetailModuleInterface
        let viewController = advertDetailHomeModuleInterface.advertDetailViewController(id:id)
        view?.pushViewControllerAble(viewController, animated: true)
    }
}




