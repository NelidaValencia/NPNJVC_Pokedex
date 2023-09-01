//
//  ListPokemonRouter.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation
import UIKit

protocol ListPokemonRouting {
    var detailRouting : DetailRouting? {get}
    var listPokemonView : ListPokemonView? {get}
    func showListOfPokemon(window: UIWindow?)
    func showDetailPokemon(withIdPokemon idPokemon: Int)
}

class ListPokemonRouter : ListPokemonRouting{
    
    var detailRouting : DetailRouting?
    var listPokemonView : ListPokemonView?
    
    func showListOfPokemon(window: UIWindow?) {
        self.detailRouting = DetailPokemonRouter()
        let interactor = ListPokemonInteractor()
        let presenter = ListPokemonPresenter(listOfPokemonInteractor: interactor, routing: self)
        listPokemonView = ListPokemonView(presenter: presenter)
        presenter.ui = listPokemonView
        window?.rootViewController = listPokemonView
        window?.makeKeyAndVisible()
    }
    
    func showDetailPokemon(withIdPokemon idPokemon: Int) {
        guard let fromView = listPokemonView else{
            return
        }
        detailRouting?.showDetailPokemon(fromView: fromView, withIdPokemon: idPokemon)
    }

}
