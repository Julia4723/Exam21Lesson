//
//  DataManager.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

final class DataManager {
    
    private var model: [Model] = []
    private var currentIndex = 0
    
    init(model: [Model]) {
        //получаем массив данных
        self.model = model
    }
    
    //Метод для получения текущего экземпляра модели
    func getCurrentExample() -> Model {
        model[currentIndex]
    }
    
    //Метод для переключения на следующий экземпляр
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
    
}
