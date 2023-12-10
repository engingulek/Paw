
import Foundation

protocol ChatPresenterInterface {
    var view : ChatViewControllerInterface? {get}
    
    func viewDidLoad()
}


final class CharPresenter : ChatPresenterInterface {
   weak var view: ChatViewControllerInterface?
    
    init(view: ChatViewControllerInterface? = nil) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
        view?.navigationBackButtonHiddenAble(isHidden: false)
        view?.tabbarisHidden(isHidden: true)
        view?.setNavigationBarHidden(isHidden: false, animated: true)
    }
    
    
}



