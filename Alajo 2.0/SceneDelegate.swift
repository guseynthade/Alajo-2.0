//
//  SceneDelegate.swift
//  Alajo 2.0
//
//  Created by God's on 3/31/24.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create a new UIWindow with the given scene
        let newWindow = UIWindow(windowScene: windowScene)
        
        // Create your new root view controller
        let vc = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarController") as? TabBarController ?? TabBarController()
        // Set the new root view controller
        let navigationController = UINavigationController(rootViewController: vc)
        newWindow.rootViewController = navigationController
    
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZGMxZGI2NDBkYTE0ZjA5OTAzZmM5NzlkYmNjYmU3ZSIsInN1YiI6IjY1ZGNhMmE0MDNiZjg0MDE2MWFlZGE3YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZOO3t3M_nH-awAjBucsK5VhYzTF0WiAN2PPtKN7tDHI"
    
        let data = token.data(using: .utf8)!
        let safeToken = KeychainHelper.saveData(data: data, ForService: "token")
        
        if safeToken {
            print("token saved")
        } else {
            print("token not saved")
        }
        
//        if UserDefaultsHelper.getBool(key: Constant.UD_IS_LOGIN_KEY) {
//                    let vc = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController ?? QuestionsViewController()
//                    // Set the new root view controller
//                    let navigationController = UINavigationController(rootViewController: vc)
//        //            navigationController.popToRootViewController(animated: true)
//                    newWindow.rootViewController = navigationController
//                } else {
//                    let vc = UIStoryboard.init(name: "Auth", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController ?? LoginViewController()
//                    let navigationController = UINavigationController(rootViewController: vc)
//                    // Set the new root view controller
//                    newWindow.rootViewController = navigationController
//                }
            
            // Make the window visible
            window = newWindow
            window?.makeKeyAndVisible()
        }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

