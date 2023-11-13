
import UIKit
import SnapKit

final class AdvertCollectionViewCell : UICollectionViewCell {
    static let identifier : String = "cell"
    
    private lazy var testLabel : UILabel = {
        let label = UILabel()
        label.text = "test"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(testLabel)
        testLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func configureData(category:Category){
        testLabel.text = category.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
