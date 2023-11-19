
import Foundation

protocol AdoptinHomePresenterInterface {
    var router : AdoptingRouterInterface? {get set}
    var view : AdoptingHomeViewControllerInterfaca? {get set}
    
    func viewDidload()
    func viewWillAppear()
    func categorNumberOfItems() -> Int
    func categoryCellForItemAt(index:Int) -> Category
    func didSelectItem(index : Int)
  
}

final class AdoptinHomePresenter : AdoptinHomePresenterInterface {
    var router: AdoptingRouterInterface?
    weak var view: AdoptingHomeViewControllerInterfaca?
    
    init(router: AdoptingRouterInterface? = nil, view: AdoptingHomeViewControllerInterfaca?) {
        self.router = router
        self.view = view
    }
    
    func viewDidload() {
        view?.setBackColorAble(color: .white)
        view?.navigationBackButtonHiddenAble(isHidden:true )
        
        view?.prepareCollectionView()
        view?.prepareTableView()
    }
    
    func viewWillAppear() {
        view?.tabbarisHidden(isHidden: false)
    }
    
    func categorNumberOfItems() -> Int {
        return Category.exampleCategory.count
    }
    
    func categoryCellForItemAt(index: Int) -> Category {
        let category = Category.exampleCategory[index]
        return category
    }
    
    func didSelectItem(index: Int) {
       
        router?.toAdvertDetail(view: view)
    }
    
    
    
    
    
}
