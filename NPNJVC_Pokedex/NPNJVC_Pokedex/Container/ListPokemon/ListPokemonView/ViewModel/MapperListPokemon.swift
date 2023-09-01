//
//  MapperListPokemon.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation

struct MapperListPokemon{
    func map(entity: EntityPokemon) -> ViewModelListPokemon {
        let dataId : String = ""
        let idPokemon = dataId.getObtainInt(url: entity.url)
        let urlImage = "\(String.imageURL)\(idPokemon).png"
        return ViewModelListPokemon(id: idPokemon, name: entity.name, url: URL(string: urlImage))
    }
}
