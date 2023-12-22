import Foundation
import SnapKit
import UIKit

protocol OnboardingViewDelegate : AnyObject {
    func toHomePage()
}

final class OnboardView : UIView {
    private let title:String = "Paw"
    private let banner:String = "Find Best Your Friend"
    private let contiuneButtonTitle = "Continue without Account Action"
    weak var delegate : OnboardingViewDelegate?
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = title
        label.font = Theme.defaultTheme.themeFont.headline.boldVersion
        label.textColor = Theme.defaultTheme.themeColor.labelUIColor
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
        label.font = Theme.defaultTheme.themeFont.headline.boldVersion
        label.textColor = Theme.defaultTheme.themeColor.labelUIColor
        return label
    }()
    
    private lazy var toHomePageButton : UIButton = {
        let button = UIButton()
        button.setTitle(contiuneButtonTitle, for: .normal)
        button.backgroundColor = Theme.defaultTheme.themeColor.primaryBackColor
        button.setTitleColor(Theme.defaultTheme.themeColor.labelUIColor, for: .normal)
        button.layer.borderColor = Theme.defaultTheme.themeColor.primaryBorderColor
        button.addAction(toHomePageButtonTapped, for: .touchUpInside)
        return button
    }()
    
    private lazy var toHomePageButtonTapped : UIAction =  UIAction { _ in
        self.delegate?.toHomePage()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    //MARK: ConfigureUI
    private func configureUI(){
        addSubview(titleLabel)
        addSubview(onboardImageView)
        addSubview(banerLabel)
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
        
        toHomePageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
            make.bottom.equalTo(snp.bottom).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



