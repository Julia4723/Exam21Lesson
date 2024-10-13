//
//  Model.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

struct Model: CustomStringConvertible {
    let imageName: String
    let description: String
    
    var descriptionElement: String {
        "ImageName: \(imageName), Description: \(description)"
    }
}
