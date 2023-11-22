import Foundation
import UIKit
import AdvertDetailModuleInterface

protocol AdvertDetailRouterInterface {
    
}

public final class AdvertDetailRouter : AdvertDetailModuleInterface {
    
    public init() {}
    
    public func advertDetailViewController(id: Int) -> UIViewController {
        let view = AdvertDetailViewController()
        print("AdvertDetailRouter \(id)")
        view.advertId = id
        return view
    }
    
}

extension AdvertDetailRouter : AdvertDetailRouterInterface {
    
}
    
