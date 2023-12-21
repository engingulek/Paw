
import Foundation
import SnapKit
import UIKit
import ModelKit

protocol CreateAdvertViewDelegate {
    func selectImagesFromGallery()
    func createAdvert()
    func selectedMaleGender()
    func selectedFemaleGender()
}


protocol CreateAdvertViewInterface : AnyObject {
    func inputsReturn()-> (
        animalName:String,
        animalAge:String,
      
        animalGenus:String,
        animalInfo:String
    )
    
  
}

final class CreateAdvertView : UIView {
    
    var delegate : CreateAdvertViewDelegate? = nil
    var presenter :CreateAdvertPresenterInterface? = nil
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var  scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        view.backgroundColor = .white
        return view
    }()
    
    
    
    private lazy var firstImageView :  UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pawprint.fill")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var secondImageView :  UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pawprint.fill")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var thirdImageView :  UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pawprint.fill")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var imageViewStack : UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [firstImageView,secondImageView,thirdImageView])
        stackView.axis = .horizontal
        stackView.distribution  = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.backgroundColor  = .white
        return stackView
    }()
    
    
    private lazy var selectImageButton : UIButton = {
        let button = UIButton()
        button.setTitle("Select Image", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.addAction(selectImagesButtonAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var selectImagesButtonAction : UIAction =  UIAction { _ in
        self.delegate?.selectImagesFromGallery()
    }
    
    private lazy var animalNameTextField : UITextField = {
       let textField = UITextField()
        textField.placeholder = "Animal Name"
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
       return textField
    }()
    
    private lazy var animalAgeTextField : UITextField = {
       let textField = UITextField()
        textField.placeholder = "Animal Age"
        textField.keyboardType = .numberPad
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
       return textField
    }()
    
    
    private lazy var maleGenderButton : UIButton = {
        let button = UIButton()
        button.setTitle("♂", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.backgroundColor = .red
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 20,weight: .semibold)
        button.isUserInteractionEnabled = true
        button.addAction(maleGenderButtonAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var maleGenderButtonAction : UIAction = UIAction {_ in
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.delegate?.selectedMaleGender()
        }
      
    }
   
    
    private lazy var femaleGenderButton : UIButton = {
        let button = UIButton()
        button.setTitle("♀", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 20,weight: .semibold)
        button.isUserInteractionEnabled = true
        button.addAction(femaleGenderButtonAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var femaleGenderButtonAction : UIAction = UIAction {_  in
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.delegate?.selectedFemaleGender()
        }
        
    }
    private lazy var genderStackView : UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [maleGenderButton,femaleGenderButton])
        stackView.axis = .horizontal
        stackView.distribution  = .fillEqually
      
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
   private lazy var categoryPickerView: UIPickerView = {
         let pv = UIPickerView()
        pv.backgroundColor = UIColor(named: "5a92af")
         return pv
     }()
   
    
    private lazy var animalGenusTextField : UITextField = {
       let textField = UITextField()
        textField.placeholder = "Animal Genus"
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
        textField.keyboardType = .numberPad
       return textField
    }()
    
  
    
    private lazy var animalInfoTitle : UILabel = {
       let label = UILabel()
        label.text = "About"
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var animalInfoTextField : UITextView = {
        let textView = UITextView()
        textView.text = " "
        textView.font = .systemFont(ofSize: 15, weight: .medium)
        textView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        textView.textAlignment = .center
        textView.textColor = .black
        return textView
    }()

    
    private lazy var createAdvertButton : UIButton = {
        let button = UIButton()
        button.setTitle("Create Advert", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.addAction(createAdvertButtonAction, for: .touchUpInside)
        return button
    }()
    
    
    
    private lazy var createAdvertButtonAction : UIAction =  UIAction { _ in
        self.delegate?.createAdvert()
    }
    
        override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    
    func categoryPickerViewConfigure(view:CreateAdvertViewController) {
        categoryPickerView.delegate = view
        categoryPickerView.dataSource = view
    }
    
    func categoryPickerViewAllComponents(){
        categoryPickerView.reloadAllComponents()
    }
    
 
    
    
    func maleGenderLabelChangeColor(
        backColor:UIColor,
        textColor:UIColor){
            maleGenderButton.backgroundColor = backColor
            maleGenderButton.layer.borderColor = textColor.cgColor
            maleGenderButton.setTitleColor(textColor, for: .normal)
        
    }
    
    
    func femaleGenderLabelChangeColor(
        backColor:UIColor,
        textColor:UIColor){
            femaleGenderButton.backgroundColor = backColor
            femaleGenderButton.layer.borderColor = textColor.cgColor
            femaleGenderButton.setTitleColor(textColor, for: .normal)
        
    }
    
   
    
    private func configureUI(){
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        scrollView.addSubview(scrollStackViewContainer)
        scrollStackViewContainer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        [imageViewStack,selectImageButton,
         animalNameTextField,animalAgeTextField,
         genderStackView,categoryPickerView,
         animalGenusTextField,animalInfoTitle,
         animalInfoTextField,createAdvertButton].forEach { view in
            scrollStackViewContainer.addArrangedSubview(view)
            view.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(10)
                make.trailing.equalToSuperview().offset(-10)
            }
        }

        [imageViewStack,categoryPickerView,animalInfoTextField].forEach { view in
            view.snp.makeConstraints { make in
                make.height.equalTo(UIScreen.main.bounds.height / 5)
            }
        }
       
        
        [firstImageView,secondImageView,thirdImageView].forEach { view in
            view.snp.makeConstraints { make in
                make.height.equalTo(60)
            }
        }
        
        [animalNameTextField,
         animalAgeTextField,
        animalGenusTextField,
         animalInfoTitle,
         selectImageButton,
        createAdvertButton].forEach {view  in
            view.snp.makeConstraints { make in
                make.height.equalTo(40)
            }
        }
        
        [maleGenderButton,femaleGenderButton].forEach { genderView in
            genderStackView.addArrangedSubview(genderView)
            genderView.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(50)
            }
        }
    }
    
    func configureData(images:[Data]){
        print(images.count)
        if images.count == 3 {
            [firstImageView,secondImageView,thirdImageView].enumerated().forEach { index,imageView in
                imageView.image = UIImage(data: images[index])
            }
            
        }
       
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreateAdvertView : CreateAdvertViewInterface {
    func inputsReturn()-> (
        animalName:String,
        animalAge:String,
      
        animalGenus:String,
        animalInfo:String
    ) {
        let animalName:String = animalNameTextField.text ?? ""
        let animalAge:String = animalAgeTextField.text ?? ""
        let animalGenus:String = animalGenusTextField.text ?? ""
        let animalInfo:String = animalInfoTextField.text ?? ""
        return (
            animalName,
            animalAge,
            animalGenus,
            animalInfo)
       
    }
}


