//
//  SceneDelegate.swift
//  Twitter-Clone-Example
//
//  Created by Omar Leal on 10/7/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var globalWindow: UIWindow?

   //entry point
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        globalWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        globalWindow?.windowScene = windowScene
        globalWindow?.rootViewController = MainTabBarController()
        globalWindow?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}

