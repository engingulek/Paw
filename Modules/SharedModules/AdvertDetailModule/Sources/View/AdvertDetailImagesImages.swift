

import Foundation
import SnapKit
import UIKit
import Kingfisher

/*protocol AdvertDetailImagesImagesInterface {
    func changeOpacityWhenSelectedImageOne(opacity:Float,defaultOpacity:Float)
    func changeOpacityWhenSelectedImageTwo(opacity:Float,defaultOpacity:Float)
    func changeOpacityWhenSelectedImageThree(opacity:Float,defaultOpacity:Float)
}*/

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
    
   
    
    func configureData(imageList:[String]){
        let baseImageUrl = URL(string: imageList[0])
        let firsImageUrl = URL(string: imageList[0])
        let secondImageUrl = URL(string: imageList[1])
        let thirdImageUrl = URL(string: imageList[2])
        
        let imageUrlList = [baseImageUrl,firsImageUrl,secondImageUrl,thirdImageUrl]
        
        [
            baseImageView,
            advertDetailImageViewOne,
            advertDetailImageViewTwo,
            advertDetailImageViewThree
        ].enumerated().forEach {
            $1.kf.setImage(with: imageUrlList[$0])
        }
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
        print("first")
        self.delegate?.selectedImageOne()
    }
    
    @objc private func selectedTwoImage() {
        print("second")
        self.delegate?.selectedImageTwo()
    }
    
    
    @objc private func selectedThreeImage() {
        print("third")
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

extension AdvertDetailImagesImages  {
    func changeOpacityImageOne(opacity:Float,defaultOpacity:Float) {
        baseImageView.image = advertDetailImageViewOne.image
        advertDetailImageViewOne.layer.opacity = opacity
        advertDetailImageViewTwo.layer.opacity = defaultOpacity
        advertDetailImageViewThree.layer.opacity = defaultOpacity
    }
    
    func changeOpacityImageTwo(opacity:Float,defaultOpacity:Float) {
        baseImageView.image = advertDetailImageViewTwo.image
        advertDetailImageViewTwo.layer.opacity = opacity
        advertDetailImageViewOne.layer.opacity = defaultOpacity
        advertDetailImageViewThree.layer.opacity = defaultOpacity
    }
    
    func changeOpacityImageThree(opacity:Float,defaultOpacity:Float) {
        baseImageView.image = advertDetailImageViewThree.image
        advertDetailImageViewThree.layer.opacity = opacity
        advertDetailImageViewTwo.layer.opacity = defaultOpacity
        advertDetailImageViewOne.layer.opacity = defaultOpacity
    }
    
    
}



