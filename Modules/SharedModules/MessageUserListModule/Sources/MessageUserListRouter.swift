

import Foundation
import UIKit
import MessageUserListModuleInterface

public final class MessageUserListRouter : MessageUserListInterfaceModule {
    public init(){}
    public func messageUserListController() -> UIViewController {
        let view = MessageUserListControlller()
        return view
    }
}
