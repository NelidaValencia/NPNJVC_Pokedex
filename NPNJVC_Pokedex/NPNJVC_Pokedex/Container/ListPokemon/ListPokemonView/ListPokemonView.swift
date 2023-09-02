//
//  ListPokemonView.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation
import UIKit

class ListPokemonView: UIViewController {
    
    let titleImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pokemon")
        return imageView
    }()
    
    var navigationBar : UISearchBar = {
        let navigation = UISearchBar()
        navigation.contentMode = .scaleAspectFit
        navigation.translatesAutoresizingMaskIntoConstraints = false
        navigation.barStyle = .default
        navigation.backgroundColor = .white
        return navigation
    }()
    
    var tablePokemon : UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .lightGray
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tintColor = .clear
        tableView.register(ListPokemonCellView.self, forCellReuseIdentifier: "ListPokemonCellView")
        return tableView
    }()
    
    var presenter : listOfPokemonPresentable
    var filterData : [ViewModelListPokemon] = []
    var searchActive : Bool = false
    
    init(presenter: listOfPokemonPresentable){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        var pokemons = presenter.viewModels
        filterData = pokemons
        view.backgroundColor = .white
        setUpTableView()
        presenter.onViewAppear()
    }
    
    
    private func setUpTableView() {
        view.addSubview(tablePokemon)
        view.addSubview(navigationBar)
        view.addSubview(titleImage)
        
        NSLayoutConstraint.activate([
            titleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleImage.heightAnchor.constraint(equalToConstant: 100),
            titleImage.widthAnchor.constraint(equalToConstant: 300),
            
            navigationBar.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 20),
            navigationBar.heightAnchor.constraint(equalToConstant: 50),
            navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            tablePokemon.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tablePokemon.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tablePokemon.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tablePokemon.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 20)
        ])
        
        navigationBar.placeholder = " Search Pokemon"
        
        tablePokemon.dataSource = self
        tablePokemon.delegate = self
        navigationBar.delegate = self
    }
}


