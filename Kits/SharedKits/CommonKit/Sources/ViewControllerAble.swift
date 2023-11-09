
import UIKit
import Foundation

public protocol UIViewControllerAble {
    func setBackColorAble(color:UIColor)
}

extension UIViewControllerAble where Self : UIViewController {
    public func setBackColorAble(color:UIColor){
        view.backgroundColor = color
    }
}
