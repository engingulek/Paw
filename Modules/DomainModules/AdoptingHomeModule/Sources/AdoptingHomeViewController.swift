
import UIKit
import CommonKit
typealias Ables = UIViewControllerAble

protocol AdoptingHomeViewControllerInterfaca : AnyObject,Ables {
    
}

final class AdoptingHomeViewController: UIViewController,AdoptingHomeViewControllerInterfaca{
    
    lazy var presenter : AdoptinHomePresenterInterface = AdoptinHomePresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidload()
        
    }
}
