
import Foundation
import UIKit
import ModelKit
import AdvertFilterModuleInterface
protocol AdoptinHomePresenterInterface {
    var router : AdoptingRouterInterface? {get}
    var view : AdoptingHomeViewControllerInterfaca? {get}
    var interactor : AdoptingHomeInteractorProtocol {get}
    
    func viewDidload()
    func viewWillAppear()
    
    func categorNumberOfItems() -> Int
    func categoryCellForItem(at indexPath :IndexPath) -> (
        category:CategoryResult,
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
    
    func searchTextFieldDidChange(searchText : String)
    func toAdvertFilterController()
    
    func sortAdvertByDecrasing()
    func sortAdvertByGrowing()
  

}

final class AdoptinHomePresenter  {
    
    var router: AdoptingRouterInterface?
    weak var view: AdoptingHomeViewControllerInterfaca?
    var interactor: AdoptingHomeInteractorProtocol
    
    private var categories : [CategoryResult] = []
    private var adoptingAdverts : [AdoptingAdvert] = []
    private var selectedCategory : Int  = 0
    private var enterSearhText : String = ""
    private var filteradoptingAdverts : [AdoptingAdvert] = []
    
    
    init(router: AdoptingRouterInterface? = nil,
         view: AdoptingHomeViewControllerInterfaca?,
         interactor : AdoptingHomeInteractorProtocol = AdoptingHomeService.shared) {
        self.router = router
        self.view = view
        self.interactor = interactor
    }
    
    // MARK: - Fetch Categories
    private func fetchCategorie() async {
        do {
            let result = try await interactor.fetchCategories()
            categories = result
            let allCategory = CategoryResult(id: 0, category: "All")
            categories.insert(allCategory, at: 0)
            view?.reloadCollectionView()
        }catch{
            categories = []
        }
    }
    
    // MARK: - FethAdoptingAdverts
    private func fetchAdoptingAdverts() async {
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
            view?.finishTableViewLoading()
            view?.reloadTableView()
        }
    }
    
    // MARK: - AdvertFilterByCategory
    private func advertFilterByCategory(categoryId:Int) async {
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
            view?.finishTableViewLoading()
            view?.reloadTableView()
            view?.advertListMessage(isHidden: false, message: "Something went wrong")
        }
    }
    
    //MARK: - AdvertFilterBySearchText
    private func advertFilterBySearchText(searchText:String) async  {
        view?.startTableViewLoding()
        var result : [AdoptingAdvert] = []
        do {
            
            result = try await interactor.advertFilterBySearchText(searchText: searchText)
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
            view?.finishTableViewLoading()
            view?.reloadTableView()
        }
    }
    
    // MARK: - AdvertFilterBySearchTextAndCategory
    private func advertFilterBySearchTextAndCategory(caregoryId:Int,searchText:String) async {
        view?.startTableViewLoding()
        var result : [AdoptingAdvert] = []
        do {
            
            result = try await interactor.advertFilterBySearchTextAndCategoryId(
                categoryId: caregoryId,
                searchText: searchText)
            
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
            view?.finishTableViewLoading()
            view?.reloadTableView()
        }
    }
}

//MARK: - AdoptinHomePresenterInterface
extension AdoptinHomePresenter : AdoptinHomePresenterInterface {
    
    // MARK: ViewDidLoad
    func viewDidload() {
        view?.setBackColorAble(color: Theme.defaultTheme.themeColor.primaryBackColor)
        view?.navigationBackButtonHiddenAble(isHidden:true)
        Task {
            @MainActor in
            await fetchCategorie()
            await fetchAdoptingAdverts()
            
        }
        
        view?.prepareCollectionView()
        view?.prepareTableView()

    }
    
    //MARK: - viewWillAppear
    func viewWillAppear() {
        view?.tabbarisHidden(isHidden: false)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
        
    }
    
    
    private func advertsFilterAndSearchText(categoryId:Int,searchText:String) async{
        if categoryId == 0{
            if searchText.isEmpty {
                await fetchAdoptingAdverts()
            }else{
                await advertFilterBySearchText(searchText: searchText)
            }
        }else{
            if searchText.isEmpty {
                await advertFilterByCategory(categoryId:categoryId)
            }else{
                await advertFilterBySearchTextAndCategory(caregoryId: categoryId, searchText: searchText)
            }
        }
    }
    
    // MARK: - ToAdvertFilterController
    func toAdvertFilterController() {
        router?.toAdvertFilter(view: view,adoptingAdverts: 
                        adoptingAdverts, delegate: self)
    }
    
    //MARK: - Sort Funcitons of Advert
    func sortAdvertByDecrasing() {
        let sortAdverts = adoptingAdverts.sorted { $0.age > $1.age}
        adoptingAdverts = sortAdverts
        view?.reloadTableView()
    }
    
    func sortAdvertByGrowing() {
        let sortAdverts = adoptingAdverts.sorted { $0.age < $1.age}
        adoptingAdverts = sortAdverts
        view?.reloadTableView()
    }
    
 
}
// MARK : - SearchTextFieldDidChange
extension AdoptinHomePresenter {
    func searchTextFieldDidChange(searchText : String) {
        enterSearhText = searchText.lowercased()
        
        Task {
            @MainActor in
            await advertsFilterAndSearchText(categoryId:selectedCategory,searchText:enterSearhText)
        }
    }
}

// MARK: - For CollectionView
extension AdoptinHomePresenter {
    func categorNumberOfItems() -> Int {
        return categories.count
    }
    
    func categoryCellForItem(at indexPath :IndexPath) -> (
        category:CategoryResult,
        borderColor:UIColor,
        backColor:UIColor,
        cornerRadius :Double,
        borderWidth:Double,
        labelColor:UIColor
    ) {
        let category : CategoryResult
        let borderColor : UIColor
        let backColor : UIColor
        let cornerRadius : Double
        let borderWidth : Double
        let labelColor : UIColor
        
        
        cornerRadius =  CornerRadius.small.rawValue
        borderWidth = 1.0
        category = categories[indexPath.item]
        
        if  category.id == selectedCategory {
            borderColor = Theme.defaultTheme.cellColor.primaryBorderColor
            backColor = Theme.defaultTheme.cellColor.primaryBackColor
            labelColor = Theme.defaultTheme.cellColor.primaryLabelColor
            
        }else{
            
            borderColor = Theme.defaultTheme.cellColor.secondaryBorderColor
            backColor = Theme.defaultTheme.cellColor.secondaryBackColor
            labelColor = Theme.defaultTheme.cellColor.secondaryLabelColor
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
            await advertsFilterAndSearchText(categoryId:selectedCategory,searchText:enterSearhText)
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

extension AdoptinHomePresenter : AdvertFilterControllerDelegate {
    func toAdoptingHomeViewControllerWithPopViewController(
        filterAdoptingAdverts: [ModelKit.AdoptingAdvert]) {
        adoptingAdverts = filterAdoptingAdverts
        view?.reloadTableView()
    }
    
}
