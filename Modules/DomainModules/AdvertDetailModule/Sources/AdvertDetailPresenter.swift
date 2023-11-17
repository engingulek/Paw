
import Foundation

protocol AdvertDetailPresenterInterface {
    var router : AdvertDetailRouterInterface? {get set}
    var view : AdvertDetailViewControllerInterface? {get set}
    
    func viewDidLoad()
    
    // MARK : AdvertDetailImages Selecet Action
    func selectedADIOne()
    func selectedADITwo()
    func selectedADIThree()
    
}


final class  AdvertDetailPresenter : AdvertDetailPresenterInterface {
  
    
    var router: AdvertDetailRouterInterface?
    weak var view : AdvertDetailViewControllerInterface?
    var advertDetailImageView : AdvertDetailImagesImagesInterface?
    
    init(router: AdvertDetailRouterInterface? = nil, 
         view: AdvertDetailViewControllerInterface?,
         advertDetailImageView : AdvertDetailImagesImagesInterface?) {
        self.router = router
        self.view = view
        self.advertDetailImageView = advertDetailImageView
    }
    
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
        view?.navigationBackButtonHiddenAble(isHidden: false)
        view?.tabbarisHidden(isHidden: true)
    }
    
    func selectedADIOne() {
        advertDetailImageView?.changeOpacityWhenSelectedImageOne(opacity:0.50)
    }
    
    func selectedADITwo() {
        advertDetailImageView?.changeOpacityWhenSelectedImageTwo(opacity:0.50)
    }
    
    func selectedADIThree() {
        advertDetailImageView?.changeOpacityWhenSelectedImageThree(opacity:0.50)
    }
}
