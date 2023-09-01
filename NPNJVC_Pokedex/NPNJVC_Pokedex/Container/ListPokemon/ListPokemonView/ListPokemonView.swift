//
//  ListPokemonView.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation
import UIKit

class ListPokemonView: UIViewController {
    
    private var tablePokemon : UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ListPokemonCellView.self, forCellReuseIdentifier: "ListPokemonCellView")
        return tableView
    }()
    
    var presenter : listOfPokemonPresentable
    
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
        setUpTableView()
        presenter.onViewAppear()
    }
    
    private func setUpTableView() {
        view.addSubview(tablePokemon)
        NSLayoutConstraint.activate([
            tablePokemon.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tablePokemon.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tablePokemon.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tablePokemon.topAnchor.constraint(equalTo: view.topAnchor)
        ])

        tablePokemon.dataSource = self
        tablePokemon.delegate = self
    }
}

extension ListPokemonView : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}

extension ListPokemonView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var pokemons = presenter.viewModels.count
        return pokemons
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListPokemonCellView", for: indexPath) as! ListPokemonCellView
        let model = presenter.viewModels[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
}

extension ListPokemonView : listOfPokemonUI{
    func update(pokemons: [ViewModelListPokemon]) {
        DispatchQueue.main.async {
            self.tablePokemon.reloadData()
        }
    }
}
