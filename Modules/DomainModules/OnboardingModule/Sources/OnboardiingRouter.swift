
import Foundation
import UIKit
import OnboardingModuleInterface
import AdoptingHomeModuleInterface
import DependencyKit

protocol OnboardiingRouterInterface  {
    func toAdoptingViewController(view : OnboardiingViewControllerInterfaca?)
}
public final class  OnboardingRouter : OnboardingModuleInterfac {
   
    public init() {}
    
   public func onboardingViewController() -> UIViewController {
       let view = OnboardiingViewController()
       let router = OnboardingRouter()
       let presenter = OnboardPresenter(router: router, view: view)
       view.presenter = presenter
       return view
    }
}
extension OnboardingRouter :  OnboardiingRouterInterface  {
    func toAdoptingViewController(view : OnboardiingViewControllerInterfaca?) {
        @Dependency var adoptionHpmeViewModule : AdoptingHomeModuleInterface
       let viewController = adoptionHpmeViewModule.adoptingHomeViewController()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    
}
