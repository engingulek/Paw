
import Foundation
import UIKit
@testable import AdoptingHomeModule

final class MockAdoptingHomeViewController : AdoptingHomeViewControllerInterfaca {
    lazy var presenter : AdoptinHomePresenterInterface = AdoptinHomePresenter(view: self)
    
    var invokedPreapareCollectionView = false
    var invokedPreapareCollectionViewCount = 0
    func prepareCollectionView() {
        invokedPreapareCollectionView = true
        invokedPreapareCollectionViewCount += 1
    }
    
    var invokedPreapareTableView = false
    var invokedPreapareTableViewCount = 0
    func prepareTableView() {
        
        invokedPreapareTableView = false
        invokedPreapareTableViewCount = 0
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
    
    var invokedNavigaitonBackButtonHiddenStatus = false
    var invokedNavigaitonBackButtonHiddenCount = 0
    var invokedNavigaitonBackButtonHidden : (isHidden:Bool,Void)?
    func navigationBackButtonHiddenAble(isHidden: Bool) {
         invokedNavigaitonBackButtonHiddenStatus = true
         invokedNavigaitonBackButtonHiddenCount += 1
         invokedNavigaitonBackButtonHidden = (isHidden:isHidden,())
    }
    
    var invokedTabbarIsHiddenStatus = false
    var invokedTabbarIsHiddenCount = 0
    var invokedTabbarIsHidden : (isHidden:Bool,Void)?
    func tabbarisHidden(isHidden: Bool) {
        
        invokedTabbarIsHiddenStatus = true
        invokedTabbarIsHiddenCount += 1
        invokedTabbarIsHidden = (isHidden:isHidden,())
    }
    
    var invokedSetBackColorStatus = false
    var invokedSetBackColorCount = 0
    var invokedSetBackColor : (color:UIColor,Void)?
    func setBackColorAble(color: UIColor) {
        invokedSetBackColorStatus = true
        invokedSetBackColorCount += 1
        invokedSetBackColor = (color:color,())
    }
    
    
}
