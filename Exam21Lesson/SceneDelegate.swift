//
//  SceneDelegate.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
        
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let content = ContentManager().getContent()
        
        let sortedElement = content.sorted(by: <)
        
        printElements(elements: sortedElement)
        
        let dataManager = DataManager(model: content)
        
        let findVC = FindImageViewController(dataManager: dataManager)
        
        let panVC = PanImageViewController(dataManager: dataManager)
        
       // let viewController = ViewController(dataManager: dataManager)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = panVC
        window?.makeKeyAndVisible()
    }
    
  
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
       
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }
    
    
}


extension SceneDelegate {
    private func printElements(elements: [Model]) {
        for element in elements {
            print(element.descriptionElement)
        }
    }
    
}
