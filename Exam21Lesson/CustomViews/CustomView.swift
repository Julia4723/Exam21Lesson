//
//  CustomView.swift
//  Exam21Lesson
//
//  Created by user on 14.11.2024.
//

import UIKit

class CustomView: UIView {
    
    //MARK: - Private Property
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let image = UIImageView()
    private let checkMarkButton = UIButton()
    private var isCheck = false
    
    ///Так как нам нужен индекс самой ячейки, то в блок замыкания необходимо передать UITableViewCell
    var actionButton: (() -> ())?
    
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = .cellTap
            self.layer.shadowOffset = CGSize(width: 2, height: 2)
        } completion: { _ in
            self.backgroundColor = .cellDefault
            self.layer.shadowOffset = CGSize(width: 5, height: 5)
        }

    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    func configure(item: Model) {
        titleLabel.text = item.imageName
        descriptionLabel.text = item.description
        image.image = UIImage(named: item.imageName)
        isCheck = item.isMark //передаем значение Bool
        
        let checkImage = isCheck ? "checkmark.square.fill" : "checkmark.square" //задаем название картинки
    
        checkMarkButton.setImage(UIImage(systemName: checkImage), for: .normal)//передаем название в кнопку
    }
    
    @objc private func favoriteButtonTapped() {
        isCheck.toggle()//переключаем значение
        
        let checkImage = isCheck ? "checkmark.square.fill" : "checkmark.square"//определяем название картинки
        
        checkMarkButton.setImage(UIImage(systemName: checkImage), for: .normal)//передаем название в кнопку
        
        actionButton?()
        
    }
}


//MARK: - Setting
private extension CustomView {
    func setup() {
        
        backgroundColor = .cellDefault
        layer.cornerRadius = 20
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 2
        
        addSubviews()
        setupTitleLabel()
        setupDescription()
        setupImage()
        setupCheckMark()
        setupLayout()
    }
    
    func addSubviews() {
        [titleLabel, descriptionLabel, image, checkMarkButton].forEach { view in
            addSubview(view)
        }
    }
}


// MARK: - Settings Views
private extension CustomView {
    func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func setupDescription() {
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .systemGray2
        descriptionLabel.numberOfLines = 3
    }
    
    func setupImage() {
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.contentMode = .scaleAspectFill
    }
    
   
    func setupCheckMark() {
        checkMarkButton.tintColor = .checkMark
        
        checkMarkButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
}


// MARK: - Layout
private extension CustomView {
    func setupLayout() {
        [titleLabel, descriptionLabel, image, checkMarkButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraint = descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        constraint.priority = .defaultLow
            
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkMarkButton.leadingAnchor, constant: -8),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            constraint,

            
            checkMarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            checkMarkButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            checkMarkButton.widthAnchor.constraint(equalToConstant: 24),
            checkMarkButton.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
}
