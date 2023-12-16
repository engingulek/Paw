
import Foundation
import UIKit
import SnapKit
import PhotosUI
import CommonKit


typealias Ables = UIViewControllerAble & NavConAble

protocol CreateAdvertViewControllerInterface : AnyObject,Ables {
    
}


final class CreateAdvertViewController : UIViewController, PHPickerViewControllerDelegate {
    
    private lazy var createAdvertView = CreateAdvertView()
 
    
    override func loadView() {
        view = createAdvertView
    }
    
    private var imageData : [Data] = []
    lazy var presenter : CreateAdvertPresenterInterface = CreateAdvertPresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
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











