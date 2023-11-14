import Foundation
import UIKit
import AdvertDetailModuleInterface

protocol AdvertDetailRouterInterface {
    
}

public final class AdvertDetailRouter : AdvertDetailModuleInterface {
    public init() {}
    public func advertDetailViewController() -> UIViewController {
        let view = AdvertDetailViewController()
        return view
    }
}

extension AdvertDetailRouter : AdvertDetailRouterInterface {
    
}
    
