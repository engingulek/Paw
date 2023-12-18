

import Foundation


protocol FavListPresenterInterface : AnyObject {
    var view : FavListViewControllerInterface? {get}
    var router : FavListRouterInterface? {get}
    var interactor : FavAdvertsInteractorInterface {get}
    func viewDidload(userId:Int)
    func viewWillAppear()
    func numberOfItems() -> Int
    func cellForItem(at indexPath:IndexPath) -> FavAdvert
    func deleteFavAdvertAction(index:Int)
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
            if favAdverts.isEmpty {
                view?.favListMessage(isHidden: false, message: "No Data")
            }else{
                view?.favListMessage(isHidden: true, message: "")
            }
            view?.reloadCollectionView()
        }catch {
            favAdverts = []
            view?.favListMessage(isHidden: false, message: "Something went wrong")
            view?.reloadCollectionView()
        }
    }
    
    
    //MARK: - Delete FavAdvert
    private func deleteFavAdvert(id:Int) async {
        do {
            try await interactor.deleteFavAdvert(id: id)
            view?.reloadCollectionView()
        }catch{
            
        }
    }
    
    func viewDidload(userId:Int) {
        view?.setBackColorAble(color: .white)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
        
        Task{
            @MainActor in
            await fetchFavAdverts(userId:1)
        }
        
        view?.prepareCollectionView()
        view?.reloadCollectionView()
    }
    
    func viewWillAppear() {
        view?.tabbarisHidden(isHidden: false)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
        
    }
    
    func deleteFavAdvertAction(index: Int) {
        let id = favAdverts[index].id
        Task {
            @MainActor in
            await deleteFavAdvert(id:id)
            await fetchFavAdverts(userId: 1)
        }
        view?.reloadCollectionView()
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
