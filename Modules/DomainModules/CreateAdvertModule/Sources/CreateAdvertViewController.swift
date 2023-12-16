
import Foundation
import UIKit
import SnapKit
import PhotosUI
import CommonKit
import ModelKit


typealias Ables = UIViewControllerAble & NavConAble

protocol CreateAdvertViewControllerInterface : AnyObject,Ables {
   func reloadAllComponents()
}



final class CreateAdvertViewController : UIViewController {
    
    private lazy var createAdvertView = CreateAdvertView()
    
    override func loadView() {
        view = createAdvertView
        createAdvertView.delegate = self
        createAdvertView.presenter = presenter
    }
    
    
    
    private var imageData : [Data] = []
    lazy var presenter : CreateAdvertPresenterInterface = CreateAdvertPresenter(
        createAdverVC: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        createAdvertView.categoryPickerViewConfigure(view: self)
    }
    
    private func openImagesGallery(){
        
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 3
        configuration.filter = .images
        let pickerViewController = PHPickerViewController(configuration: configuration)
        pickerViewController.delegate = self
        present(pickerViewController, animated: true)
        
    }
}

extension CreateAdvertViewController  : PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        imageData.removeAll()
        picker.dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage{
                    guard let data = image.jpegData(compressionQuality: 1.0) else {return}
                    self.imageData.append(data)
                   
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.createAdvertView.configureData(images: self.imageData)
        }
       
    }
}

extension CreateAdvertViewController :  CreateAdvertViewControllerInterface {
    func reloadAllComponents() {
        createAdvertView.reloadAllComponents()
    }
    
    
    

}

// MARK: - CreateAdvertViewDelegate
extension CreateAdvertViewController :  CreateAdvertViewDelegate {
    func selectCategoryFromPickerView(category: CategoryResult) {
        print(category.category)
    }
    
    func selectImagesFromGallery() {
        openImagesGallery()
    }
}


extension CreateAdvertViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return presenter.numberOfComponents()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.numberOfRowsInComponent()
    }
}


extension CreateAdvertViewController :  UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let category = presenter.titleForRow(row: row)
        return category.category
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let category = presenter.didSelectRow(row: row)
        print(category)
    }
    
}
















