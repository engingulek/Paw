import Foundation
import UIKit
import SnapKit
import CommonKit

protocol AccountActionViewControllerInterface : AnyObject,UIViewControllerAble  {
   
    
}



final class AccountActionViewController : UIViewController {
   lazy var presenter: AccountActionPresenterInterface = AccountActionPresenter(view: self)
    
    public override func loadView() {
        let accountActionView = AccountActionView()
        view = accountActionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
 
}

extension AccountActionViewController : AccountActionViewControllerInterface {
 
}

