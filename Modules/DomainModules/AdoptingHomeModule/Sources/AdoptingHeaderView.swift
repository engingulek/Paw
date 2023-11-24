
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
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "magnifyingglass")?.withTintColor(.lightGray,renderingMode: .alwaysOriginal)
        imageView.image = image
        textField.leftView = imageView
        textField.addTarget(self, action: #selector(searchTextFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var filterButton : UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "slider.horizontal.3")?.withTintColor(.lightGray,renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addAction(filterButtonAction, for: .touchUpInside)
        return button
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
        addSubview(userImageView)
        addSubview(userNameSurname)
        addSubview(searchUIView)
        searchUIView.addSubview(searchTextField)
        searchUIView.addSubview(filterButton)
        
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
            make.trailing.equalToSuperview().offset(-25)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(filterButton.snp.leading).offset(-5)
        }
        
        filterButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
