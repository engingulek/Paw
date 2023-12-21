
import Foundation
import AccountActionModuleInterface
import UIKit

public final class AccountActionRouter : AccountActionModuleInterface {
    public init() {}
    public func accountActionViewController() -> UIViewController {
        let view = AccountActionViewController()
        return view
    }
    
    
}
