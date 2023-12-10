

import Foundation
import UIKit
import MessageUserListModuleInterface
import DependencyKit
import ChatModuleInterface
protocol MessageUserListRouterInterface {
    func toChat(view:MessageUserListControlllerInterface?)
}

public final class MessageUserListRouter : MessageUserListInterfaceModule {
    public init(){}
    public func messageUserListController() -> UIViewController {
        let view = MessageUserListControlller()
        let router = MessageUserListRouter()
        let presenter = MessageUserListPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}

extension MessageUserListRouter : MessageUserListRouterInterface  {
    func toChat(view:MessageUserListControlllerInterface?) {
        print("Interface aaaa")
       @Dependency var chatModule : ChatModuleInterface
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    
}
