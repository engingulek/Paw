
import Foundation
import ModelKit
import Combine
private struct FilterData{
    let title:String
    let filters : [String]
    
    static let filterDatas : [FilterData] = [
        .init(title: "Gender", filters: ["Male","Female"]),
        .init(title: "City", filters: ["Ankara","Istanbul","Izmir"])
    ]
}

protocol AdvertFilterPresenterInterface {
    var view : AdvertFilterControllerInterface? {get set}
    var router : AdvertFilterRouterInterface? {get set}
    func viewDidLoad(adoptingAdverts:[AdoptingAdvert])
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
    func toAdoptingHomeViewController()
}


final class AdvertFilterPresenter  {
    var view: AdvertFilterControllerInterface?
    var router: AdvertFilterRouterInterface?
    
    private var genderList : [String] = []
    private var cityList : [String] = []
    private var listAdverts: [AdoptingAdvert] = []
    private var filterAdversList : [AdoptingAdvert] = []
    
    init(view: AdvertFilterControllerInterface?, router: AdvertFilterRouterInterface? = nil) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad(adoptingAdverts:[AdoptingAdvert]) {
        view?.setBackColorAble(color: .white)
        view?.setNavigationBarHidden(isHidden: false, animated: true)
        view?.tabbarisHidden(isHidden: true)
        view?.applyButton(opacity: 0.6, isEnabled: false,title: "Apply")
        listAdverts = adoptingAdverts
        view?.prepareTableView()
        view?.reloadTableView()
    }
    
    private func filterBygenderListAndCityList(){
        if genderList.isEmpty && cityList.isEmpty {
            view?.applyButton(opacity: 0.6, isEnabled: false,title: "Apply")
        }else{
            let list = listAdverts.filter { advert in
               (genderList.isEmpty ? true : genderList.description.lowercased().contains(advert.gender.lowercased()))
                &&
                (cityList.isEmpty ? true : cityList.description.lowercased().contains(advert.city.lowercased()))
            }
            filterAdversList =  list
            view?.applyButton(opacity: 1.0, isEnabled:true,title: "\(list.count) Apply")
        }
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
        filterBygenderListAndCityList()
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
        filterBygenderListAndCityList()
    }
    func toAdoptingHomeViewController() {
        router?.toAdoptinHomeViewControllerWithPopViewController(
            view: view,
            adoptingAdverts: filterAdversList)
    }
    
    
}

