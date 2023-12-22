
import Foundation
import UIKit

extension UIFont {
    var boldVersion: UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: .zero) /// 0 is keep to orjinal size
    }
}
