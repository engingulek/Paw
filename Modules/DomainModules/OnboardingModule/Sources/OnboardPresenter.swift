
import Foundation

protocol OnboardPresenterInterface : AnyObject {
    var router : OnboardiingRouterInterface? {get set}
    var view : OnboardiingViewControllerInterfaca? {get set}
    
    func viewDidLoad()
}


final class OnboardPresenter : OnboardPresenterInterface {
    var router: OnboardiingRouterInterface?
    weak var view: OnboardiingViewControllerInterfaca?
    
    init(router: OnboardiingRouterInterface? = nil, view: OnboardiingViewControllerInterfaca?) {
        self.router = router
        self.view = view
    }
}

extension OnboardPresenter {
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
    }
}
