
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
    
    func favIconAction(advertId: Int, userId: Int)
    func clickedSendMessageButton()
    
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
    
    //MARK: - Delete FavAdvert
    private func deleteFavAdvert(advertId: Int, userId: Int) async {
        do{
            try await interactor.deleteFavAdvertFromFavList(
                advertId: advertId,
                userId: userId)
        }catch{
            // TODO: Alert Message will add
            view?.alertMessage(title: "Error", message: "Something went wrong")
        }
    }
    
    private func addFavAdvert(advertId: Int, userId: Int) async {
        do{
            try await interactor.addAdvertToFromFavList(
                advertId: advertId,
                userId: userId)
        }catch{
            // TODO: Alert Message will add
            view?.alertMessage(title: "Error", message: "Something went wrong")
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
    
    func favIconAction(advertId: Int, userId: Int) {
        guard let favStatus = advertDetail?.favStatus else {return}
        
        if favStatus{
            print("delete")
            Task {
                @MainActor in
                await deleteFavAdvert(advertId: advertId, userId: userId)
                await fetchAdvertDetail(advertId: advertId, userId: userId)
            }
        }else if !favStatus{
            Task {
                @MainActor in
                await addFavAdvert(advertId: advertId, userId: userId)
                await fetchAdvertDetail(advertId: advertId, userId: userId)
            }
        }else{
            view?.alertMessage(title: "Error", message: "Something went wrong")
        }
    }
    
    func clickedSendMessageButton(){
        router?.toChatVC(view: view)
    }
}
