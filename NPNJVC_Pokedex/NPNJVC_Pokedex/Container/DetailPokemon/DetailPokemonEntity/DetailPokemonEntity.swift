//
//  DetailPokemonEntity.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 31/08/23.
//

import Foundation

struct DetailPokemonEntity : Decodable{
    let stats : [StatsEntity]?
    let types : [TypesEntity]?
    let weight : Int?
    let name : String
}

struct StatsEntity : Decodable{
    let base_stat : Int?
    let effort : Int?
    let stat : Stat?
    
}

struct Stat : Decodable{
    let name : String
    let url : String
}

struct TypesEntity : Decodable {
    let slot : Int
    let type : _Type
}

struct _Type : Decodable {
    let name : String
    let url : String
}


