
import Foundation

protocol AdoptinHomePresenterInterface {
    var router : AdoptingRouterInterface? {get set}
    var view : AdoptingHomeViewControllerInterfaca? {get set}
    
    func viewDidload()
}

final class AdoptinHomePresenter : AdoptinHomePresenterInterface {
    var router: AdoptingRouterInterface?
    weak var view: AdoptingHomeViewControllerInterfaca?
    
    init(router: AdoptingRouterInterface? = nil, view: AdoptingHomeViewControllerInterfaca?) {
        self.router = router
        self.view = view
    }
    
    func viewDidload() {
        view?.setBackColorAble(color: .white)
    }
    
    
}
