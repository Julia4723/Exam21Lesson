//
//  CustomCell.swift
//  Exam21Lesson
//
//  Created by user on 09.11.2024.
//
import UIKit

class CustomCell: UITableViewCell {
    
    //MARK: - Private Property
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let image = UIImageView()
    private let checkMark = UIButton()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
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
        let checkImage = item.isMark ? "checkmark.square.fill" : "checkmark.square"
        checkMark.setImage(UIImage(systemName: checkImage), for: .normal)
    }
    
}


//MARK: - Setting
private extension CustomCell {
    func setup() {
        addSubviews()
        setupTitleLabel()
        setupDescription()
        setupImage()
        setupCheckMark()
        setupLayout()
    }
    
    func addSubviews() {
        [titleLabel, descriptionLabel, image, checkMark].forEach { view in
            contentView.addSubview(view)
        }
    }
}

// MARK: - Settings Views
private extension CustomCell {
    func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func setupDescription() {
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 3
    }
    
    func setupImage() {
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.contentMode = .scaleAspectFill
    }
    
    func setupCheckMark() {
        checkMark.tintColor = .systemBlue
    }
}


// MARK: - Layout
private extension CustomCell {
    func setupLayout() {
        [titleLabel, descriptionLabel, image, checkMark].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkMark.leadingAnchor, constant: -8),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            checkMark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkMark.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            checkMark.widthAnchor.constraint(equalToConstant: 24),
            checkMark.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
}
