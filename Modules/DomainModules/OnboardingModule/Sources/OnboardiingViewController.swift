
import UIKit
import CommonKit

typealias Ables = UIViewControllerAble & NavConAble

protocol OnboardiingViewControllerInterfaca : AnyObject,Ables {
    var presenter :  OnboardPresenterInterface {get}
}

final class OnboardiingViewController: UIViewController{
   
    
   lazy var presenter: OnboardPresenterInterface = OnboardPresenter(view: self)
    
    public override func loadView() {
        let onboardView = OnboardView()
        view =  onboardView
        onboardView.delegate = self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension OnboardiingViewController : OnboardiingViewControllerInterfaca {
    
}


extension OnboardiingViewController :  OnboardingViewDelegate  {
    func createAccount() {
        presenter.createAccountSelected()
    }
    
    func toHomePage() {
        presenter.selectedAdoptingView()
    }
    
}
