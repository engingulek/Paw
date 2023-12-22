
import UIKit
import CommonKit

typealias Ables = UIViewControllerAble & NavConAble

protocol OnboardiingViewControllerInterfaca : AnyObject,Ables {
    var presenter :  OnboardPresenterInterface {get}
}

final class OnboardiingViewController: UIViewController{
    lazy var presenter: OnboardPresenterInterface = OnboardPresenter(view: self)
    
    private lazy var  onboardView = OnboardView()
    public override func loadView() {
        onboardView = OnboardView()
        view =  onboardView
        onboardView.delegate = self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension OnboardiingViewController :  OnboardingViewDelegate  {
    func toHomePage() {
        presenter.selectedAdoptingView()
    }
}

//MARK : - OnboardiingViewControllerInterfaca
extension OnboardiingViewController : OnboardiingViewControllerInterfaca {}
