
import Foundation
import ModelKit
import UIKit
enum Gender:String {
    case male
    case female
}

/*TODO: 1. Firebase will be removed
 2.
 
 */

protocol CreateAdvertPresenterInterface {
    var view : CreateAdvertViewControllerInterface? {get}
    var createAdvertView : CreateAdvertViewInterface? {get}
    var interactor : CreateAdvertInteractorInterface {get}
    
    func viewDidLoad()
    
    func createAdvert()
    func numberOfComponents() -> Int
    func numberOfRowsInComponent() -> Int
    func titleForRow(row:Int) -> CategoryResult
    
 
    func didSelectRow(row:Int)
    
    func selectedGender(gender:Gender)
    func getImageData(images:[Data])

    
}

final class CreateAdvertPresenter {
   
    var interactor: CreateAdvertInteractorInterface
    
   weak var view: CreateAdvertViewControllerInterface?
    weak var createAdvertView: CreateAdvertViewInterface?
    private var categories : [CategoryResult] = []
    private var choosegender : Gender = .male
    // TODO: Default selectedCategory
    private var selectedCategory:CategoryResult? = nil
    private var imgData:[Data] = []
    
    init(interactor: CreateAdvertInteractorInterface = CreateAdvertInteractor.shared, 
         view: CreateAdvertViewControllerInterface? = nil,
         createAdvertView : CreateAdvertViewInterface? = nil) {
        self.interactor = interactor
        self.view = view
        self.createAdvertView = createAdvertView
       
    
    }
    
    private func fetchCategorie() async {
        do {
            let result = try await interactor.fetchCategories()
            categories = result
            view?.categoryPickerViewAllComponents()
        }catch{
            categories = []
        }
    }
    
   
    
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
        Task {
            @MainActor in
            await fetchCategorie()
        }
    }
    
    //MARK: - Add Advert
    private func addAdvert(parameters:[String:Any]) async {
        do {
            try await interactor.addAdvertToAdvertList(parameters: parameters)
        }catch{
            
            view?.createAlertMesssage(
                title: "Error",
                message: "Please try later", actionTitle: "Ok")
            
        }
    }
    
 
    
     func getImageData(images:[Data]){
         
         imgData = images
    }
    
    private func validateImage() -> (valiImage:Bool,title:String,message:String) {
        var valiImage:Bool = true
        var title:String = ""
        var message:String = ""
        if imgData.count != 3 {
            valiImage = false
            title = "Image Count Error"
            message = "Count of Selected Images should be 3"
        }
        return(valiImage,title,message)
    }
    
    private func validateInfo() -> (valiInfo:Bool,title:String,message:String){
        var valiInfo:Bool = true
        var title:String = ""
        var message:String = ""
        guard let info = createAdvertView?.inputsReturn() else {
            valiInfo = false
            title = "Error"
            message = "An unexpected error occurred"
            return (valiInfo,title,message)}
        let age = Int(info.animalAge)
  
        if info.animalName.isEmpty ||
            info.animalGenus.isEmpty ||
            info.animalAge.isEmpty ||
            age == nil ||
            age! < 0 ||
            info.animalInfo.isEmpty {
            
            valiInfo = false
            title = "Info Error"
            message = "Please Check Info of Advert"
            
        }
        return(valiInfo,title,message)
            
        
    }
    
    
    func createAdvert() {
        let valImage = validateImage()
        let valInfo = validateInfo()
        
        if valImage.valiImage && valInfo.valiInfo {
            let info = createAdvertView?.inputsReturn()
            let parameters : [String:Any] = [
                "images":["https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg",
                         "https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg",
                         "https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg"],
                "name": info?.animalName ?? "",
                "genus":info?.animalGenus ?? "",
                "categoryid":selectedCategory?.id ?? categories[0].id,
                "age":Int(info?.animalAge ?? "0") ?? 0,
                "gender":choosegender.rawValue,
                "city" :"Istanbul",
                "about":info?.animalInfo ?? "",
                "userid":1,
            ]

            print(parameters)
            Task {
                @MainActor in
                await addAdvert(parameters:parameters)
            }
            view?.tabbarToPageWithIndex(index: 0)
          
        }else if !valImage.valiImage{
            view?.createAlertMesssage(
                title: valImage.title,
                message: valImage.message,
                actionTitle: "Ok")
        }else if !valInfo.valiInfo {
            view?.createAlertMesssage(
                title: valInfo.title,
                message: valInfo.message,
                actionTitle: "Ok")
        }else{
            view?.createAlertMesssage(
                title: "Error",
                message: "Please try later", actionTitle: "Ok")
        }
        
               
    }
}


extension CreateAdvertPresenter : CreateAdvertPresenterInterface{
  
    
 
    func selectedGender(gender:Gender) {
        switch gender {
        case .male:
            view?.changeMaleButtonColors(backColor: .red, textColor: .white)
            view?.changeFemaleButtonColors(backColor: .white, textColor: .black)
          
        case .female:
            view?.changeFemaleButtonColors(backColor: .red, textColor: .white)
            view?.changeMaleButtonColors(backColor: .white, textColor: .black)
        }
        choosegender = gender
    }
    
    func numberOfComponents() -> Int {
        return 1
    }
    
    func numberOfRowsInComponent() -> Int {
        return categories.count
    }
    
    func titleForRow(row:Int) -> CategoryResult {
        let category = categories[row]
        return category
    }
    
    func didSelectRow(row:Int)  {
        selectedCategory = categories[row]
    }
}

