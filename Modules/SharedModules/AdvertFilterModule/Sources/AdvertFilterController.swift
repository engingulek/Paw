

import UIKit
import SnapKit
import CommonKit

typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble

protocol AdvertFilterControllerInterface : AnyObject,Ables {
    var presenter : AdvertFilterPresenterInterface {get}
    func prepareTableView()
    func reloadTableView()
}


final class AdvertFilterController: UIViewController {
    lazy var presenter : AdvertFilterPresenterInterface = AdvertFilterPresenter(view: self)
    
    private lazy var filterTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(FilterTableViewCell.self, forCellReuseIdentifier: FilterTableViewCell.identifier)
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.addSubview(filterTableView)
        filterTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}


//MARK: FilterTableViewDelegate And Datasource


extension AdvertFilterController :UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FilterTableViewCell.identifier, for: indexPath) as? FilterTableViewCell else {return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension AdvertFilterController : AdvertFilterControllerInterface {
    func prepareTableView() {
        filterTableView.delegate = self
        filterTableView.dataSource = self
    }
    
    func reloadTableView() {
        filterTableView.reloadData()
    }
}
