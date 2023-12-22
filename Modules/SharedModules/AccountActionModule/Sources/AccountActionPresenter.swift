
import Foundation

protocol AccountActionPresenterInterface {
    var router : AccountActionRouterInterface? {get}
    var view : AccountActionViewControllerInterface? {get}
    
    func viewDidLoad()
    func getAccount()
}


final class AccountActionPresenter {
    var router: AccountActionRouterInterface?
    weak var view: AccountActionViewControllerInterface?
    
    init(router: AccountActionRouterInterface? = nil, 
        view: AccountActionViewControllerInterface?) {
        self.router = router
        self.view = view
    }
}



//MARK: - AccountActionPresenterInterface
extension AccountActionPresenter : AccountActionPresenterInterface {
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
    }
}
