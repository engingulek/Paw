
import Foundation
import UIKit
import SnapKit
import PhotosUI
final class CreateAdvertViewController : UIViewController, PHPickerViewControllerDelegate {
    
    
    
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
    
    lazy var imagePicker = UIImagePickerController()
    
    
    private lazy var filterButtonAction : UIAction =  UIAction { _ in
        
        self.selectImageFromGallry()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
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
                    let data = image.jpegData(compressionQuality: 1.0)
                    print(data)
                }
            }
        }
    }
    
}











