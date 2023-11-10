
import Foundation
import UIKit
import AdoptingHomeModuleInterface

protocol AdoptingRouterInterface {
    
}

public final class AdoptingRouter : AdoptingHomeModuleInterface {
    public init() {}
    public func adoptingHomeViewController() -> UIViewController {
        let view = AdoptingHomeViewController()
        print("Test")
        return view
    }
}

extension AdoptingRouter : AdoptingRouterInterface {
    
}
