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
    func getAllElements() -> [Model]
    func removeElements(index: Int)
    func checkedCell(index: Int)
    func getIsFavorite() -> [Model]
    func toggleFavorite(_ item: Model)
    
}

final class DataManager: DataManageable {
    
    //MARK: - Private Property
    
    private var models: [Model] = []
    private var currentIndex = 0
    private var currentValue = ""
    
    
    init(model: [Model]) {
        self.models = model
    }
    
    
    //MARK: - Methods
    
    func getAllElements() -> [Model] {
        models
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
    
    
    func removeElements(index: Int) {
        models.remove(at: index)
    }
    
    
    func checkedCell(index: Int) {
        models[index].isMark.toggle()
    }
    
    func getIsFavorite() -> [Model]{
        var isFavorite = [Model]()
        for item in models {
            if item.isMark {
                isFavorite.append(item)
            }
        }
        
        return isFavorite
    }
    
    func toggleFavorite(_ item: Model) {
        if let index = models.firstIndex(of: item) {
            models[index].isMark.toggle()
        }
    }
}
