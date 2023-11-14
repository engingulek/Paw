
import Foundation

protocol AdvertDetailPresenterInterface {
    var router : AdvertDetailRouterInterface? {get set}
    var view : AdvertDetailViewControllerInterface? {get set}
    
    func viewDidLoad()
}


final class  AdvertDetailPresenter : AdvertDetailPresenterInterface {
    var router: AdvertDetailRouterInterface?
    weak var view : AdvertDetailViewControllerInterface?
    
    init(router: AdvertDetailRouterInterface? = nil, view: AdvertDetailViewControllerInterface? ) {
        self.router = router
        self.view = view
    }
    
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
        view?.navigationBackButtonHiddenAble(isHidden: false)
        view?.tabbarisHidden(isHidden: true)
    }
}
