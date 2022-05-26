//
//  SceneDelegate.swift
//  Estina
//
//  Created by Hitesh Vaghela on 01/02/21.
//  Copyright © 2021 Hitesh Vaghela. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        if let window = window {
            RootRouter().presentHomeScreen(in: window)
        }
    }
}

