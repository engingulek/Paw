
import Foundation
import CreateAdvertListModuleInterface
import UIKit

protocol CreateAdvertListRouterInterface {
    
}

public final class CreateAdvertListRouter : CreateAdvertListModuleInterface {
    public init() {}
    public func createAdvertListViewController() -> UIViewController {
        let view = CreateAdvertListViewController()
        return view
    }
    
    
}

extension CreateAdvertListRouter : CreateAdvertListRouterInterface {
    
}
