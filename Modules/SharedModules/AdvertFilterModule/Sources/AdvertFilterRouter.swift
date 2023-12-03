import UIKit
import AdoptingHomeModuleInterface
import AdvertFilterModuleInterface
import DependencyKit
import Foundation
import ModelKit
import CommonKit

protocol AdvertFilterRouterInterface {
    func toAdoptinHomeViewControllerWithPopViewController(
        view:AdvertFilterControllerInterface?,adoptingAdverts:[AdoptingAdvert])
}

public final class AdvertFilterRouter : AdvertFilterModuleInterface {
    public init() { }
    public func advertFilterController(adoptingAdverts: [AdoptingAdvert]) -> UIViewController {
        let view = AdvertFilterController()
        view.adoptingAdverts = adoptingAdverts
        let router = AdvertFilterRouter()
        let presenter = AdvertFilterPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
// AdvertFilterModuleInterfaceDelegate

extension AdvertFilterRouter : AdvertFilterRouterInterface {
    func toAdoptinHomeViewControllerWithPopViewController(
        view: AdvertFilterControllerInterface?,
        adoptingAdverts: [AdoptingAdvert]) {
            @Dependency var delegate : AdvertFilterControllerDelegate
            delegate.toAdoptingHomeViewControllerWithPopViewController(adoptingAdverts: adoptingAdverts)
            
            view?.popViewControllerAble()
        }
}


