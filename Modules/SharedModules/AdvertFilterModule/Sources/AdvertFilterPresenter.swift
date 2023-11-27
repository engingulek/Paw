
import Foundation

protocol AdvertFilterPresenterInterface {
    var view : AdvertFilterControllerInterface? {get set}
    var router : AdvertFilterRouter? {get set}
    
    func viewDidLoad()
}


final class AdvertFilterPresenter : AdvertFilterPresenterInterface {
    var view: AdvertFilterControllerInterface?
    
    var router: AdvertFilterRouter?
    
    init(view: AdvertFilterControllerInterface?, router: AdvertFilterRouter? = nil) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
        view?.setNavigationBarHidden(isHidden: false, animated: true)
        view?.tabbarisHidden(isHidden: true)
        
        view?.prepareTableView()
        view?.reloadTableView()
    }
    
    
}
