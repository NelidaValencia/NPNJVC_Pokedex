//
//  ListPokemonInteractorMock.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation

class ListPokemonInteractorMock : ListPokemonInteractable {
    func getListOfPokemon() async -> EntityResponsePokemon {
        return EntityResponsePokemon(count: 100, next: "", results: [
            .init(name: String.nameTemp, url: String.imageTemp),
            .init(name: String.nameTemp, url: String.imageTemp),
            .init(name: String.nameTemp, url: String.imageTemp),
            .init(name: String.nameTemp, url: String.imageTemp),
            .init(name: String.nameTemp, url: String.imageTemp),
            .init(name: String.nameTemp, url: String.imageTemp),
            .init(name: String.nameTemp, url: String.imageTemp)
        ])
        
    }
}
