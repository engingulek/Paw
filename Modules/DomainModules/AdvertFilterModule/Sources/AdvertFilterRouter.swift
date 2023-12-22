import UIKit
import AdoptingHomeModuleInterface
import AdvertFilterModuleInterface
import DependencyKit
import Foundation
import ModelKit
import CommonKit

protocol AdvertFilterRouterInterface {
    func toAdoptinHomeViewControllerWithPopViewController(
        view:AdvertFilterControllerInterface?,
        adoptingAdverts:[AdoptingAdvert])
}

public final class AdvertFilterRouter : AdvertFilterModuleInterface {
    
    public init() { }
    public func advertFilterController(adoptingAdverts: [ModelKit.AdoptingAdvert], delegate: AdvertFilterControllerDelegate?) -> UIViewController {
        let view = AdvertFilterController()
        view.adoptingAdverts = adoptingAdverts
        let router = AdvertFilterRouter()
        let presenter = AdvertFilterPresenter(view: view, router: router)
        view.presenter = presenter
        view.delgate = delegate
        return view
    }
}
//MARK:  AdvertFilterModuleInterfaceDelegate
extension AdvertFilterRouter : AdvertFilterRouterInterface {
    func toAdoptinHomeViewControllerWithPopViewController(
        view: AdvertFilterControllerInterface?,
        adoptingAdverts: [AdoptingAdvert]) {
            view?.delgate?.toAdoptingHomeViewControllerWithPopViewController(filterAdoptingAdverts: adoptingAdverts)
            view?.popViewControllerAble()
            
        }
}


