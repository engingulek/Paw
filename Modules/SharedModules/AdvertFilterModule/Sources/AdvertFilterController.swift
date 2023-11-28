


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
        tableView.allowsMultipleSelection = true
        return tableView
    }()
    var indexPathOfSelectedRowPaidBy: NSIndexPath?
    
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
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FilterTableViewCell.identifier, for: indexPath) as? FilterTableViewCell else {return UITableViewCell()}
        let item = presenter.cellForRowAt(at: indexPath)
        cell.configureData(filterText:item)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.heightForRowAt()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeader.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let title = presenter.forHeaderInSection(at: section)
        headerView.configureData(text: title)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return presenter.heightForHeaderInSection()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        presenter.didSelectRow(at: indexPath)
        
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        presenter.deSelectRow(at: indexPath)
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








/*import UIKit
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
}*/
