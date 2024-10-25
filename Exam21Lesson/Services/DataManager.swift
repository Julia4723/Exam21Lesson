//
//  DataManager.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

protocol DataManageable {
    func getCurrentExample() -> Model
    func getNextExample() -> Model
    func getLastExample() -> Model
    func getFirstExample() -> Model
    func findExample(elementValue: String) -> Model?
    
}

final class DataManager: DataManageable {
    
    func findExample(elementValue: String) -> Model? {
        let array = content.getContent()
        
        for element in array {
            if elementValue == element.imageName {
                return element
            }
        }
        return nil
    }
    
    
    
    
    private var model: [Model] = []
    private var currentIndex = 0
    private var currentValue = ""
    private var content = ContentManager()
    
    
    init(model: [Model]) {
        self.model = model
    }
    
    
    func getCurrentExample() -> Model {
        model[currentIndex]
    }
    
  
    
    func getNextExample() -> Model {
        if currentIndex < model.count - 1 {
            currentIndex += 1
        }
        return getCurrentExample()
    }
    
    
    func getLastExample() -> Model {
        if currentIndex < model.count && currentIndex != 0 {
            currentIndex -= 1
        }
        return getCurrentExample()
    }
    
    
    func getFirstExample() -> Model {
        currentIndex = 0
        return getCurrentExample()
    }
    
   
    
//    func findExample(elements: [Model]) -> Bool {
////       let elements = content.getContent()
//        if let firstIndex = elements.firstIndex(where: { $0.imageName == currentValue }) {
//
//            return true
//        } else {
//            return false
//        }
//    }
}
