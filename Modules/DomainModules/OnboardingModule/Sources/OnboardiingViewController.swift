
import UIKit
import CommonKit

typealias Ables = UIViewControllerAble

protocol OnboardiingViewControllerInterfaca : AnyObject,Ables {
    var presenter : OnboardPresenterInterface? {get set}
}

public final class OnboardiingViewController: UIViewController {
    
    var presenter: OnboardPresenterInterface?
    
    public override func loadView() {
        let onboardView = OnboardView()
        view =  onboardView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension OnboardiingViewController : OnboardiingViewControllerInterfaca {
   
    
    
}
