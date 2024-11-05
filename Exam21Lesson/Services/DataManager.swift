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
    func getTextContent() -> Text 
    
}

final class DataManager: DataManageable {
    
    //MARK: - Private Property
    
    private var models: [Model] = []
    private var textContent: Text
    private var currentIndex = 0
    private var currentValue = ""
    
    
    init(model: [Model], text: Text) {
        self.models = model
        self.textContent = text
    }
    
    
    //MARK: - Methods
    
    func getTextContent() -> Text {
        return textContent
    }
    
    func getCurrentExample() -> Model {
        models[currentIndex]
    }
    
    
    func getNextExample() -> Model {
        if currentIndex < models.count - 1 {
            currentIndex += 1
        }
        return getCurrentExample()
    }
    
    
    func getLastExample() -> Model {
        if currentIndex < models.count && currentIndex != 0 {
            currentIndex -= 1
        }
        return getCurrentExample()
    }
    
    
    func getFirstExample() -> Model {
        currentIndex = 0
        return getCurrentExample()
    }
    
    
    func findExample(elementValue: String) -> Model? {
        
        for element in models {
            if elementValue == element.imageName {
                return element
            }
        }
        return nil
    }
}
