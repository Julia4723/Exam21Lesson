//
//  SceneDelegate.swift
//  Exam21Lesson
//
//  Created by user on 11.10.2024.
//

import UIKit

enum TypeController {
    case ViewController
    case FindImage
    case PanImage
    case License
    case ImageList
    case MarkTable
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
        
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let imageListVC = assembly(type: .MarkTable)
        window?.rootViewController = imageListVC
        window?.makeKeyAndVisible()
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
    
    //Здесь возвращаем тип протокола менеджера DataManager
    func buildDataManager() -> DataManageable {
        let content = ContentManager().getContent()
        let typeDataManagerProtocol = DataManager(model: content)
        return typeDataManagerProtocol
    }
    
    //Здесь возвращаем вью контроллер
    func assembly(type: TypeController) -> UIViewController {
        let typeDataManagerProtocol = buildDataManager()
        let textManager = TextManager()
        
        switch type {
        case .FindImage:
            return FindImageViewController(dataManager: typeDataManagerProtocol)
        case .PanImage:
            return PanImageViewController(dataManager: typeDataManagerProtocol)
        case .License:
            return LicenseAgreementViewController(textManager: textManager)
        case .ImageList:
            return ImageListViewController(dataManager: typeDataManagerProtocol)
        case .ViewController:
            return ViewController(dataManager: typeDataManagerProtocol)
        case .MarkTable:
            return MarkTableViewController(dataManager: typeDataManagerProtocol)
        }
    }
}
