
import Foundation
import SnapKit
import UIKit


protocol AdoptingHeaderViewDelegate {
    func searchTextFieldDidChange(text:String)
}

final class AdoptingHeaderView : UIView {
    var delegate : AdoptingHeaderViewDelegate?
    private lazy var userImageView : UIImageView = {
        let image = UIImageView()
        image.image = AdoptingHomeModuleAsset.paw.image
        image.layer.borderWidth = 1.0
        image.layer.masksToBounds =  false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var userNameSurname : UILabel = {
        let label = UILabel()
        label.text = "Engin Gülek"
        label.font = .systemFont(ofSize: 18,weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var searchUIView : UIView = {
        let view = UIView()
        view.backgroundColor = AdoptingHomeModuleAsset.searhViewBack.color
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var searchTextField : UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.placeholder = "Search Pet"
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let image = UIImage(systemName: "magnifyingglass")?.withTintColor(.lightGray,renderingMode: .alwaysOriginal)
        imageView.image = image
        textField.leftView = imageView
        textField.addTarget(self, action: #selector(searchTextFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var filterButton : UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.buttonSize = .large
        filled.image = UIImage(systemName: "slider.horizontal.3")?.withTintColor(.red,renderingMode: .alwaysOriginal)
        filled.baseBackgroundColor = .white
        filled.imagePlacement = .trailing
        filled.imagePadding = 5
        let button = UIButton(configuration: filled, primaryAction: nil)
        button.addAction(filterButtonAction, for: .touchUpInside)
        return button
    }()
    
    
    
    private lazy var badgeLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 235/255, green: 68/255, blue: 90/255, alpha: 1)
        label.layer.masksToBounds = true
        label.text = "1"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        label.layer.cornerRadius = 10
        return label
    }()
    
    
    private lazy var filterButtonAction : UIAction =  UIAction { _ in
        print("filter button title action")
        
    }
    
    @objc func searchTextFieldDidChange(_ textField: UITextField) {
        guard let searchText = textField.text else {
            delegate?.searchTextFieldDidChange(text: "")
            return
        }
        delegate?.searchTextFieldDidChange(text: searchText)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        confifureUI()
        
      
        
    }
    
    private func confifureUI(){
        addSubview(userImageView)
        addSubview(userNameSurname)
        addSubview(searchUIView)
        searchUIView.addSubview(searchTextField)
        addSubview(filterButton)
        filterButton.addSubview(badgeLabel)
        
        userImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        userNameSurname.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalTo(userImageView.snp.centerY)
        }
        
        searchUIView.snp.makeConstraints { make in
            make.top.equalTo(userNameSurname.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(25)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
        }
        
        filterButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchUIView.snp.centerY)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        badgeLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-4)
            make.top.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
