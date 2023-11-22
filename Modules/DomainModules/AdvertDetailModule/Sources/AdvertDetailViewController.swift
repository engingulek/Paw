import UIKit
import CommonKit
import SnapKit
typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble

protocol AdvertDetailViewControllerInterface: AnyObject ,Ables {
    var presenter : AdvertDetailPresenterInterface {get set}
    
    func configureData(advertDetail: AdvertDetail)
}

final class AdvertDetailViewController: UIViewController,AdvertDetailViewControllerInterface {
    
    var advertId : Int?
    
    lazy var presenter: AdvertDetailPresenterInterface = AdvertDetailPresenter(view: self,advertDetailImageView: detailImageView)
    private lazy var detailImageView = AdvertDetailImagesImages()
    private lazy var detailInfoView = AdvertDetailInfoView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.delegate = self
        
        guard let id = advertId else {return}
        presenter.viewDidLoad(id: id)
        
        let list : [String] = ["1.square","2.square","3.square"]
        detailImageView.configureData(baseImageViewName: "1.square", imageList: list)
        configureView()
    }
    
    private func configureView(){
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
    
    func configureData(advertDetail:AdvertDetail){
        print("Detail \(advertDetail.name)")
        DispatchQueue.main.async {
            self.detailInfoView.configureData(advertDetail: advertDetail)
        }
       
    }
}

extension AdvertDetailViewController : AdvertDetailImagesImagesDelegate {
   
    
    func selectedImageOne() {
        presenter.selectedADIOne()
    }
    
    func selectedImageTwo() {
        presenter.selectedADITwo()
    }
    
    func selectedImageThree() {
        presenter.selectedADIThree()
    }
    
    
}


