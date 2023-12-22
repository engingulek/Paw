
import Foundation

protocol OnboardPresenterInterface : AnyObject {
    func viewDidLoad()
    func selectedAdoptingView()
}

final class OnboardPresenter : OnboardPresenterInterface {
    
    private var router: OnboardiingRouterInterface?
    weak var view: OnboardiingViewControllerInterfaca?
    
    init(router: OnboardiingRouterInterface? = nil,
        view: OnboardiingViewControllerInterfaca?) {
        self.router = router
        self.view = view
    }
}

extension OnboardPresenter {
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
    }
    
    func selectedAdoptingView() {
        router?.toTabbarController(view: view)
    }
}
