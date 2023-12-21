
import Foundation
import UIKit
import OnboardingModuleInterface
import TabbarModuleInterface
import DependencyKit
import AccountActionModuleInterface

protocol OnboardiingRouterInterface : AnyObject  {
    func toTabbarController(view : OnboardiingViewControllerInterfaca?)
    func toAccoountActionModule(view: OnboardiingViewControllerInterfaca?)
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
   
    func toTabbarController(view: OnboardiingViewControllerInterfaca?) {
      
        @Dependency var tabbarModuleInterface : TabbarModuleInterface
        let viewController = tabbarModuleInterface.tabbarViewController()
        viewController.modalPresentationStyle = .fullScreen
        view?.presentViewControllerAble(viewController, animated: true)
    }
    
    func toAccoountActionModule(view: OnboardiingViewControllerInterfaca?) {
        @Dependency var accountActionModule : AccountActionModuleInterface
        let viewController = accountActionModule.accountActionViewController()
        view?.presentViewControllerAble(viewController, animated: true)
    }
    
  
    
    
}
