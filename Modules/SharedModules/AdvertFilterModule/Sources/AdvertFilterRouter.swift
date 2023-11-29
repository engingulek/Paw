import UIKit
import AdoptingHomeModuleInterface
import AdvertFilterModuleInterface
import DependencyKit
import Foundation


protocol AdvertFilterRouterInterface {
    
}

public final class AdvertFilterRouter : AdvertFilterModuleInterface {
    public init() { }
    
    public func advertFilterController() -> UIViewController {
        let view = AdvertFilterController()
        let router = AdvertFilterRouter()
        let presenter = AdvertFilterPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
// AdvertFilterModuleInterfaceDelegate

extension AdvertFilterRouter : AdvertFilterRouterInterface {
   
}


