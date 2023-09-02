//
//  DetailPokemonEntity.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 31/08/23.
//

import Foundation

struct DetailPokemonEntity : Decodable{
    let Stats : [StatsEntity]
    let types : [TypesEntity]
    let weight : Int
    let name : String
    
    enum CodingKeys: String, CodingKey {
        case Stats = "stats"
        case types
        case weight
        case name
    }
}

struct StatsEntity : Decodable{
    let Basestat : Int
    let effort : Int
    let stat : Stat
    
    enum CodingKeys: String, CodingKey {
        case Basestat = "base_stat"
        case effort
        case stat
    }
}

struct Stat : Decodable{
    let name : String
    let url : String
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}

struct TypesEntity : Decodable {
    let slot : Int
    let type : _Type
    
    enum CodingKeys: CodingKey {
        case slot
        case type
    }
}

struct _Type : Decodable {
    let name : String
    let url : String
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}


