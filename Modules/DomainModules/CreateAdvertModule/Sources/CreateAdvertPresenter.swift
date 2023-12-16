
import Foundation
import Firebase
import FirebaseStorage

protocol CreateAdvertPresenterInterface {
    var view : CreateAdvertViewControllerInterface? {get}
    var interactor : CreateAdvertInteractorInterface {get}
    
    func viewDidLoad()
    
    func createAdvert(images:[Data])
    
}

final class CreateAdvertPresenter : CreateAdvertPresenterInterface {
    var interactor: CreateAdvertInteractorInterface
    
   weak var view: CreateAdvertViewControllerInterface?
    
    init(view: CreateAdvertViewControllerInterface?,
         interactor : CreateAdvertInteractorInterface = CreateAdvertInteractor.shared) {
        self.view = view
        self.interactor = interactor
    }
    
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
    }
    
    private func addAdvert(parameters:[String:Any]) async {
        do {
            try await interactor.addAdvertToAdvertList(parameters: parameters)
        }catch{
            print("create error \(error.localizedDescription)")
        }
    }
    
    private func uploadImageAndReturnUrl(images:[Data]) -> [String]{
        var imgUrls:[String] = []
        for image in images {
            let storage = FirebaseStorage.Storage.storage()
            let storageReferance = storage.reference()
            let medinaFolder = storageReferance.child("media")
            let uuid = UUID().uuidString
            medinaFolder.child("\(uuid).jpeg")
            storageReferance.putData(image,metadata: nil) {metaData,error in
                if error == nil {
                    storageReferance.downloadURL { url, error in
                        guard let imgUrl = url?.absoluteString else {return}
                        imgUrls.append(imgUrl)
                    }
                }else{
                    //TODO: Alert Message
                }
                
            }
        }
        return imgUrls
    }
    
    func createAdvert(images:[Data]) {
        let imageUrls = uploadImageAndReturnUrl(images: images)
        
        let parameters : [String:Any] = [
            "images":imageUrls,
            "name": "Test",
            "genus":"testGenys",
            "categoryid":1,
            "age":2,
            "gender":"testgender",
            "city" :"Test",
            "district":"Test",
            "about":"Test",
            "userid":1,
           
        ]
        Task {
            @MainActor in
            await addAdvert(parameters:parameters)
        }
    }
    
    
}
