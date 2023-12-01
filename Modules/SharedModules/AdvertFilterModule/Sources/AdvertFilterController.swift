


import UIKit
import SnapKit
import CommonKit
import ModelKit



typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble

protocol AdvertFilterControllerInterface : AnyObject,Ables {
    var presenter : AdvertFilterPresenterInterface {get}
    func prepareTableView()
    func reloadTableView()
    func applyButton(opacity:Float,isEnabled:Bool,title:String)
}



final class AdvertFilterController: UIViewController {
    lazy var presenter : AdvertFilterPresenterInterface = AdvertFilterPresenter(view: self)
    var adoptingAdverts: [AdoptingAdvert]?
    private lazy var filterTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(FilterTableViewCell.self, forCellReuseIdentifier: FilterTableViewCell.identifier)
        tableView.allowsMultipleSelection = true
        tableView.tableFooterView =  footerViewForFilterTableViewUIView
        return tableView
    }()
    
    private lazy var footerViewForFilterTableViewUIView : UIView = {
        let uiView = UIView(frame: CGRectMake(0, 0, 200, 80))
        uiView.backgroundColor = .white
        return uiView
    }()
    
    private lazy var applyButton : UIButton = {
        let button = UIButton()
        button.setTitle("Apply", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.addAction(applyButtonAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var applyButtonAction : UIAction =  UIAction { _ in
        self.presenter.toAdoptingHomeViewController()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let list = adoptingAdverts ?? []
        presenter.viewDidLoad(adoptingAdverts: list)
        configureUI()
        
    }
    
    private func configureUI() {
        view.addSubview(filterTableView)
        filterTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        footerViewForFilterTableViewUIView.addSubview(applyButton)
        applyButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(150)
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
    
    func applyButton(
        opacity: Float,
        isEnabled: Bool,
        title:String) {
            applyButton.layer.opacity = opacity
            applyButton.isEnabled = isEnabled
            applyButton.setTitle(title, for: .normal)
        
    }
}


