//
//  DetailPokemonPresenter.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation

protocol DetailPokemonPresenterUI : AnyObject {
    func updateUI(viewModel: ViewModelDetailPokemon)
}

protocol DetailPokemonPresentable : AnyObject {
    var ui : DetailPokemonPresenterUI? {get}
    var idPokemon : Int {get}
    func onViewAppear()
}

class DetailPokemonPresenter : DetailPokemonPresentable{
    
    weak var ui : DetailPokemonPresenterUI?
    let idPokemon : Int
    private let interactor: DetailPokemonInteractable
    private let mapper : MapperDetailPokemon
    init(idPokemon: Int, interactor: DetailPokemonInteractable, mapper : MapperDetailPokemon = MapperDetailPokemon()) {
        self.idPokemon = idPokemon
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task{
            let model = await interactor.getDetailPokemon(withId: idPokemon)
            let viewModel = mapper.map(entity: model, idPokemon: idPokemon)
            await MainActor.run{
                self.ui?.updateUI(viewModel:viewModel)
            }
            
        }
    }
    
}
