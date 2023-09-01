//
//  MapperDetailPokemon.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 31/08/23.
//

import Foundation

struct MapperDetailPokemon {
    func map(entity: DetailPokemonEntity, idPokemon: Int) -> ViewModelDetailPokemon {
        .init(
            stats: entity.stats ?? [],
            types: entity.types ?? [],
            weight: entity.weight ?? 0,
            image: URL(string: "\(String.imageURL)\(idPokemon).png"),
            name: entity.name
        )
        
    }
}
