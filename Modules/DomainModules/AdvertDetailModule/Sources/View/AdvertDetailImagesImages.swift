

import Foundation
import SnapKit
import UIKit

protocol AdvertDetailImagesImagesInterface {
    func changeOpacityWhenSelectedImageOne(opacity:Float)
    func changeOpacityWhenSelectedImageTwo(opacity:Float)
    func changeOpacityWhenSelectedImageThree(opacity:Float)
}

protocol AdvertDetailImagesImagesDelegate {
    func selectedImageOne()
    func selectedImageTwo()
    func selectedImageThree()
}

final class AdvertDetailImagesImages : UIView {
    var delegate : AdvertDetailImagesImagesDelegate?
    private lazy var baseImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
   
    
    private lazy var advertDetailImageViewOne : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var advertDetailImageViewTwo : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.opacity = 0.5
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var advertDetailImageViewThree : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.opacity = 0.5
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var detailImagesUIView : UIView =   {
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 10
        return uiView
    }()
    
   
    
    func configureData(baseImageViewName : String,imageList:[String]){
        baseImageView.image = AdvertDetailModuleAsset.dog.image
        advertDetailImageViewOne.image = AdvertDetailModuleAsset.dog.image
        advertDetailImageViewTwo.image = AdvertDetailModuleAsset.dog.image
        advertDetailImageViewThree.image = AdvertDetailModuleAsset.dog.image
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
        let oneImageTap = UITapGestureRecognizer(target: self, action: #selector(selectedOneImage))
        advertDetailImageViewOne.addGestureRecognizer(oneImageTap)
        
        
        let twoImageTap = UITapGestureRecognizer(target: self, action: #selector(selectedTwoImage))
        advertDetailImageViewTwo.addGestureRecognizer(twoImageTap)
        
        let threeImageTap = UITapGestureRecognizer(target: self, action: #selector(selectedThreeImage))
        advertDetailImageViewThree.addGestureRecognizer(threeImageTap)
        
       
    }
    
  
    
    @objc private func selectedOneImage() {
        print("C")
        self.delegate?.selectedImageOne()
    }
    
    @objc private func selectedTwoImage() {
        self.delegate?.selectedImageTwo()
    }
    
    
    @objc private func selectedThreeImage() {
        self.delegate?.selectedImageThree()
    }
    
    private func configureView(){
        backgroundColor = .white
        addSubview(baseImageView)
        baseImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        baseImageView.addSubview(detailImagesUIView)
        detailImagesUIView.addSubview(advertDetailImageViewOne)
        detailImagesUIView.addSubview(advertDetailImageViewTwo)
        detailImagesUIView.addSubview(advertDetailImageViewThree)
        detailImagesUIView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalToSuperview().multipliedBy(0.25)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        advertDetailImageViewOne.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        
        advertDetailImageViewTwo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        
        advertDetailImageViewThree.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
       
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalToSuperview().multipliedBy(0.25)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AdvertDetailImagesImages : AdvertDetailImagesImagesInterface {
    func changeOpacityWhenSelectedImageOne(opacity:Float) {
        print("One")
        advertDetailImageViewOne.layer.opacity = opacity
        advertDetailImageViewTwo.layer.opacity = 1
        advertDetailImageViewThree.layer.opacity = 1
    }
    
    func changeOpacityWhenSelectedImageTwo(opacity:Float) {
        print("Two")
        advertDetailImageViewTwo.layer.opacity = opacity
        advertDetailImageViewOne.layer.opacity = 1
        advertDetailImageViewThree.layer.opacity = 1
    }
    
    func changeOpacityWhenSelectedImageThree(opacity:Float) {
        print("Three")
        advertDetailImageViewThree.layer.opacity = opacity
        advertDetailImageViewTwo.layer.opacity = 1
        advertDetailImageViewOne.layer.opacity = 1
    }
    
    
}



