
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


// MARK : - NavConAble
public protocol NavConAble {
    func pushViewControllerAble(_ vc:UIViewController,animated:Bool)
  
}

extension NavConAble  where Self : UIViewController{
  public func pushViewControllerAble(_ vc:UIViewController,animated:Bool) {
        navigationController?.pushViewController(vc, animated: true)
    }
}
