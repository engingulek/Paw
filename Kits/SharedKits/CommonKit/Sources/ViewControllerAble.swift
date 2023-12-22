
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

//MARK: - NavConAble
public protocol NavConAble {
    func presentViewControllerAble(_ vc:UIViewController,animated:Bool)
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool)
    func navigationBackButtonHiddenAble(isHidden:Bool)
    func setNavigationBarHidden(isHidden:Bool,animated:Bool)
    func popViewControllerAble()
}

extension NavConAble  where Self : UIViewController{
    public func presentViewControllerAble(_ vc:UIViewController,animated:Bool) {
        navigationController?.present(vc, animated: true)
        
    }
    
    public func pushViewControllerAble (_ vc:UIViewController,animated:Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    public func navigationBackButtonHiddenAble(isHidden:Bool) {
        navigationController?.navigationBar.isHidden = isHidden
    }
    
    public func setNavigationBarHidden(isHidden:Bool,animated:Bool){
        navigationController?.setNavigationBarHidden(isHidden, animated: animated)
    }
    
    public func popViewControllerAble(){
        
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - TabbarConAble
public protocol TabbarConAble {
    func tabbarisHidden(isHidden : Bool)
    func tabbarToPageWithIndex(index:Int)
    
}

extension TabbarConAble  where Self : UIViewController  {
    public func tabbarisHidden(isHidden : Bool) {
        tabBarController?.tabBar.isHidden =  isHidden
    }
    
    public func tabbarToPageWithIndex(index:Int) {
        tabBarController?.selectedIndex = index
    }
}


public protocol AlertMessageAble {
    func createAlertMesssage(title:String,message:String,actionTitle:String)
   
}

extension AlertMessageAble  where Self : UIViewController {
    public  func createAlertMesssage(title:String,message:String,actionTitle:String){
        let alert = UIAlertController(
            title: title, 
            message: message,
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: actionTitle, style: .default))
        self.present(alert, animated: true)
        
    }
}





