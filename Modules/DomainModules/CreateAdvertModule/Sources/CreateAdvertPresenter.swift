
import Foundation
import Firebase
import FirebaseStorage

protocol CreateAdvertPresenterInterface {
    var view : CreateAdvertViewControllerInterface? {get}
    var interactor : CreateAdvertInteractorInterface {get}
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
    
    private func addAdvert(images:[String]) async {
        do {
            try await interactor.addAdvertToAdvertList(imagesData: images)
        }catch{
            print("create error \(error.localizedDescription)")
        }
    }
    
    private func uploadImageAndReturnUrl(images:[Data]) -> [String]{
        print("aliiii")
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        let medinaFolder = storageReferance.child("media")
        let uuid = UUID().uuidString
        print(images[0])
        medinaFolder.child("\(uuid).jpeg")
        storageReferance.putData(images[0],metadata: nil) {metaData,error in
            if error == nil {
                storageReferance.downloadURL { url, error in
                    let imgUrl = url?.absoluteString
                   
                }
            }else{
                print(error?.localizedDescription)
            }
            
        }
 
        return [""]
    }
    
    func createAdvert(images:[Data]) {
        let imageUrl = uploadImageAndReturnUrl(images: images)
        print(imageUrl)
        Task {
            @MainActor in
           // await addAdvert(images:images)
        }
    }
    
    
}
