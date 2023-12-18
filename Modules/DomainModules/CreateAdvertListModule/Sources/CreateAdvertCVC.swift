import UIKit
import SnapKit
import Kingfisher
import ModelKit


protocol CreateAdvertCollectionViewCellDelegate {
    func selectedTrashIcon(index:Int)
}


final class CreateAdvertCollectionViewCell : UICollectionViewCell {
    static let identifier : String = "createAdvertCollectionViewCell"
    var delegate : CreateAdvertCollectionViewCellDelegate?
    var indexPathItem : Int?
    private lazy var advertImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var trashIcon : UIButton = {
        let button = UIButton ()
        button.setImage(UIImage(systemName: "trash.square.fill"), for: .normal)
        button.tintColor = .red
        button.setTitleColor(.red, for: .normal)
        button.addAction(trashIconAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var trashIconAction: UIAction = UIAction { _ in
        guard let item = self.indexPathItem else {return}
        self.delegate?.selectedTrashIcon(index: item)
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
        
        contentView.addSubview(trashIcon)
        trashIcon.snp.makeConstraints { make in
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
    
    
    func configureData(createAdvert:AdoptingAdvert){
        let urlImage = URL(string: createAdvert.images.first ?? "" )
        
        advertImageView.kf.setImage(
            with: urlImage,
        placeholder: UIImage(systemName: "pawprint.fill"),
        options: [
            .transition(.fade(1))
        ]
        )
        
        animalName.text = createAdvert.name
        genusLabel.text = "\(createAdvert.genus)/\(createAdvert.category)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
