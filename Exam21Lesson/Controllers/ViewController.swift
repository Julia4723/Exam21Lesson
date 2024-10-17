//
//  ViewController.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Private Property
    
    private var dataManager: DataManageable?
    
    
    private let lastButton = CustomButton(color: .systemBlue, label: "Last", labelColor: .white, isShadow: true)
    private let nextButton = CustomButton(color: .white, label: "Next", labelColor: .darkText, isShadow: true)
    private let firstButton = CustomButton(color: .systemPink, label: "First", labelColor: .white)
    
    
    private let imageView = UIImageView()
    private let text = UILabel()
    private let stackView = UIStackView()
    private let stackTop = UIStackView()
    
    
    //MARK: - Init
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addViews(stackView, stackTop, firstButton, imageView, text)
        
        setupImage()
        setupLabel()
        
        addActionNextButton()
        addActionLastButton()
        addActionFirsButton()
        setupButtonStackView()
        setupTopStack()
        
        setupLayout()
        
        view.backgroundColor = .white
    }
        
    
    
    //MARK: - Private methods
    
    private func action(content: Model?) {
        let content = content
        text.text = content?.description
        imageView.image = UIImage(named: content?.imageName ?? "")
    }
    
    @objc private func nextButtonTapped() {
        action(content: dataManager?.getNextExample())
    }
        
    
    @objc private func lastButtonTapped() {
        action(content: dataManager?.getLastExample())
    }
    
    
    @objc private func firstButtonTapped() {
        action(content: dataManager?.getFirstExample())
    }
}
    
    
    //MARK: - Action
    
    private extension ViewController {
        
        func addActionNextButton() {
            nextButton.addTarget(
                self,
                action: #selector(nextButtonTapped),
                for: .touchUpInside
            )
        }
        
        func addActionLastButton() {
            lastButton.addTarget(
                self,
                action: #selector(lastButtonTapped),
                for: .touchUpInside
            )
        }
        
        func addActionFirsButton() {
            firstButton.addTarget(
                self,
                action: #selector(firstButtonTapped),
                for: .touchUpInside
            )
        }
    }
    
    
    //MARK: -  Setup SubViews
    
    private extension ViewController {
        
        func setupImage() {
            let content = dataManager?.getCurrentExample()
            print(content)
            imageView.image = UIImage(named: content?.imageName ?? "")
            
            imageView.tintColor = .black
            imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        }
        
        func setupLabel() {
            let content = dataManager?.getCurrentExample()
            text.text = "\(content?.description)"
            
            text.font = .systemFont(ofSize: 16)
            text.textAlignment = .center
            text.textColor = .systemGray
            text.numberOfLines = 0
        }
        
        func setupButtonStackView() {
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.spacing = 20
            
            stackView.addStackView(lastButton, nextButton)
        }
        
        func setupTopStack() {
            stackTop.axis = .vertical
            stackTop.distribution = .fill
            stackTop.alignment = .center
            stackTop.spacing = 20
            
            stackTop.addStackView(imageView, text)
            
        }
    }
    
    
    //MARK: - Setup Layout
    
    private extension ViewController {
        
        private func setupLayout() {
            stackTop.translatesAutoresizingMaskIntoConstraints = false
            stackView.translatesAutoresizingMaskIntoConstraints = false
            firstButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                
                stackTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                stackTop.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackTop.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                stackTop.heightAnchor.constraint(equalToConstant: 350),
                
                stackView.topAnchor.constraint(equalTo: stackTop.bottomAnchor, constant: 50),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                
                firstButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 100),
                firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                firstButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)
                
            ])
        }
    }
