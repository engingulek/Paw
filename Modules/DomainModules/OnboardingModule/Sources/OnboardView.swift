import Foundation
import SnapKit
import UIKit

protocol OnboardingViewDelegate {
    func selectedAdoptinView()
}

final class OnboardView : UIView {
    private let title:String = "Paw"
    var delegate : OnboardingViewDelegate?
    
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
    
    private lazy var userNameSurname : UILabel = {
        let label = UILabel()
        label.text = "Welcome Engin Gülek"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var dogWalkView : UIView = {
        let uiView = UIView()
        uiView.layer.cornerRadius = 10
        uiView.layer.borderWidth = 1
        uiView.layer.borderColor = UIColor.red.cgColor
        return uiView
    }()
    
    private lazy var adoptingView : UIView = {
        let uiView = UIView()
        uiView.layer.cornerRadius = 10
        uiView.layer.borderWidth = 1
        uiView.layer.borderColor = UIColor.red.cgColor
        uiView.isUserInteractionEnabled = true
        return uiView
    }()
    
 
    
    private lazy var  dogWalkingLabel : UILabel = {
        let label = UILabel()
        label.text = "DogWalking"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .red
        return label
    }()
    
    private lazy var dogWalkingImageView : UIImageView = {
        let image = UIImageView()
        image.image = OnboardingModuleAsset.dogWalking.image
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var adoptingLabel : UILabel = {
        let label = UILabel()
        label.text = "Adopting"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .red
        return label
    }()
    
    private lazy var adoptingImageView : UIImageView = {
        let image = UIImageView()
        image.image = OnboardingModuleAsset.adopting.image
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        let uiScreenHeight = UIScreen.main.bounds.height
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(onboardImageView)
        addSubview(userNameSurname)
        addSubview(dogWalkView)
        addSubview(adoptingView)
        dogWalkView.addSubview(dogWalkingLabel)
        dogWalkView.addSubview(dogWalkingImageView)
        adoptingView.addSubview(adoptingImageView)
        adoptingView.addSubview(adoptingLabel)
        
        let actionTap = UITapGestureRecognizer(target: self, action: #selector(adoptinViewTap))
        adoptingView.addGestureRecognizer(actionTap)
        
       // addSubview(userNameSurname)
      //  addSubview(dogWalkView)
       // addSubview(adoptingView)
        
        onboardImageView.snp.makeConstraints { make in
           
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(uiScreenHeight * 0.15)
            make.width.equalTo(snp.width).multipliedBy(0.5)
            make.height.equalTo(snp.height).multipliedBy(0.2)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(onboardImageView.snp.bottom).offset(20)
        }
        
        userNameSurname.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        dogWalkView.snp.makeConstraints { make in
            make.top.equalTo(userNameSurname.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(snp.width).multipliedBy(0.4)
            make.height.equalTo(snp.height).multipliedBy(0.25)
        
        }
        
        adoptingView.snp.makeConstraints{ make in
            make.top.equalTo(userNameSurname.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(snp.width).multipliedBy(0.4)
            make.height.equalTo(snp.height).multipliedBy(0.25)
        
        }
        
        dogWalkingImageView.snp.makeConstraints { make in
           
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(snp.width).multipliedBy(0.15)
            make.height.equalTo(snp.height).multipliedBy(0.15)
        }
        dogWalkingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-25)
        }
        
        adoptingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(snp.width).multipliedBy(0.2)
            make.height.equalTo(snp.height).multipliedBy(0.15)
        }
        
        adoptingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-25)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func adoptinViewTap() {
        self.delegate?.selectedAdoptinView()
    }
  
    
    
    
    
    
    
}



