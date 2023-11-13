
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
    func presentViewControllerAble(_ vc:UIViewController,animated:Bool)
   // func navigationBackButtonHidden(isHidden:Bool)
    
}

extension NavConAble  where Self : UIViewController{
    public func presentViewControllerAble(_ vc:UIViewController,animated:Bool) {
        navigationController?.present(vc, animated: true)
        navigationController?.navigationBar.isHidden  = true
    }
    
    /*public func navigationBackButtonHidden(isHidden:Bool) {
       
    }*/

}



