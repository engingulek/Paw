import UIKit
import CommonKit
import SnapKit
typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble

protocol AdvertDetailViewControllerInterface: AnyObject ,Ables {
    var presenter : AdvertDetailPresenterInterface {get set}
}

final class AdvertDetailViewController: UIViewController,AdvertDetailViewControllerInterface {
    lazy var presenter: AdvertDetailPresenterInterface = AdvertDetailPresenter(view: self,advertDetailImageView: detailImageView)
    private lazy var detailImageView = AdvertDetailImagesImages()
    private lazy var detailInfoView = AdvertDetailInfoView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.delegate = self
        presenter.viewDidLoad()
        let list : [String] = ["1.square","2.square","3.square"]
        detailImageView.configureData(baseImageViewName: "1.square", imageList: list)
        configureData()
    }
    
    private func configureData(){
        view.addSubview(detailImageView)
        view.addSubview(detailInfoView)
        detailImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(UIScreen.main.bounds.height / 3)
        }
        
        detailInfoView.snp.makeConstraints { make in
            make.top.equalTo(detailImageView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension AdvertDetailViewController : AdvertDetailImagesImagesDelegate {
   
    
    func selectedImageOne() {
        print("A")
        presenter.selectedADIOne()
    }
    
    func selectedImageTwo() {
        print("B")
        presenter.selectedADITwo()
    }
    
    func selectedImageThree() {
        print("C")
        presenter.selectedADIThree()
    }
    
    
}


