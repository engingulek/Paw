import Foundation
import UIKit
import AdvertDetailModuleInterface
import DependencyKit
protocol AdvertDetailRouterInterface {
}

public final class AdvertDetailRouter : AdvertDetailModuleInterface {
    
    public init() {}
    
    public func advertDetailViewController(id: Int) -> UIViewController {
        let view = AdvertDetailViewController()
        let router = AdvertDetailRouter()
        let inteeactor = AdvertDetailService()
        let presenter = AdvertDetailPresenter(
            router: router,
            view: view,
            interactor:inteeactor )
        view.advertId = id
        view.presenter =  presenter
        return view
    }
    
}

extension AdvertDetailRouter : AdvertDetailRouterInterface {
}
    
