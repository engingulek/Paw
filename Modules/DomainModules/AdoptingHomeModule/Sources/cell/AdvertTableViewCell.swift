
import UIKit
import SnapKit
import Kingfisher


final class AdvertTableViewCell : UITableViewCell {
    static let identifier = "AdvertTableViewCell"
    
    private lazy var advertImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = AdoptingHomeModuleAsset.dog.image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25,weight: .semibold)
        return label
    }()
    
    private lazy var ageLabel : UILabel = {
        let label = UILabel()
        label.text = "2 years old"
        label.font = .systemFont(ofSize: 13,weight: .semibold)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var genusLabel : UILabel = {
        let label = UILabel()
        label.text = "Buldog,Dog"
        label.font = .systemFont(ofSize: 15,weight: .semibold)
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
    

   
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(advertImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(genderLabel)
        contentView.addSubview(genusLabel)
        contentView.addSubview(locationInfo)
      
        
        contentView.layer.cornerRadius = 10
       // contentView.layer.borderColor = UIColor.black.cgColor
       // contentView.layer.borderWidth = 1
        advertImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(advertImageView.snp.top)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(advertImageView.snp.trailing).offset(10)
            make.top.equalTo(advertImageView.snp.top)
        }
        
        genusLabel.snp.makeConstraints { make in
            make.leading.equalTo(advertImageView.snp.trailing).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.leading.equalTo(advertImageView.snp.trailing).offset(10)
            make.top.equalTo(genusLabel.snp.bottom).offset(10)
        }
        
        locationInfo.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalTo(advertImageView.snp.trailing).offset(10)
        }
        
    }
    
    func configureData(advert : AdoptingAdvert){
        nameLabel.text = advert.name
        ageLabel.text = "\(advert.age) years old"
        genusLabel.text = "\(advert.genus),\(advert.category)"
        let gender = advert.gender == 
        "male" ? "♂" :"♀"
        genderLabel.text = gender
        locationInfo.text = "\(advert.city)/\(advert.district)"
        
        let urlImage = URL(string: advert.images.first ?? "")
        
        advertImageView.kf.setImage(
            with: urlImage,
        placeholder: UIImage(systemName: "pawprint.fill"),
        options: [
            .transition(.fade(1))
        ]
        )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace: CGFloat = 10.0 // Let's assume the space you want is 10
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: bottomSpace, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
