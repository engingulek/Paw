
import UIKit
import SnapKit

final class CategoryCollectionViewCell : UICollectionViewCell {
    static let identifier : String = "cell"
    
    private lazy var categoryLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func configureData(category:Category){
        categoryLabel.text = category.category
    }
    
    func configureCategoryLabel(color:UIColor){
        categoryLabel.textColor =  color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
