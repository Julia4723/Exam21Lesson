//
//  UIView.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

extension UIView {
    func addViews(_ view: UIView...){
        view.forEach { addSubview($0)}
    }
}
