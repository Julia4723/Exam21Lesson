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
    
    
    func getCount(_ views: UIView...) -> Int {
        var count = 0
        for view in views {
            if view is CustomButton {
                count += 1
            }
        }
        return count
    }
    
    
    func printName(_ views: UIView...) {
        for view in views {
            if let button = view as? CustomButton {
                print(button.nameElements ?? "Unowned")
            }
        }
    }
    
    
//    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        
//        print("ViewD обработала событие")
//    }
}
