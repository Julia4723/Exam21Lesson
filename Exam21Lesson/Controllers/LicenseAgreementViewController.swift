//
//  LicenseAgreementViewController.swift
//  Exam21Lesson
//
//  Created by user on 05.11.2024.
//

import UIKit

class LicenseAgreementViewController: UIViewController {
    
    //MARK: - Private Property
    
    private var textManager: TextManager?
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let label = UILabel()
    private var titleOfLabel = UILabel()
    
    
    //MARK: - Init
    
    init(textManager: TextManager) {
        self.textManager = textManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

private extension LicenseAgreementViewController {
    func setupView() {
        addSubviews()
        setupContentView()
        setupScrollView()
        setupTitleOfLabel()
        setupLabel()
        setupLayout()
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
    }
}


private extension LicenseAgreementViewController {
    func setupScrollView() {
        scrollView.backgroundColor = .systemGray
        scrollView.addSubview(contentView)
    }
    
    func setupContentView() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.addSubview(titleOfLabel)
        contentView.addSubview(label)
    }
    
    func setupTitleOfLabel() {
        titleOfLabel.text = "Смешарики"
        titleOfLabel.textColor = .black
        titleOfLabel.font = .systemFont(ofSize: 24)
    }
    
    func setupLabel() {
        let textContent = textManager?.getTextContent()
        label.text = textContent?.text
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
    }
}

private extension LicenseAgreementViewController {
    func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleOfLabel.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
           
            titleOfLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleOfLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            
            
            label.topAnchor.constraint(equalTo: titleOfLabel.bottomAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            
        ])
    }
}
