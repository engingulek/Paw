import Foundation
import ChatModuleInterface
import UIKit

public final class ChatRouter : ChatModuleInterface {
    public init() { }
    public func chatViewController() -> UIViewController {
        let view = ChatViewController()
        return view
    }
}


