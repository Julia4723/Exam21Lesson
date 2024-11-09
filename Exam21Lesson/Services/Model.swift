//
//  Model.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

struct Model {
    let imageName: String
    let description: String
    var isMark: Bool = false
    
}


//MARK: - CustomStringConvertible
extension Model: CustomStringConvertible {
    var descriptionElement: String {
        "ImageName: \(imageName), Description: \(description)"
    }
}


//MARK: - Comparable
extension Model: Comparable {
    static func < (lhs: Model, rhs: Model) -> Bool {
        return lhs.imageName < rhs.imageName
    }
}

