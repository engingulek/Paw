

import Foundation
@testable import OnboardingModule



final class MockOnboardingRouter : OnboardiingRouterInterface {
    var invokedToTabbarContoller = false
    var invokedToTabbarContollerCount = 0
    func toTabbarController(view: OnboardiingViewControllerInterfaca?) {
        invokedToTabbarContoller = true
        invokedToTabbarContollerCount += 1
    }
    
    
}
