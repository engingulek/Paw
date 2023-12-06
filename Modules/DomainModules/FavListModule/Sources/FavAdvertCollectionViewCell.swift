import UIKit
import SnapKit
import Kingfisher


protocol FavAdvertCollectionViewCellDelegate {
    func selectedFavIcon(index:Int)
}


final class FavAdvertCollectionViewCell : UICollectionViewCell {
    static let identifier : String = "favAdvertCollectionViewCell"
    var delegate : FavAdvertCollectionViewCellDelegate?
    var indexPathItem : Int?
    private lazy var advertImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var favIcon : UIButton = {
        let button = UIButton ()
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .red
        button.setTitleColor(.red, for: .normal)
        button.addAction(favIconAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var favIconAction: UIAction = UIAction { _ in
        guard let item = self.indexPathItem else {return}
        self.delegate?.selectedFavIcon(index: item)
    }
    
    private lazy var animalName : UILabel = {
        let label = UILabel()
        label.text = "Blue"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18,weight: .semibold)
        return label
    }()
    
    private lazy var genusLabel : UILabel = {
        let label = UILabel()
        label.text = "Buldog,Dog"
        label.font = .systemFont(ofSize: 15,weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var animalInfoView : UIView  = {
       let uiView = UIView()
        uiView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        uiView.clipsToBounds = true
        uiView.layer.cornerRadius = 10
        uiView.layer.maskedCorners = [.layerMaxXMaxYCorner
                                      ,.layerMinXMaxYCorner]
        return uiView
    }()
    
    
   

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
       
    }
    
    private func configureUI(){
        addSubview(advertImageView)
        advertImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        contentView.addSubview(favIcon)
        favIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        addSubview(animalInfoView)
        animalInfoView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(contentView.frame.height / 4)
        }
        
        animalInfoView.addSubview(animalName)
        animalName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
        }
        animalInfoView.addSubview(genusLabel)
        genusLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.leading.equalToSuperview().offset(5)
        }
    
        
    }
    
    
    func configureData(favAdvert:FavAdvert){
        let urlImage = URL(string: favAdvert.images.first ?? "" )
        
        advertImageView.kf.setImage(
            with: urlImage,
        placeholder: UIImage(systemName: "pawprint.fill"),
        options: [
            .transition(.fade(1))
        ]
        )
        
        animalName.text = favAdvert.name
        genusLabel.text = "\(favAdvert.genus)/\(favAdvert.category)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
