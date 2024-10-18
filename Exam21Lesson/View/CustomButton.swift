//
//  CustomButton.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

@objc protocol ICustomButtonDelegate {
    func buttonTapped(_ button: UIButton)
}


final class CustomButton: UIButton {
    
    var nameElements: String?
    
    var delegate: ICustomButtonDelegate?
    
    
    init(color: UIColor, label: String, labelColor: UIColor, isShadow: Bool = false) {
        super.init(frame: .zero)
        setupButton(color, label, labelColor, isShadow)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Override Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shadowPath = UIBezierPath(rect: bounds)
        layer.shadowPath = shadowPath.cgPath
    }
}


extension CustomButton {
    
    private func action() {
        delegate?.buttonTapped(self)
    }
    
    private func setupButton(_ color: UIColor, _ label: String, _ labelColor: UIColor,_ isShadow: Bool) {
        
        setTitle(label, for: .normal)
        setTitleColor(labelColor, for: .normal)
        backgroundColor = color
        layer.cornerRadius = Custom.cornerRadius
        
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        if isShadow {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 5, height: 5)
            layer.shadowRadius = Custom.cornerRadius
            layer.shadowOpacity = 0.2
            
        }
    }
}


private extension CustomButton {
    enum Custom {
        static let cornerRadius: CGFloat = 10
    }
}
