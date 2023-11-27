import UIKit
import AdvertFilterModuleInterface

import Foundation


public final class AdvertFilterRouter : AdvertFilterModuleInterface {
    
    public init() { }
    public func advertFilterController() -> UIViewController {
        let view = AdvertFilterController()
      
        return view
    }
}
