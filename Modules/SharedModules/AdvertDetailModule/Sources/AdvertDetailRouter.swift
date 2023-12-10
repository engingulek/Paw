import Foundation
import ChatModuleInterface
import UIKit
import AdvertDetailModuleInterface
import DependencyKit
protocol AdvertDetailRouterInterface {
    func toChatVC(view:AdvertDetailViewControllerInterface?)
}

public final class AdvertDetailRouter : AdvertDetailModuleInterface {
    
    public init() {}
    
    public func advertDetailViewController(id: Int) -> UIViewController {
        let view = AdvertDetailViewController()
        let advertDetailImagesImages = AdvertDetailImagesImages()
        let router = AdvertDetailRouter()
        let inteeactor = AdvertDetailService()
        let presenter = AdvertDetailPresenter(
            router: router,
            view: view,
            advertDetailImageView: advertDetailImagesImages,
        interactor:inteeactor )
        view.advertId = id
        view.presenter =  presenter
        return view
    }
    
}

extension AdvertDetailRouter : AdvertDetailRouterInterface {
    func toChatVC(view:AdvertDetailViewControllerInterface?) {
        
        @Dependency var chatModuleInterface : ChatModuleInterface
        let viewController = chatModuleInterface.chatViewController()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    
}
    
