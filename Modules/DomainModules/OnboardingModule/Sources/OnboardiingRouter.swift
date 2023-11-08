
import Foundation
import UIKit
import OnboardingModuleInterface

protocol OnboardiingRouterInterface  {
    
}
public final class  OnboardingRouter : OnboardingModuleInterfac {
    public init() {}
   public func onboardingViewController() -> UIViewController {
       let view = UIViewController()
       view.view.backgroundColor = .red
       return view
    }
}
extension OnboardingRouter :  OnboardiingRouterInterface  {
    
}
