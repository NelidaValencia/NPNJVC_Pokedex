//
//  DetailPokemonInteractor.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation

protocol DetailPokemonInteractable : AnyObject {
    func getDetailPokemon(withId idPokemon: Int) async -> DetailPokemonEntity
}

class DetailPokemonInteractor : DetailPokemonInteractable{
    func getDetailPokemon(withId idPokemon: Int) async -> DetailPokemonEntity {
        let url = URL(string: "\(String.apiDetail)\(idPokemon)/")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailPokemonEntity.self, from: data)
    }
}
