
import Foundation

protocol AdoptinHomePresenterInterface {
    var router : AdoptingRouterInterface? {get set}
    var view : AdoptingHomeViewControllerInterfaca? {get set}
    var interactor : AdoptingHomeServiceProtocol {get set}
    
    func viewDidload()
    func viewWillAppear()
    func categorNumberOfItems() -> Int
    func categoryCellForItem(at indexPath :IndexPath) -> Category
    func didSelectItem(index : Int)
  
}

final class AdoptinHomePresenter : AdoptinHomePresenterInterface {
   
    var router: AdoptingRouterInterface?
    weak var view: AdoptingHomeViewControllerInterfaca?
    var interactor: AdoptingHomeServiceProtocol
    private var categories : [Category] = []
    
    
    init(router: AdoptingRouterInterface? = nil, 
         view: AdoptingHomeViewControllerInterfaca?,
         interactor : AdoptingHomeServiceProtocol = AdoptingHomeService.shared) {
        self.router = router
        self.view = view
        self.interactor = interactor
    }
    
    private func fetchCategorie() async {
        do {
            let result = try await interactor.fetchCategories()
            categories = result
            view?.reloadCollectionView()
            
        }catch{
            print("Presenter Error \(error.localizedDescription)")
        }
         
    }
    
    func viewDidload() {
        view?.setBackColorAble(color: .white)
        view?.navigationBackButtonHiddenAble(isHidden:true )
        
        Task {
            @MainActor in
            await fetchCategorie()
        }
        
      
        
        view?.prepareCollectionView()
        view?.prepareTableView()
    }
    
    func viewWillAppear() {
        view?.tabbarisHidden(isHidden: false)
    }
    
    func categorNumberOfItems() -> Int {
        return categories.count
    }
    
    func categoryCellForItem(at indexPath :IndexPath) -> Category {
        let category = categories[indexPath.row]
        return category
    }
    
    func didSelectItem(index: Int) {
       
        router?.toAdvertDetail(view: view)
    }
    
    
    
    
    
}
