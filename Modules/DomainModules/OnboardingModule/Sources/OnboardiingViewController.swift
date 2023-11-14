
import UIKit
import CommonKit

typealias Ables = UIViewControllerAble & NavConAble

protocol OnboardiingViewControllerInterfaca : AnyObject,Ables {
    var presenter : OnboardPresenterInterface {get set}
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
    func selectedAdoptinView() {
        presenter.selectedAdoptingView()
    }
    
}
