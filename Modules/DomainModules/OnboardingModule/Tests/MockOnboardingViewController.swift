
import Foundation
import UIKit
@testable import OnboardingModule



final class MockOnboardingViewController :  OnboardiingViewControllerInterfaca {
    
    var invokedSetBackColorStatus = false
    var invokedSetBackColorCount = 0
    var invokedSetBackColor : (color:UIColor,Void)?
    func setBackColorAble(color: UIColor) {
        invokedSetBackColorStatus = true
        invokedSetBackColorCount += 1
        invokedSetBackColor = (color:color,())
    }
    
    
    var invokedPresentViewControllerAbleStatus = false
    var invokedPresentViewControllerAbleCount = 0
    func presentViewControllerAble(_ vc: UIViewController, animated: Bool) {
        invokedPresentViewControllerAbleStatus = true
        invokedPresentViewControllerAbleCount += 1
    }
    
    var invokedPushViewControllerAbleStatus = false
    var invokedPushViewControllerAbleCount = 0
    var invokedPushViewControllerAble : (vc:UIViewController,animated:Bool)?
    func pushViewControllerAble(_ vc: UIViewController, animated: Bool) {
        invokedPushViewControllerAbleStatus = true
        invokedPushViewControllerAbleCount += 1
        invokedPushViewControllerAble = (vc:vc,animated:animated)
    }
    
    var invokedNavigationBackButtonHiddenAbleStatus = false
    var navigationBackButtonHiddenAbleCount = 0
    var navigationBackButtonHiddenAble : (isHidden:Bool,Void)?
    func navigationBackButtonHiddenAble(isHidden: Bool) {
        invokedNavigationBackButtonHiddenAbleStatus = true
        navigationBackButtonHiddenAbleCount += 1
        navigationBackButtonHiddenAble = (isHidden:isHidden,())
    }
    
    
}
