
import Foundation
import UIKit
import AdoptingHomeModuleInterface
import AdvertDetailModuleInterface
import DependencyKit

protocol AdoptingRouterInterface {
    func toAdvertDetail(view: AdoptingHomeViewControllerInterfaca?,id:Int)
}

public final class AdoptingRouter : AdoptingHomeModuleInterface {
    public init() {}
    public func adoptingHomeViewController() -> UIViewController {
        let view = AdoptingHomeViewController()
        let router = AdoptingRouter()
        let presenter = AdoptinHomePresenter(router: router, view: view)
        view.presenter = presenter
        print("Test")
        return view
    }
}

extension AdoptingRouter : AdoptingRouterInterface {
    func toAdvertDetail(view : AdoptingHomeViewControllerInterfaca?,id:Int) {
        print("AdoptingRouter \(id)")
        
        @Dependency var advertDetailHomeModuleInterface : AdvertDetailModuleInterface
        let viewController = advertDetailHomeModuleInterface.advertDetailViewController(id:id)
        
        view?.pushViewControllerAble(viewController, animated: true)
        
    }
    
    
}
