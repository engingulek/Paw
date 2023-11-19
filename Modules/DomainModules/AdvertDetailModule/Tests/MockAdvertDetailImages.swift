
import Foundation
import UIKit
@testable import AdvertDetailModule

final class MockAdvertDetailImages : AdvertDetailImagesImagesInterface {
    
    var invokedchangeOpacityWhenSelectedImageOneStatus = false
    var invokedchangeOpacityWhenSelectedImageOneCount = 0
    var invokedchangeOpacityWhenSelectedImageOne : (opacity:Float,defaultOpacity:Float)?
    func changeOpacityWhenSelectedImageOne(opacity: Float,defaultOpacity:Float) {
         invokedchangeOpacityWhenSelectedImageOneStatus = true
         invokedchangeOpacityWhenSelectedImageOneCount += 1
         invokedchangeOpacityWhenSelectedImageOne = (opacity:opacity,defaultOpacity:defaultOpacity)
    }
    
    var invokedchangeOpacityWhenSelectedImageTwoStatus = false
    var invokedchangeOpacityWhenSelectedImageTwoCount = 0
    var invokedchangeOpacityWhenSelectedImageTwo : (opacity:Float,defaultOpacity:Float)?
    func changeOpacityWhenSelectedImageTwo(opacity: Float,defaultOpacity:Float) {
        invokedchangeOpacityWhenSelectedImageTwoStatus = true
        invokedchangeOpacityWhenSelectedImageTwoCount += 1
        invokedchangeOpacityWhenSelectedImageTwo = (opacity:opacity,defaultOpacity:defaultOpacity)
    }
    
    var invokedchangeOpacityWhenSelectedImageThreeStatus = false
    var invokedchangeOpacityWhenSelectedImageThreeCount = 0
    var invokedchangeOpacityWhenSelectedImageThree : (opacity:Float,defaultOpacity:Float)?
    func changeOpacityWhenSelectedImageThree(opacity: Float,defaultOpacity:Float) {
        invokedchangeOpacityWhenSelectedImageThreeStatus = true
        invokedchangeOpacityWhenSelectedImageThreeCount += 1
        invokedchangeOpacityWhenSelectedImageThree = (opacity:opacity,defaultOpacity:defaultOpacity)
    }
    
    
}
