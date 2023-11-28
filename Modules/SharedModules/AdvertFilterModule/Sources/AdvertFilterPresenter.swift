
import Foundation

private struct FilterData{
    let title:String
    let filters : [String]
    
    static let filterDatas : [FilterData] = [
        .init(title: "Gender", filters: ["Male","Female"]),
        .init(title: "City", filters: ["Ankara","İstabul","İzmir"])
    ]
}

protocol AdvertFilterPresenterInterface {
    var view : AdvertFilterControllerInterface? {get set}
    var router : AdvertFilterRouter? {get set}
    func viewDidLoad()
    func numberOfSections() -> Int
    func numberOfRowsInSection(at section:Int) -> Int
   func forHeaderInSection(at section:Int) -> String
    func heightForHeaderInSection() -> CGFloat
    func  heightForRowAt() -> CGFloat
    func cellForRowAt(
        at indexPath: IndexPath
        ) -> String
    
    func didSelectRow(at indexPath:IndexPath)
    func deSelectRow(at indexPath:IndexPath)
}


final class AdvertFilterPresenter  {
    var view: AdvertFilterControllerInterface?
    var router: AdvertFilterRouter?
    
    private var genderList : [String] = []
    private var cityList : [String] = []
    
    init(view: AdvertFilterControllerInterface?, router: AdvertFilterRouter? = nil) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
        view?.setNavigationBarHidden(isHidden: false, animated: true)
        view?.tabbarisHidden(isHidden: true)
    
        view?.prepareTableView()
        view?.reloadTableView()
    }
}


extension AdvertFilterPresenter  : AdvertFilterPresenterInterface {
   
    func numberOfSections() -> Int {
        return FilterData.filterDatas.count
    }
    
    func numberOfRowsInSection(at section:Int) -> Int {
        return   FilterData.filterDatas[section].filters.count
    }
    
    func cellForRowAt(
        at indexPath: IndexPath) -> String {
            let text : String
            let filters = FilterData.filterDatas[indexPath.section].filters
            text =  filters[indexPath.item]
            return text
    }
    
    func forHeaderInSection(at section:Int) -> String {
        return FilterData.filterDatas[section].title
    }
    
    func heightForHeaderInSection() -> CGFloat {
        return 40
    }
    
    func heightForRowAt() -> CGFloat {
        return 60
    }
    
    func didSelectRow(at indexPath:IndexPath)  {
        let selected = FilterData.filterDatas[indexPath.section].filters[indexPath.row]
        if indexPath.section == 0 {
            genderList.append(selected)
        }else if indexPath.section == 1{
            cityList.append(selected)
        }else{
            return
        }
    }
    func deSelectRow(at indexPath:IndexPath)  {
        let selected = FilterData.filterDatas[indexPath.section].filters[indexPath.row]
        if indexPath.section == 0 {
            guard let index = genderList.firstIndex(of: selected) else {return}
            genderList.remove(at: index)
        }else if indexPath.section == 1{
            guard let index = cityList.firstIndex(of: selected) else {return}
            cityList.remove(at: index)
        }else{
            return
        }
    }
}

