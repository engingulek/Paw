
import Foundation
import UIKit
import CommonKit
import SnapKit

typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble

protocol MessageUserListControlllerInterface : AnyObject,Ables{
    var presenter : MessageUserListPresenterInterface {get}
    
     func prepareTableView()
     func reloadTableView()
}

final class MessageUserListControlller : UIViewController {
    
    lazy var presenter : MessageUserListPresenterInterface = MessageUserListPresenter(view: self)
    
    private lazy var messageUserListTableView :  UITableView = {
        let tableView = UITableView()
        tableView.register(MessageUserListTableViewCell.self, forCellReuseIdentifier: MessageUserListTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(messageUserListTableView)
        messageUserListTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension MessageUserListControlller : UITableViewDelegate,UITableViewDataSource {
  
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = messageUserListTableView.dequeueReusableCell(
                withIdentifier: MessageUserListTableViewCell.identifier,
                for: indexPath) as? MessageUserListTableViewCell
            else {return UITableViewCell()}
            return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect()
    }
    
    
}

extension MessageUserListControlller : MessageUserListControlllerInterface  {
    func prepareTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            messageUserListTableView.delegate = self
            messageUserListTableView.dataSource = self
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            messageUserListTableView.reloadData()
        }
    }
}
