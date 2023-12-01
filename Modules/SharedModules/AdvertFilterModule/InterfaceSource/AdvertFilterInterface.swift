
import Foundation
import UIKit
import ModelKit
public protocol AdvertFilterModuleInterface {
    func advertFilterController(adoptingAdverts:[AdoptingAdvert]) -> UIViewController
}

public protocol AdvertFilterControllerDelegate {
    func toAdoptingHomeViewControllerWithPopViewController(adoptingAdverts:[AdoptingAdvert])
}

