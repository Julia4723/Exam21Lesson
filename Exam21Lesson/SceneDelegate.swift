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
        
        let textManager = TextManager()
        
       // let sortedElement = content.sorted(by: <)
        
        //printElements(elements: sortedElement)
        
        //let findVC = FindImageViewController(dataManager: dataManager)
       
        //let licenseAgreementVC = LicenseAgreementViewController(textManager: textManager)
        
       // let panVC = PanImageViewController(dataManager: dataManager)
        
       // let viewController = ViewController(dataManager: dataManager)
        
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let imageListVC = buildDataManager()
        window?.rootViewController = imageListVC
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

extension SceneDelegate {
    func buildDataManager() -> UIViewController {
        let content = ContentManager().getContent()
        let dataManager = DataManager(model: content)
        let markTableVC = MarkTableViewController(dataManager: dataManager)
        let imageListVC = ImageListViewController(dataManager: dataManager)
        return markTableVC
    }
}
