

import Foundation


protocol FavListPresenterInterface {
    var view : FavListViewControllerInterface? {get}
    var router : FavListRouterInterface? {get}
    var interactor : FavAdvertsInteractorInterface {get}
    func viewDidload(userId:Int)
    func viewWillAppear()
    func numberOfItems() -> Int
    func cellForItem(at indexPath:IndexPath) -> FavAdvert
}


final class FavListPresenter : FavListPresenterInterface {
    
    weak var view : FavListViewControllerInterface?
    var router: FavListRouterInterface?
    var interactor : FavAdvertsInteractorInterface
    
    private var favAdverts: [FavAdvert] = []
    
    init(view: FavListViewControllerInterface?,
         router : FavListRouterInterface? = nil,
         interactor:FavAdvertsInteractorInterface = FavAdvertsInteractor.shared ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    //MARK: - Fetch FavAdverts
    private func fetchFavAdverts(userId:Int) async {
        do {
            let result = try await interactor.fetchFavAdverts(userId: userId)
            favAdverts = result
            view?.reloadCollectionView()
        }catch {
            favAdverts = []
        }
    }
    
    func viewDidload(userId:Int) {
        view?.setBackColorAble(color: .white)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
        
        Task{
            @MainActor in
            await fetchFavAdverts(userId:userId)
        }
        
        view?.prepareCollectionView()
        view?.reloadCollectionView()
    }
    
    func viewWillAppear() {
        view?.tabbarisHidden(isHidden: false)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
        
    }
}

// MARK: For CollectionView
extension FavListPresenter {
    func numberOfItems() -> Int {
        return favAdverts.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> FavAdvert {
        let favAdvert = favAdverts[indexPath.item]
        return favAdvert
    }
}
