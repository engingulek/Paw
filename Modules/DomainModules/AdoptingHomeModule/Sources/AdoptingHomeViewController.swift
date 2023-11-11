
import UIKit
import CommonKit
import SnapKit
typealias Ables = UIViewControllerAble & NavConAble


protocol AdoptingHomeViewControllerInterfaca : AnyObject,Ables {
    
}

final class AdoptingHomeViewController: UIViewController,AdoptingHomeViewControllerInterfaca{
    lazy var presenter : AdoptinHomePresenterInterface = AdoptinHomePresenter(view: self)
    private lazy var  adoptingHeaderView = AdoptingHeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidload()
        navigationController?.navigationBar.isHidden  = true
        configureData()
    }
    
    private func configureData(){
        view.addSubview(adoptingHeaderView)
        adoptingHeaderView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        } 
    }
}





