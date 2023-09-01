//
//  ListPokemonInteractor.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation

protocol ListPokemonInteractable : AnyObject{
    func getListOfPokemon() async -> EntityResponsePokemon
}

class ListPokemonInteractor : ListPokemonInteractable {
    func getListOfPokemon() async -> EntityResponsePokemon {
        let url = URL(string: String.apiURL)!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(EntityResponsePokemon.self, from: data)
    }
}

