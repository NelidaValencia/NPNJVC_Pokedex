//
//  DetailPokemonView.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation
import UIKit
import Kingfisher

class DetailPokemonView : UIViewController {
    
    private let presenter : DetailPokemonPresentable
    
    private let detailImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let pokemonName : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .standard)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokemonWeight : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 22, weight: .semibold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokemonStats : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 50
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .medium, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokemonTypes : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 50
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .medium, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleStat : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 22, weight: .semibold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleType : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 22, weight: .semibold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init(presenter: DetailPokemonPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        presenter.onViewAppear()
    }
    
    func setUpView() {
        view.addSubview(detailImage)
        view.addSubview(pokemonName)
        view.addSubview(pokemonWeight)
        view.addSubview(pokemonStats)
        view.addSubview(pokemonTypes)
        view.addSubview(titleStat)
        view.addSubview(titleType)
        
        NSLayoutConstraint.activate([
            detailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            detailImage.heightAnchor.constraint(equalToConstant: 250),
            detailImage.widthAnchor.constraint(equalToConstant: 200),
            
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokemonName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokemonName.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 10),
            
            pokemonWeight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokemonWeight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokemonWeight.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 20),
            
            titleStat.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleStat.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleStat.topAnchor.constraint(equalTo: pokemonWeight.bottomAnchor, constant: 20),
            
            pokemonStats.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokemonStats.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokemonStats.topAnchor.constraint(equalTo: titleStat.bottomAnchor, constant: 20),
            
            titleType.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleType.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleType.topAnchor.constraint(equalTo: pokemonStats.bottomAnchor, constant: 20),
            
            pokemonTypes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokemonTypes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokemonTypes.topAnchor.constraint(equalTo: titleType.bottomAnchor, constant: 20)
        ])
    }
}

extension DetailPokemonView : DetailPokemonPresenterUI{
    func updateUI(viewModel: ViewModelDetailPokemon) {
//        pokemonWeight.text = "WEIGHT: \(viewModel.weight)"
        detailImage.kf.setImage(with: viewModel.image)
        pokemonName.text = viewModel.name.uppercased()
        titleStat.text = "STATS:"
        titleType.text = "TYPES:"
        pokemonStats.text = ""
        pokemonTypes.text = ""
        for arrStat in viewModel.stats{
            pokemonStats.text?.append("    - ")
            pokemonStats.text?.append(arrStat.stat?.name ?? "")
            pokemonStats.text?.append("\n")
        }
        
        for arrType in viewModel.types{
            pokemonTypes.text?.append("    - ")
            pokemonTypes.text?.append(arrType.type.name)
            pokemonTypes.text?.append("\n")
        }
    }
}
