//
//  Extension+ListView.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 2/09/23.
//

import Foundation
import UIKit

extension ListPokemonView : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.loader.startAnimating()
        let datapokemons = presenter.viewModels
        guard !searchText.isEmpty  else {
            searchActive = false
            filterData = datapokemons;
            self.tablePokemon.reloadData()
            self.loader.stopAnimating()
            return
        }

        filterData = datapokemons.filter(
            
            { user -> Bool in
                searchActive =  true
                return user.name!.lowercased().contains(searchText.lowercased())
            }
        )
        
        if(filterData.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        
        tablePokemon.reloadData()
        self.loader.stopAnimating()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchActive = false
        return searchActive
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchActive = true
        return searchActive
    }
}

extension ListPokemonView : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if searchActive {
            presenter.onTapCell(atIndex: filterData[indexPath.row].id)
        }
        
        presenter.onTapCell(atIndex: presenter.viewModels[indexPath.row].id)
    }
}

extension ListPokemonView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if searchActive {
            return filterData.count
        }
        
        return presenter.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListPokemonCellView", for: indexPath) as! ListPokemonCellView
        if searchActive {
            let model = filterData[indexPath.row]
            cell.configure(model: model)
        }else{
            let model = presenter.viewModels[indexPath.row]
            cell.configure(model: model)
        }
        return cell
    }
    
}

extension ListPokemonView : listOfPokemonUI{
    func update(pokemons: [ViewModelListPokemon]) {
        DispatchQueue.main.async {
            self.tablePokemon.isHidden = false
            self.loader.stopAnimating()
            self.tablePokemon.reloadData()
            
        }
    }
}
