//
//  DetailPokemonRouter.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation
import UIKit

protocol DetailRouting: AnyObject {
    func showDetailPokemon(fromView: UIViewController, withIdPokemon idPokemon : Int)
}

class DetailPokemonRouter : DetailRouting{
    func showDetailPokemon(fromView: UIViewController, withIdPokemon idPokemon : Int) {
        let interactor = DetailPokemonInteractor()
        let presenter = DetailPokemonPresenter(idPokemon: idPokemon, interactor: interactor)
        let view = DetailPokemonView(presenter: presenter)
        presenter.ui = view
        
        fromView.present(view, animated: true)
    }
}
