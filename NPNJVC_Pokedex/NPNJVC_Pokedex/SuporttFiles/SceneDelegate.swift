//
//  SceneDelegate.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var listPokemonRouter = ListPokemonRouter()

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        
        
        window?.makeKeyAndVisible()
        let nav = UINavigationController(nibName: "ListPokemonView", bundle: nil)
        window?.rootViewController = nav
        listPokemonRouter.showListOfPokemon(window: window)
    }

}

