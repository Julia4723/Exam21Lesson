//
//  UIView+UIStackView.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

extension UIStackView {
    
    func addStackView(_ view: UIView...) {
        view.forEach {addArrangedSubview($0)}
    }
}
