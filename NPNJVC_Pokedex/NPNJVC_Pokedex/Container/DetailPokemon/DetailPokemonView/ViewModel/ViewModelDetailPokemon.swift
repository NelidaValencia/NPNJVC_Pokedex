//
//  ViewModelDetailPokemon.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 31/08/23.
//

import Foundation

struct ViewModelDetailPokemon {
    let stats : [StatsEntity]
    let types : [TypesEntity]
    let weight : Int
    let image : URL?
    let name : String
}
