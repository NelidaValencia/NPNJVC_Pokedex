//
//  ListPokemonPresenter.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation
protocol listOfPokemonPresentable : AnyObject{
    var ui : listOfPokemonUI? {get}
    var viewModels : [ViewModelListPokemon] {get}
    func onViewAppear()
    func onTapCell(atIndex: Int)
}

protocol listOfPokemonUI: AnyObject {
    func update(pokemons: [ViewModelListPokemon])
}

class ListPokemonPresenter : listOfPokemonPresentable{
    
    weak var ui : listOfPokemonUI?
    private let listOfPokemonInteractor : ListPokemonInteractable
    var viewModels : [ViewModelListPokemon] = []
    private let mapper : MapperListPokemon
    private let routing : ListPokemonRouting
    private var models : [EntityPokemon] = []
    
    init( listOfPokemonInteractor: ListPokemonInteractable, mapper: MapperListPokemon = MapperListPokemon(), routing : ListPokemonRouting) {
        self.listOfPokemonInteractor = listOfPokemonInteractor
        self.mapper = mapper
        self.routing = routing
    }
    
    func onViewAppear() {
        Task{
            models = await listOfPokemonInteractor.getListOfPokemon().results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(pokemons: viewModels)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let model = models[atIndex]
        let idString = ""
        let pokemonId = idString.getObtainInt(url: model.url)
        routing.showDetailPokemon(withIdPokemon: pokemonId)
    }
    
}
