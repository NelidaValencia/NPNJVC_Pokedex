//
//  ListPokemonView.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation
import UIKit

class ListPokemonView: UIViewController {
    
    var loader : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.isHidden = true
        activity.layer.masksToBounds = true
        activity.style = .whiteLarge
        return activity
    }()
    
    var titleImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pokemon")
        return imageView
    }()
    
    var navigationBar : UISearchBar = {
        let navigation = UISearchBar()
        navigation.translatesAutoresizingMaskIntoConstraints = false
        navigation.searchTextField.font = .systemFont(ofSize: 20, weight: .light, width: .standard)
        navigation.searchBarStyle = .minimal
        navigation.contentMode = .center
        navigation.searchTextField.layer.masksToBounds = true
        return navigation
    }()
    
    var tablePokemon : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemGray4
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
        let pokemons = presenter.viewModels
        filterData = pokemons
        view.backgroundColor = .white
        setUpTableView()
        presenter.onViewAppear()
    }
    
    
    private func setUpTableView() {
        view.addSubview(tablePokemon)
        view.addSubview(navigationBar)
        view.addSubview(titleImage)
        view.addSubview(loader)
        NSLayoutConstraint.activate([
            
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleImage.heightAnchor.constraint(equalToConstant: 100),
            titleImage.widthAnchor.constraint(equalToConstant: 300),
            
            navigationBar.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 20),
            navigationBar.heightAnchor.constraint(equalToConstant: 80),
            navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            tablePokemon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tablePokemon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tablePokemon.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tablePokemon.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 20)
        ])
        
        navigationBar.placeholder = "Search Pokemon"
        navigationBar.searchTextField.layer.cornerRadius = 30
        loader.isHidden = false
        loader.color = .systemGray
        loader.startAnimating()
        tablePokemon.isHidden = true
        tablePokemon.dataSource = self
        tablePokemon.delegate = self
        navigationBar.delegate = self
    }
}


