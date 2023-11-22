
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
    
    func cellForRowAt(at indexPath:IndexPath) -> AdoptingAdvert
    func numberOfRowsInSection() -> Int
  
}

final class AdoptinHomePresenter  {
    
    var router: AdoptingRouterInterface?
    weak var view: AdoptingHomeViewControllerInterfaca?
    var interactor: AdoptingHomeServiceProtocol
    
    private var categories : [Category] = []
    private var adoptingAdverts : [AdoptingAdvert] = []
    
    
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
            categories = []
            //print("Presenter Error \(error.localizedDescription)")
        }
    }
    
    private func fetchAdoptingAdverts() async {
        do {
            let result = try await interactor.fetchAdoptinAdvert()
            adoptingAdverts = result
            view?.reloadTableView()
        }catch{
            adoptingAdverts = []
            //print("Presenter Error \(error.localizedDescription)")
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
            await fetchCategorie()
            await fetchAdoptingAdverts()
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
        let category = categories[indexPath.item]
        return category
    }
    
    func didSelectItem(index: Int) {
        router?.toAdvertDetail(view: view)
    }
   
    func numberOfRowsInSection() -> Int {
        return adoptingAdverts.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> AdoptingAdvert {
        let adoptingAdvert = adoptingAdverts[indexPath.row]
        return adoptingAdvert
    }
    
    
    
    
    
    
    

}
