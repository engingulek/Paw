


import Foundation
import SnapKit
import UIKit


final class FilterTableViewCell :   UITableViewCell {
    static let identifier = "FilterTableViewCell"
    
    private lazy var filterTitle : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20,weight: .medium)
        label.text = "Test"
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(filterTitle)
       

        filterTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        
    }
    
    
    func configureData(filterText:String){
        filterTitle.text = filterText
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


/*import Foundation
import SnapKit
import UIKit


final class FilterTableViewCell :   UITableViewCell {
    static let identifier = "FilterTableViewCell"
    
    private lazy var filterTitle : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        label.text = "Test"
        label.textColor = .black
        return label
    }()
    
    
    private lazy var selectedFilter : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15,weight: .medium)
        label.text = "Test"
        label.textColor = .red
        return label
    }()
    
    private lazy var testView : UIView = {
       let uiView = UIView()
        uiView.backgroundColor = .red
        return uiView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(filterTitle)
        contentView.addSubview(selectedFilter)

        filterTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(20)
        }
        
        selectedFilter.snp.makeConstraints { make in
            make.top.equalTo(filterTitle.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}*/
