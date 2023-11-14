import UIKit
import CommonKit
typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble

protocol AdvertDetailViewControllerInterface: AnyObject ,Ables {
    var presenter : AdvertDetailPresenterInterface {get set}
}

final class AdvertDetailViewController: UIViewController,AdvertDetailViewControllerInterface {
   lazy var presenter: AdvertDetailPresenterInterface = AdvertDetailPresenter(view: self)
    
    
  public override func viewDidLoad() {
        super.viewDidLoad()
      presenter.viewDidLoad()
    }
}


