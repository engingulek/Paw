
import UIKit
import CommonKit
import SnapKit

final class AdvertDetailInfoView : UIView {
    
    private lazy var animalName : UILabel = {
        let label = UILabel()
        label.text = "Leo"
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var favIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .red
        return imageView
    }()
    
    private lazy var animalAge : UILabel = {
        let label = UILabel()
        label.text = "3 years Old"
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
        textView.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has "
        textView.font = .systemFont(ofSize: 15, weight: .medium)
        textView.textAlignment = .center
        textView.textColor = .black
        textView.isEditable = false
        return textView
    }()
    
    private lazy var sendMessageButton : UIButton = {
        let button = UIButton()
        button.setTitle("Send Message", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(animalName)
        addSubview(favIcon)
        addSubview(animalAge)
        addSubview(genderLabel)
        addSubview(locationInfo)
        addSubview(infoTitle)
       addSubview(animalInfo)
        addSubview(sendMessageButton)
        
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
        
        animalAge.snp.makeConstraints { make in
            make.top.equalTo(animalName.snp.bottom).offset(5)
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
            make.bottom.equalTo(sendMessageButton.snp.top)
        }
        
        sendMessageButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
