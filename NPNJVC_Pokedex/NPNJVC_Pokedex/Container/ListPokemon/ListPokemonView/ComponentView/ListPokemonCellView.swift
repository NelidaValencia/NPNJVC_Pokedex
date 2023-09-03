//
//  ListPokemonCellView.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation
import UIKit
import Kingfisher

class ListPokemonCellView : UITableViewCell{
    
    var pokemonImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
        
    var pokemonName : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 25, weight: .bold, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView() {
        addSubview(pokemonImageView)
        addSubview(pokemonName)
        
        NSLayoutConstraint.activate([
            pokemonImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pokemonImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 100),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 100),
            pokemonImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            pokemonName.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 20),
            pokemonName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            pokemonName.topAnchor.constraint(equalTo: topAnchor, constant: 45)
            
        ])
//        backgroundColor = .systemGray2
        layer.cornerRadius = 30
    }
    
    func configure(model: ViewModelListPokemon) {
        pokemonImageView.kf.setImage(with: model.url)
        pokemonName.text = model.name?.capitalized
//        let color = self.pokemonImageView.image?.getColors()?.background
//        self.pokemonImageView.backgroundColor = color
    }
    
}
