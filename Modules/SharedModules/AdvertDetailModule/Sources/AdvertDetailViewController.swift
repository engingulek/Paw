import UIKit
import CommonKit
import SnapKit
typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble

protocol AdvertDetailViewControllerInterface: AnyObject ,Ables {
    func configureData(advertDetail: AdvertDetail)
    func alertMessage(title:String,message:String)
    
    func changeOpacityWhenSelectedImageOne(opacity:Float,defaultOpacity:Float)
    func changeOpacityWhenSelectedImageTwo(opacity:Float,defaultOpacity:Float)
    func changeOpacityWhenSelectedImageThree(opacity:Float,defaultOpacity:Float)
}

final class AdvertDetailViewController: UIViewController{
    
    var advertId : Int?
    lazy var presenter: AdvertDetailPresenterInterface = AdvertDetailPresenter(view: self)
    private lazy var detailImageView = AdvertDetailImagesImages()
    private lazy var detailInfoView = AdvertDetailInfoView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.delegate = self
        detailInfoView.delegate = self
        guard let advertId = advertId else {return}
        presenter.viewDidLoad(advertId: advertId, userId: 1)
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
    
    
}

extension AdvertDetailViewController : AdvertDetailViewControllerInterface  {
  
    
    func configureData(advertDetail:AdvertDetail){
       
        DispatchQueue.main.async {[weak self] in
            guard let self = self else { return }
            self.detailInfoView.configureData(advertDetail: advertDetail)
            self.detailImageView.configureData(imageList: advertDetail.images)
        }
       
    }
    
    
    func alertMessage(title:String,message:String) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else { return }
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    func changeOpacityWhenSelectedImageOne(opacity: Float, defaultOpacity: Float) {
        detailImageView.changeOpacityImageOne(opacity: opacity, defaultOpacity: defaultOpacity)
    }
    
    func changeOpacityWhenSelectedImageTwo(opacity: Float, defaultOpacity: Float) {
        detailImageView.changeOpacityImageTwo(opacity: opacity, defaultOpacity: defaultOpacity)
    }
    
    func changeOpacityWhenSelectedImageThree(opacity: Float, defaultOpacity: Float) {
        detailImageView.changeOpacityImageThree(opacity: opacity, defaultOpacity: defaultOpacity)
    }
}

//MARK: - AdvertDetailImagesImagesDelegate
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

extension AdvertDetailViewController: AdvertDetailInfoViewDelegate {
   
    func selectedFavIcon() {
        guard let advertId = advertId else {return}
        presenter.favIconAction(advertId: advertId, userId: 1)
    }
    
   
    
}


