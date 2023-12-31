
import Foundation
import SnapKit
import UIKit


protocol AdoptingHeaderViewDelegate {
    func searchTextFieldDidChange(text:String)
    func selectedFilterButton()
    func selectedDecreasingButton()
    func selectedGrowingButton()
    
}

final class AdoptingHeaderView : UIView {
    var delegate : AdoptingHeaderViewDelegate?
    private lazy var appIcon : UIImageView = {
        let image = UIImageView()
        image.image = AdoptingHomeModuleAsset.paw.image
        image.layer.masksToBounds =  false
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        return image
    }()
    
   
    
    private lazy var searchUIView : UIView = {
        let view = UIView()
        view.backgroundColor = AdoptingHomeModuleAsset.searhViewBack.color
        view.layer.cornerRadius = CornerRadius.small.rawValue
        return view
    }()
    
    private lazy var searchTextField : UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.placeholder = "Search Pet"
        let imageView = UIImageView(
            frame: CGRect(x: 0, y: 0,
                          width: 30, height: 30))
        let image = UIImage(systemName: "magnifyingglass")?
            .withTintColor(.lightGray,renderingMode: .alwaysOriginal)
        imageView.image = image
        textField.leftView = imageView
        textField.addTarget(self, action: #selector(searchTextFieldDidChange), 
                        for: .editingChanged)
        return textField
    }()
    
    private lazy var filterButton : UIButton = {
        let button = UIButton()
        button.setTitle("Filter", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(Theme.defaultTheme.themeColor.labelUIColor,
                             for: .normal)
        button.layer.borderColor = Theme.defaultTheme.themeColor.primaryBorderColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = CornerRadius.small.rawValue
        button.addAction(filterButtonTapped, for: .touchUpInside)
        return button
    }()
    
    
    private lazy var filterButtonTapped : UIAction =  UIAction { _ in
        self.delegate?.selectedFilterButton()
        
    }
    
    private lazy var decreasingMenuButton : UIAction = UIAction(title: "Decreasing") { _ in
        self.delegate?.selectedDecreasingButton()
    }
    
    private lazy var growingMenuButton : UIAction = UIAction(title: "Growing") { _ in
        self.delegate?.selectedGrowingButton()
    }
    
    private lazy var sortMenu = UIMenu(
        title: "Age Sort",
        options: .displayInline,
        children: [decreasingMenuButton,growingMenuButton])
    
    
    private lazy var sortButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sort", for: .normal)
        button.backgroundColor = Theme.defaultTheme.themeColor.primaryBackColor
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = Theme.defaultTheme.themeColor.primaryBorderColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = CornerRadius.small.rawValue
        button.menu = sortMenu
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    
  
    
    private lazy var actionButttonStackViews : UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [sortButton,filterButton])
        stackView.axis = .horizontal
        stackView.distribution  = .fillEqually
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
        
    }()

    
    @objc func searchTextFieldDidChange(_ textField: UITextField) {
        guard let searchText = textField.text else {
            delegate?.searchTextFieldDidChange(text: "")
            return
        }
        delegate?.searchTextFieldDidChange(text: searchText)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        confifureUI()
    }
    
    private func confifureUI(){
        addSubview(appIcon)
        addSubview(searchUIView)
        searchUIView.addSubview(searchTextField)
        addSubview(actionButttonStackViews)
        
        appIcon.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        searchUIView.snp.makeConstraints { make in
            make.top.equalTo(appIcon.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        
        actionButttonStackViews.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(searchUIView.snp.bottom).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
