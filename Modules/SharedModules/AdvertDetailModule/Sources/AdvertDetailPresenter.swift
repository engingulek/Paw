
import Foundation

protocol AdvertDetailPresenterInterface {
    var router : AdvertDetailRouterInterface? {get}
    var view : AdvertDetailViewControllerInterface? {get}
    
    func viewDidLoad(advertId:Int,userId:Int)
    func sendAdvertDetail() -> AdvertDetail
    
    // MARK : AdvertDetailImages Selecet Action
    func selectedADIOne()
    func selectedADITwo()
    func selectedADIThree()
    
}


final class  AdvertDetailPresenter : AdvertDetailPresenterInterface {
  
    
    var router: AdvertDetailRouterInterface?
    weak var view : AdvertDetailViewControllerInterface?
    var advertDetailImageView : AdvertDetailImagesImagesInterface?
    var interactor : AdvertDetailServiceProtocol
    
    var advertDetail : AdvertDetail? = nil
    
    init(router: AdvertDetailRouterInterface? = nil, 
         view: AdvertDetailViewControllerInterface?,
         advertDetailImageView : AdvertDetailImagesImagesInterface?,
         interactor : AdvertDetailServiceProtocol = AdvertDetailService.shared
    
    ) {
        self.router = router
        self.view = view
        self.advertDetailImageView = advertDetailImageView
        self.interactor = interactor
    }
    
    
    private func fetchAdvertDetail(advertId:Int,userId:Int) async {
        do{
            let result = try await interactor.fetchAdvertDetail(
                advertId: advertId,
                userId: userId)
            advertDetail = result
            view?.configureData(advertDetail: advertDetail!)
        }catch{
            print("Detail Error \(error.localizedDescription)")
            advertDetail = nil
        }
      
    }
    
    func viewDidLoad(advertId:Int,userId:Int) {
        view?.setBackColorAble(color: .white)
        view?.navigationBackButtonHiddenAble(isHidden: false)
        view?.tabbarisHidden(isHidden: true)
        view?.setNavigationBarHidden(isHidden: false, animated: true)
        Task {
            @MainActor in
            await fetchAdvertDetail(advertId:advertId,userId:userId)
        }
    }
    
    func sendAdvertDetail() -> AdvertDetail {
        return advertDetail ?? AdvertDetail(id: 0, images: [""], name: "", gender: "", genus: "", category: "", age: 0, city: "", district: "", about: "", userId: 0, userImage: "", userName: "", userSurname: "",favStatus: false)
    }
    
    func selectedADIOne() {
        advertDetailImageView?.changeOpacityWhenSelectedImageOne(opacity:0.50,defaultOpacity: 1)
    }
    
    func selectedADITwo() {
        advertDetailImageView?.changeOpacityWhenSelectedImageTwo(opacity:0.50,defaultOpacity: 1)
    }
    
    func selectedADIThree() {
        advertDetailImageView?.changeOpacityWhenSelectedImageThree(opacity:0.50,defaultOpacity: 1)
    }
}