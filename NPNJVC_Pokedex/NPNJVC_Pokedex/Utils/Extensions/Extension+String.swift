//
//  Extension+String.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation

extension String{
    
    static let apiURL = "https://pokeapi.co/api/v2/pokemon?limit=151"
    static let apiDetail = "https://pokeapi.co/api/v2/pokemon/"
    static let imageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    static let imageTemp = "https://pokeapi.co/api/v2/pokemon/200/"
    static let nameTemp = "Pokemon"
    func getObtainInt(url : String) -> Int{
        var numberPokemon : String = ""
        var urlTemp = url
        urlTemp.removeLast()
        for i in urlTemp.reversed() {
            if (!i.isNumber) {
                break
            }
            numberPokemon =  String(i) + numberPokemon
        }
        return Int(numberPokemon) ?? 0
    }
    
}
