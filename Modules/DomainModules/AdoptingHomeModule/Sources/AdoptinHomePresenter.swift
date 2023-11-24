
import Foundation
import UIKit

protocol AdoptinHomePresenterInterface {
    var router : AdoptingRouterInterface? {get set}
    var view : AdoptingHomeViewControllerInterfaca? {get set}
    var interactor : AdoptingHomeServiceProtocol {get set}
    
    func viewDidload()
    func viewWillAppear()
    
    func categorNumberOfItems() -> Int
    func categoryCellForItem(at indexPath :IndexPath) -> (
        category:Category,
        borderColor:UIColor,
        backColor:UIColor,
        cornerRadius :Double,
        borderWidth:Double,
        labelColor:UIColor)
    func numberOfSections() -> Int
    func didSelectItemAt(at indexPath: IndexPath)
    
    func cellForRowAt(at indexPath:IndexPath) -> AdoptingAdvert
    func numberOfRowsInSection() -> Int
    func didSelectRowAt(at indexPath:IndexPath)
    
    
}

final class AdoptinHomePresenter  {
    
    var router: AdoptingRouterInterface?
    weak var view: AdoptingHomeViewControllerInterfaca?
    var interactor: AdoptingHomeServiceProtocol
    
    private var categories : [Category] = []
    private var adoptingAdverts : [AdoptingAdvert] = []
    private var selectedCategory : Int  = 0
    
    
    init(router: AdoptingRouterInterface? = nil,
         view: AdoptingHomeViewControllerInterfaca?,
         interactor : AdoptingHomeServiceProtocol = AdoptingHomeService.shared) {
        self.router = router
        self.view = view
        self.interactor = interactor
    }
    
   private func fetchCategorie() async throws {
        do {
            let result = try await interactor.fetchCategories()
            categories = result
            let allCategory = Category(id: 0, category: "All")
            categories.insert(allCategory, at: 0)
            view?.reloadCollectionView()
        }catch{
            categories = []
        }
    }
    
    private func fetchAdoptingAdverts() async throws {
        view?.startTableViewLoding()
        do {
            let result = try await interactor.fetchAdoptinAdvert()
            adoptingAdverts = result
            if adoptingAdverts.isEmpty {
                 view?.advertListMessage(isHidden: false, message: "No Data")
            }else{
                view?.advertListMessage(isHidden: true, message: "")
            }
            view?.finishTableViewLoading()
            view?.reloadTableView()
          
        }catch{
            adoptingAdverts = []
            view?.advertListMessage(isHidden: false, message: "Something went wrong")
        }
    }
    
    private func advertFilterByCategory(categoryId:Int) async throws {
        view?.startTableViewLoding()
        do {
            let result = try await interactor.advertFilterByCategory(categoryId: categoryId)
            adoptingAdverts = result
            if adoptingAdverts.isEmpty {
                 view?.advertListMessage(isHidden: false, message: "No Data")
            }else{
                view?.advertListMessage(isHidden: true, message: "")
            }
            view?.finishTableViewLoading()
            view?.reloadTableView()
        }catch{
            adoptingAdverts = []
            view?.advertListMessage(isHidden: false, message: "Something went wrong")
        }
    }
}

//MARK: - AdoptinHomePresenterInterface
extension AdoptinHomePresenter : AdoptinHomePresenterInterface {
    func viewDidload() {
        view?.setBackColorAble(color: .white)
        view?.navigationBackButtonHiddenAble(isHidden:true )
        
        Task {
            @MainActor in
            try await fetchCategorie()
            try await fetchAdoptingAdverts()
        }
        
        view?.prepareCollectionView()
        view?.prepareTableView()
    }
    
    func viewWillAppear() {
        view?.tabbarisHidden(isHidden: false)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
    }
    
}

// MARK: - For CollectionView
extension AdoptinHomePresenter {
    func categorNumberOfItems() -> Int {
        return categories.count
    }
    
    func categoryCellForItem(at indexPath :IndexPath) -> (
        category:Category,
        borderColor:UIColor,
        backColor:UIColor,
        cornerRadius :Double,
        borderWidth:Double,
        labelColor:UIColor
    ) {
        let category : Category
        let borderColor : UIColor
        let backColor : UIColor
        let cornerRadius : Double
        let borderWidth : Double
        let labelColor : UIColor
        
        
        cornerRadius =  10.0
        borderWidth = 1.0
        category = categories[indexPath.item]
        
        if  category.id == selectedCategory {
            borderColor = .red
            backColor = .red
            labelColor = .white
            
        }else{
            
            borderColor = .black
            backColor = .white
            labelColor = .black
        }
        
        return (
            category,
            borderColor,
            backColor,
            cornerRadius,
            borderWidth,
            labelColor)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func didSelectItemAt(at indexPath: IndexPath){
        let id = categories[indexPath.item].id
        selectedCategory = id
        view?.reloadCollectionView()
        
        Task {
            @MainActor in
            if id == 0{
                try await fetchAdoptingAdverts()
            }else {
                try await advertFilterByCategory(categoryId:id)
            }
        }
        
    }
}


// MARK: - For TableView
extension AdoptinHomePresenter {
    
    func numberOfRowsInSection() -> Int {
        return adoptingAdverts.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> AdoptingAdvert {
        let adoptingAdvert = adoptingAdverts[indexPath.row]
        return adoptingAdvert
    }
    
    func didSelectRowAt(at indexPath:IndexPath) {
        let id = adoptingAdverts[indexPath.row].id
        router?.toAdvertDetail(view: view,id: id)
        
    }
    
    
}
