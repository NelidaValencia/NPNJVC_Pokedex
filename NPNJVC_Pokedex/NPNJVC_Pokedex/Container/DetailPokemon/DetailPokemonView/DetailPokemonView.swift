//
//  DetailPokemonView.swift
//  NPNJVC_Pokedex
//
//  Created by Slacker on 30/08/23.
//

import Foundation
import UIKit
import Kingfisher
import UIImageColors

class DetailPokemonView : UIViewController {
    
    private let presenter : DetailPokemonPresentable
    
    var loader : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.isHidden = true
        activity.layer.masksToBounds = true
        activity.style = .whiteLarge
        return activity
    }()
    
    private let buttonClose : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        return button
    }()
    
    private let detailImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let pokemonName : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .standard)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokemonStats : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 50
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokemonTypes : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 50
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleStat : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleType : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold, width: .condensed)
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
        view.addSubview(buttonClose)
        view.addSubview(detailImage)
        view.addSubview(pokemonName)
        view.addSubview(pokemonStats)
        view.addSubview(pokemonTypes)
        view.addSubview(titleStat)
        view.addSubview(titleType)
        view.addSubview(loader)
        
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonClose.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            buttonClose.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailImage.topAnchor.constraint(equalTo: buttonClose.bottomAnchor, constant: 12),
            detailImage.heightAnchor.constraint(equalToConstant: 250),
            detailImage.widthAnchor.constraint(equalToConstant: 250),
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokemonName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokemonName.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 10),
            titleStat.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleStat.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleStat.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 20),
            pokemonStats.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            pokemonStats.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokemonStats.topAnchor.constraint(equalTo: titleStat.bottomAnchor, constant: 20),
            titleType.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            titleType.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleType.topAnchor.constraint(equalTo: pokemonStats.bottomAnchor, constant: 20),
            pokemonTypes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            pokemonTypes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokemonTypes.topAnchor.constraint(equalTo: titleType.bottomAnchor, constant: 20)
        ])
        detailImage.isHidden = true
        pokemonName.isHidden = true
        pokemonStats.isHidden = true
        pokemonTypes.isHidden = true
        titleStat.isHidden = true
        titleType.isHidden = true
        buttonClose.isHidden = true
        loader.color = .systemGray
        loader.startAnimating()
        buttonClose.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        buttonClose.addTarget(self, action: #selector(ActionButton), for: .touchUpInside)
    }
    
    @objc func ActionButton(button: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
}

extension DetailPokemonView : DetailPokemonPresenterUI{
    func updateUI(viewModel: ViewModelDetailPokemon) {
        detailImage.isHidden = false
        pokemonName.isHidden = false
        pokemonStats.isHidden = false
        pokemonTypes.isHidden = false
        titleStat.isHidden = false
        titleType.isHidden = false
        buttonClose.isHidden = false
        detailImage.kf.setImage(with: viewModel.image)
        let color = detailImage.image?.getColors()
        view.backgroundColor = color?.background
        buttonClose.tintColor = color?.detail
        pokemonName.textColor = color?.secondary
        pokemonName.text = viewModel.name.uppercased()
        titleStat.text = "STATS:"
        titleStat.textColor = color?.secondary
        titleType.text = "TYPES:"
        titleType.textColor = color?.secondary
        pokemonStats.text = ""
        pokemonStats.textColor = color?.detail
        pokemonTypes.text = ""
        pokemonTypes.textColor = color?.detail
        for arrStat in viewModel.stats{
            pokemonStats.text?.append("\(arrStat.stat.name): \(arrStat.Basestat)")
            pokemonStats.text?.append("\n")
        }
        for arrType in viewModel.types{
            pokemonTypes.text?.append(arrType.type.name)
            pokemonTypes.text?.append("\n")
        }
        loader.stopAnimating()
    }
}
