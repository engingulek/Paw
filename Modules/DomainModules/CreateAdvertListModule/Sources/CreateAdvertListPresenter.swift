
import Foundation
import ModelKit

protocol CreateAdvertListPresenterInterface {
    var view : CreateAdvertListViewControllerInterface? {get}
    var router : CreateAdvertListRouterInterface? {get}
    var interactor : CreateAdvertListInteractorInterface {get}
    
    func viewDidLoad()
    func viewWillAppear()
    func numberOfItems() -> Int
    func cellForItem(at indexPath:IndexPath) -> AdoptingAdvert
    func selectedTrashIcon(index:Int)
}

final class CreateAdvertListPresenter : CreateAdvertListPresenterInterface {
   weak var view: CreateAdvertListViewControllerInterface?
    var router: CreateAdvertListRouterInterface?
    var interactor: CreateAdvertListInteractorInterface
    
    private var createAdvertList:[AdoptingAdvert] = []
    
    init(view: CreateAdvertListViewControllerInterface? , router: CreateAdvertListRouterInterface? = nil, interactor: CreateAdvertListInteractorInterface = CreateAdvertListInteractor.shared) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    //MARK: Fetch CreateAdvertList
    private func fetchCreateAdvertList() async {
        do {
            let result = try await interactor.fetchCreateAdverts(userId: 1)
            createAdvertList = result 
            if createAdvertList.isEmpty{
                view?.createMessage(isHidden: false, message: "No Data")
            }else{
                view?.createMessage(isHidden: true, message: "")
            }
            view?.reloadCollectionView()
        }catch{
            createAdvertList = []
            view?.createMessage(isHidden: false, message: "Something went wrong")
            view?.reloadCollectionView()
        }
    }
    
    private func deleteAdvert(id:Int) async{
        do{
            try await interactor.deleteAdvertOfUser(id: id, userId: 1)
            //view?.reloadCollectionView()
        }catch{
            //TODO: Alert message
        }
    }
}


extension CreateAdvertListPresenter  {
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
        
        Task{
            @MainActor in
            await fetchCreateAdvertList()
        }
        
        view?.prepareCollectionView()
        view?.reloadCollectionView()
    }
    
    func viewWillAppear() {
        view?.tabbarisHidden(isHidden: false)
        view?.setNavigationBarHidden(isHidden: true, animated: true)
    }
    
    // MARK: For CollectionView
    func numberOfItems() -> Int {
        return createAdvertList.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> AdoptingAdvert {
        let createAdvert = createAdvertList[indexPath.item]
        return createAdvert
    }
    
    func selectedTrashIcon(index: Int) {
        let id = createAdvertList[index].id
        Task {
            @MainActor in
            await deleteAdvert(id:id)
            await fetchCreateAdvertList()
        }
    }
}



