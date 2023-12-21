
import SnapKit
import UIKit
import Foundation

final class AccountActionView : UIView {
    
    private lazy var selectedImageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")?.withTintColor(.red)
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var selecteImageButton : UIButton = {
        let button = UIButton()
        button.setTitle("Select Image", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.addAction(selectImageButtonAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var selectImageButtonAction : UIAction =  UIAction { _ in
        
    }
    
    
    private lazy var nameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var nameTextFieldErrorLabel:UILabel = {
        let label = UILabel()
        label.text = "Name Error"
        label.font = .systemFont(ofSize: 18,weight: .medium)
        label.textColor = .red
        return label
    }()
    
    private lazy var surnameTextField :  UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var surnameTextFieldErrorLabel:UILabel = {
        let label = UILabel()
        label.text = "Surname Error"
        label.font = .systemFont(ofSize: 18,weight: .medium)
        label.textColor = .red
        return label
    }()
    
    private lazy var emailTextField :  UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    
    private lazy var emailTextFieldErrorLabel:UILabel = {
        let label = UILabel()
        label.text = "Email Error"
        label.font = .systemFont(ofSize: 18,weight: .medium)
        label.textColor = .red
        return label
    }()
    
    
    
    private lazy var passwordTextField :  UITextField = {
        let textField = UITextField()
        textField.placeholder = "Passpword"
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
        textField.isSecureTextEntry = true
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    
    private lazy var passwordTextFieldLabelError:UILabel = {
        let label = UILabel()
        label.text = "Password Error"
        label.font = .systemFont(ofSize: 18,weight: .medium)
        label.textColor = .red
        return label
    }()
    
    
    private lazy var createAccountButton : UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        
        button.addAction(createAccountButtonAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var createAccountButtonAction : UIAction =  UIAction { _ in
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        addSubview(selectedImageView)
        selectedImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(snp.width).multipliedBy(0.5)
            make.height.equalTo(snp.height).multipliedBy(0.2)
        }
        
       addSubview(selecteImageButton)
        selecteImageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(selectedImageView.snp.bottom).offset(25)
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(selecteImageButton.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        addSubview(nameTextFieldErrorLabel)
        nameTextFieldErrorLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(5)
            make.leading.equalTo(nameTextField.snp.leading)
        }
        
        addSubview(surnameTextField)
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        addSubview(surnameTextFieldErrorLabel)
        surnameTextFieldErrorLabel.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(5)
            make.leading.equalTo(surnameTextField.snp.leading)
        }
        
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        addSubview(emailTextFieldErrorLabel)
        emailTextFieldErrorLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(5)
            make.leading.equalTo(emailTextField.snp.leading)
        }
        
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        addSubview(passwordTextFieldLabelError)
        passwordTextFieldLabelError.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(5)
            make.leading.equalTo(passwordTextField.snp.leading)
        }
        
        
        addSubview(createAccountButton)
        createAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-25)
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
}
