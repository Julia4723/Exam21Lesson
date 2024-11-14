//
//  CustomCell.swift
//  Exam21Lesson
//
//  Created by user on 09.11.2024.
//
import UIKit

class CustomCell: UITableViewCell {
    
   
    private let customView = CustomView()
    var action: ((UITableViewCell) -> ())?
    
    
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
        customView.configure(item: item)
        customView.actionButton = favoriteButtonTapped
    }
    
     private func favoriteButtonTapped() {
         action?(self)
    }
}


//MARK: - Setting
private extension CustomCell {
    func setup() {
        
        contentView.addSubview(customView)
        contentView.backgroundColor = .background
        setupLayout()
    }
}



// MARK: - Layout
private extension CustomCell {
    func setupLayout() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}



