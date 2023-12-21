import Foundation
import SnapKit
import UIKit

protocol OnboardingViewDelegate : AnyObject {
    func toHomePage()
    func createAccount()
}

final class OnboardView : UIView {
    private let title:String = "Paw"
    private let banner:String = "Find Best Your Friend"
    weak var delegate : OnboardingViewDelegate?
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 35, weight: .semibold)
        label.textColor = .red
        return label
    }()
    
    private lazy var onboardImageView : UIImageView = {
        let image = UIImageView()
        image.image = OnboardingModuleAsset.paw.image
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var banerLabel : UILabel = {
        let label = UILabel()
        label.text = banner
        label.font = .systemFont(ofSize: 35, weight: .semibold)
        label.textColor = .red
        return label
    }()
    
    private lazy var createAcoount : UIButton = {
        let button = UIButton()
        button.setTitle("Account Action", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.addAction(createAccountButtonAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var createAccountButtonAction : UIAction =  UIAction { _ in
        self.delegate?.createAccount()
    }

    private lazy var toHomePageButton : UIButton = {
        let button = UIButton()
        button.setTitle("Continue without Account Action", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.addAction(toHomePageButtonAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var toHomePageButtonAction : UIAction =  UIAction { _ in
        self.delegate?.toHomePage()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(titleLabel)
        addSubview(onboardImageView)
        addSubview(banerLabel)
        addSubview(createAcoount)
        addSubview(toHomePageButton)
    
        onboardImageView.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.width.equalTo(snp.width).multipliedBy(0.5)
            make.height.equalTo(snp.height).multipliedBy(0.2)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(onboardImageView.snp.bottom).offset(20)
        }
        
        banerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        createAcoount.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
        }
        
        toHomePageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
            make.bottom.equalTo(createAcoount.snp.top).offset(-10)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    
    
    
    
    
}



