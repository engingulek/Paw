import UIKit
import SnapKit
class SectionHeader: UICollectionReusableView {
    
    
    private lazy var label: UILabel = {
         let label: UILabel = UILabel()
         label.textColor = .black
         label.font  = .systemFont(ofSize: 22, weight: .bold)
         label.sizeToFit()
         return label
     }()
    
     override init(frame: CGRect) {
         super.init(frame: frame)

         addSubview(label)
         label.snp.makeConstraints { make in
             make.leading.equalToSuperview().offset(20)
             make.centerY.equalToSuperview()
           
         }
    }
    
    func configureData(text:String){
        label.text = text
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

