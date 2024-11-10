//
//  FindImageViewController.swift
//  Exam21Lesson
//
//  Created by user on 24.10.2024.
//

import UIKit



final class FindImageViewController: UIViewController {
    
    //MARK: - Private Property
    
    private let imageName = UILabel()
    private let titleLabel = UILabel()
    private let textField = UITextField()
    private let validateMessage = UILabel()
    private let buttonView = CustomButton(
        color: .blue,
        label: "Проверить",
        labelColor: .white
    )
    private let imageView = UIImageView()
    
    private var dataManager: DataManageable?
    
    //MARK: - Init
    
    init(dataManager: DataManageable) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addViews(
            imageName,
            validateMessage,
            titleLabel,
            textField,
            buttonView,
            imageView
        )
        
        
        textField.delegate = self
        buttonView.delegate = self
        actionButton()
        
        setupTitleLabel()
        setupImageName()
        setupTextField()
        setupValidateMessage()
        setupLayout()
        
    }
    
    
    //MARK: - Private Methods
    
    private func showText() {
        let inputText = textField.text
        let model = dataManager?.findExample(elementValue: inputText ?? "")
        imageName.text = model?.imageName
        imageView.image = UIImage(named: model?.imageName ?? "")
    }
    
    
    private func actionButton() {
        buttonView.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        
        let inputText = textField.text ?? ""
        let model = dataManager?.findExample(elementValue: inputText)
        
        if model?.imageName != nil {
            titleLabel.text = "Такая картинка есть"
            
        } else {
            titleLabel.text = "Такой картинки нет"
        }
        
        imageName.text = model?.imageName
        imageView.image = UIImage(named: model?.imageName ?? "")
        print(model?.imageName ?? "")
        
    }
}


//MARK: - ICustomButtonDelegate
extension FindImageViewController: ICustomButtonDelegate {
    func buttonTapped(_ button: UIButton) {
        if button == buttonView {
            showText()
            textField.endEditing(true)
        } else {
            print("Button pressed")
        }
    }
}


//MARK: - UITextFieldDelegate
extension FindImageViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let inputText = textField.text ?? ""
        
        if !inputText.isEmpty {
            validateMessage.isHidden = true
        }
        
        let model = dataManager?.findExample(elementValue: inputText)
        if model?.imageName != nil {
            titleLabel.text = "Такая картинка есть"
            
        } else {
            titleLabel.text = "Такой картинки нет"
        }
        
        textField.resignFirstResponder()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let text = textField.text ?? ""
        if text.isEmpty {
            validateMessage.isHidden = false
            return false
        }
        return true
    }
}



//MARK: - Setup UI

private extension FindImageViewController {
    
    func setupImageName() {
        imageView.isUserInteractionEnabled = true
        
        imageName.text = ""
        
        imageName.font = .systemFont(ofSize: 24)
        imageName.textAlignment = .center
        imageName.textColor = .black
        imageName.numberOfLines = 0
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Введите название"
        
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .systemGray
        titleLabel.numberOfLines = 0
    }
    
    func setupValidateMessage() {
        validateMessage.text = "Текстовое поле пустое"
        validateMessage.font = .systemFont(ofSize: 14)
        validateMessage.textColor = .systemRed
        validateMessage.isHidden = true
    }
    
    func setupTextField() {
        textField.placeholder = "Введите название"
        textField.borderStyle = .roundedRect
    }
    
    func setupLayout() {
        imageName.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        validateMessage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            validateMessage.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8),
            validateMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            validateMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            validateMessage.heightAnchor.constraint(equalToConstant: 20),
            
            
            buttonView.topAnchor.constraint(equalTo: validateMessage.bottomAnchor, constant: 40),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            buttonView.heightAnchor.constraint(equalToConstant: 40),
            
            imageName.topAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 100),
            imageName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            imageName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            imageName.heightAnchor.constraint(equalToConstant: 40),
            
            imageView.topAnchor.constraint(equalTo: imageName.bottomAnchor, constant: 32),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            imageView.heightAnchor.constraint(equalToConstant: 360),
            
        ])
    }
    
}
