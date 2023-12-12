
import UIKit
import CreateAdvertModuleInterface


public final class CreateAdvertRouter : CreateAdvertModuleInterface {
    public init() {}
    public func createAdvertViewController() -> UIViewController {
        let viewController = CreateAdvertViewController()
        return viewController
    }
    
    
}
