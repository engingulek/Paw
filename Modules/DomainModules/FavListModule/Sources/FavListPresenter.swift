

import Foundation


protocol FavListPresenterInterface {
    var view : FavListViewControllerInterface? {get}
    var router : FavListRouterInterface? {get}
    func viewDidload()
    func viewWillAppear()
}


final class FavListPresenter : FavListPresenterInterface {
    weak var view : FavListViewControllerInterface?
    var router: FavListRouterInterface?
    
    init(view: FavListViewControllerInterface?,
         router : FavListRouterInterface? = nil) {
        self.view = view
    }
    
    func viewDidload() {
        view?.setBackColorAble(color: .white)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
        
        view?.prepareCollectionView()
        view?.reloadCollectionView()
    }
    
    func viewWillAppear() {
        view?.tabbarisHidden(isHidden: false)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
        
    }
}
