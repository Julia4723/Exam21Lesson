//
//  Model.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

struct Model: CustomStringConvertible, Comparable {
    let imageName: String
    let description: String
    
    var descriptionElement: String {
        "ImageName: \(imageName), Description: \(description)"
    }
    
    static func < (lhs: Model, rhs: Model) -> Bool {
            return lhs.imageName < rhs.imageName
        }
}
