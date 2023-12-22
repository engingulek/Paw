
import UIKit
import CommonKit
import SnapKit
import Kingfisher

protocol AdvertDetailInfoViewDelegate {
    func selectedFavIcon()
  
}


final class AdvertDetailInfoView : UIView {
    
    var delegate : AdvertDetailInfoViewDelegate?
    private lazy var animalName : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var favIcon : UIButton = {
        let button = UIButton ()
      
        button.tintColor = .red
        button.setTitleColor(.red, for: .normal)
        button.addAction(favIconAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var favIconAction: UIAction = UIAction { _ in
        //guard let item = self.indexPathItem else {return}
        self.delegate?.selectedFavIcon()
    }
    
    
    private lazy var userImage : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    private lazy var userNameSurname : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var animalAge : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var genderLabel : UILabel = {
        let label = UILabel()
        label.text = "♂"
        label.font = .systemFont(ofSize: 30,weight: .semibold)
        return label
    }()
    
    private lazy var locationInfo : UILabel = {
        let label = UILabel()
        label.text = "Taksim/Istanbul"
        label.font = .systemFont(ofSize: 15,weight: .semibold)
        return label
    }()
    
    private lazy var infoTitle : UILabel = {
        let label = UILabel()
        label.text = "About"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var animalInfo : UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.font = .systemFont(ofSize: 15, weight: .medium)
        textView.textAlignment = .center
        textView.textColor = .black
        textView.isEditable = false
        return textView
    }()
    
   
    
  
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(animalName)
        addSubview(favIcon)
        addSubview(userImage)
        addSubview(userNameSurname)
        addSubview(animalAge)
        addSubview(genderLabel)
        addSubview(locationInfo)
        addSubview(infoTitle)
       addSubview(animalInfo)
        
        
        animalName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        favIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        userImage.snp.makeConstraints { make in
            make.top.equalTo(animalName.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        userNameSurname.snp.makeConstraints { make in
            make.centerY.equalTo(userImage.snp.centerY)
           // make.top.equalTo(animalName.snp.bottom).offset(5)
            make.leading.equalTo(userImage.snp.trailing).offset(20)
        }
        
        animalAge.snp.makeConstraints { make in
            make.top.equalTo(userImage.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(animalAge.snp.top)
            make.bottom.equalTo(animalAge.snp.bottom)
            make.leading.equalTo(animalAge.snp.trailing).offset(15)
        }
        
        locationInfo.snp.makeConstraints { make in
            make.top.equalTo(animalAge.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
        }
        
        infoTitle.snp.makeConstraints { make in
            make.top.equalTo(locationInfo.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        animalInfo.snp.makeConstraints { make in
            make.top.equalTo(infoTitle.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-30)
        }
        
    }
    func configureData(advertDetail:AdvertDetail){
        animalName.text = advertDetail.name
        userNameSurname.text = "\(advertDetail.userName) \(advertDetail.userSurname)"
        animalAge.text = "\(advertDetail.age) years old"
        let gender = advertDetail.gender ==
        "male" ? "♂" :"♀"
        genderLabel.text = gender
        locationInfo.text = "\(advertDetail.city)"
        animalInfo.text =  advertDetail.about
        let urlImage = URL(string: advertDetail.userImage)
        
        userImage.kf.setImage(
            with: urlImage,
            placeholder: UIImage(systemName: "person.circle")?.withTintColor(.red),
        options: [
            .transition(.fade(1))
        ]
            )
        
        favIcon.setImage(UIImage(systemName: advertDetail.favStatus ? "heart.fill" : "heart"), for: .normal)
        favIcon.isHidden = advertDetail.userId == 1 ? true : false

       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
