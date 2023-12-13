
import Foundation
import UIKit
import SnapKit
import PhotosUI


protocol CreateAdvertViewControllerInterface : AnyObject {
    
}



final class CreateAdvertViewController : UIViewController, PHPickerViewControllerDelegate {
    lazy var imagePicker = UIImagePickerController()
    
    
    private lazy var filterButton : UIButton = {
        let button = UIButton()
        button.setTitle("Filter", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.addAction(filterButtonAction, for: .touchUpInside)
        return button
    }()
    private lazy var filterButtonAction : UIAction =  UIAction { _ in
        
        self.selectImageFromGallry()
    }
    
    private lazy var createAdvertButton : UIButton = {
        let button = UIButton()
        button.setTitle("Create", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.addAction(createButtonAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var createButtonAction : UIAction =  UIAction { _ in
        self.presenter.createAdvert(images: self.imageData)
    }
    
    
    
 
    
    
   
    private var imageData : [Data] = []
    lazy var presenter : CreateAdvertPresenterInterface = CreateAdvertPresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        view.addSubview(createAdvertButton)
        createAdvertButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(filterButton.snp.bottom).offset(10)
        }
    }
    
    private func selectImageFromGallry(){
        
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 3
        configuration.filter = .images
        let pickerViewController = PHPickerViewController(configuration: configuration)
        pickerViewController.delegate = self
        present(pickerViewController, animated: true)
        
        
        
    }
}

extension CreateAdvertViewController  {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage{
                    guard let data = image.jpegData(compressionQuality: 1.0) else {return}
                    self.imageData.append(data)
                }
            }
        }
    }
    
}

extension CreateAdvertViewController :  CreateAdvertViewControllerInterface {
    
}











