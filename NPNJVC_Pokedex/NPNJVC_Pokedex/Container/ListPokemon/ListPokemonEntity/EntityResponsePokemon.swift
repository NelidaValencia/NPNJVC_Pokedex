//
//  EntityResponsePokemon.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation

struct EntityResponsePokemon : Decodable {
    let count : Int
    let next : String
    let results : [EntityPokemon]
}
