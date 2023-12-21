
import Foundation
import UIKit
import SnapKit
import PhotosUI
import CommonKit
import ModelKit


typealias Ables =
UIViewControllerAble &
NavConAble &
TabbarConAble &
AlertMessageAble

protocol CreateAdvertViewControllerInterface : AnyObject,Ables {
    func categoryPickerViewAllComponents()
  
    func changeFemaleButtonColors(backColor:UIColor,textColor:UIColor)
    func changeMaleButtonColors(backColor:UIColor,textColor:UIColor)
}

final class CreateAdvertViewController : UIViewController {
    
    private lazy var createAdvertView = CreateAdvertView()
    
    override func loadView() {
        view = createAdvertView
        createAdvertView.delegate = self
        createAdvertView.presenter = presenter
    }
    
    
    
  
    lazy var presenter : CreateAdvertPresenterInterface = CreateAdvertPresenter(
        view: self,createAdvertView: createAdvertView)
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
    func picker(_ picker: PHPickerViewController, 
                didFinishPicking results: [PHPickerResult]) {
        
        var imageData : [Data] = []
        picker.dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage{
                    guard let data = image.jpegData(compressionQuality: 1.0) else {return}
                    imageData.append(data)
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.createAdvertView.configureData(images: imageData)
            self.presenter.getImageData(images: imageData)
        }
        
    }
}

extension CreateAdvertViewController :  CreateAdvertViewControllerInterface {
   
    func categoryPickerViewAllComponents() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.createAdvertView.categoryPickerViewAllComponents()
        }
    }
   
    
    
    func changeFemaleButtonColors(backColor: UIColor, textColor: UIColor) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.createAdvertView.femaleGenderLabelChangeColor(backColor: backColor, textColor: textColor)
        }
        
    }
    
    func changeMaleButtonColors(backColor: UIColor, textColor: UIColor) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.createAdvertView.maleGenderLabelChangeColor(backColor: backColor, textColor: textColor)
        }
        
    }
}

// MARK: - CreateAdvertViewDelegate
extension CreateAdvertViewController :  CreateAdvertViewDelegate {
   
   
    
    func selectImagesFromGallery() {
        openImagesGallery()
    }
    
    
    func selectedMaleGender() {
        presenter.selectedGender(gender: .male)
    }
    
    func selectedFemaleGender() {
        presenter.selectedGender(gender: .female)
    }
    func createAdvert() {
        presenter.createAdvert()
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
        presenter.didSelectRow(row: row)
    }
    
}
















