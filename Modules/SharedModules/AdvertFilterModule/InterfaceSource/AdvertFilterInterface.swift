
import Foundation
import UIKit
import ModelKit
public protocol AdvertFilterModuleInterface {
    func advertFilterController(adoptingAdverts:[AdoptingAdvert],delegate:AdvertFilterControllerDelegate?) -> UIViewController
}

public protocol AdvertFilterControllerDelegate {
    func toAdoptingHomeViewControllerWithPopViewController(filterAdoptingAdverts:[AdoptingAdvert])
}

