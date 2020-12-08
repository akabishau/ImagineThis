//
//  CardsVC.swift
//  ImagineThis
//
//  Created by Aleksey on 1125..20.
//

import UIKit

class CardsVC: UIViewController {

    lazy var backgroundImageView = BGImageView(frame: view.bounds)
    let cardDeckView = UIView()
    let grassImageView = UIImageView(image: UIImage(named: "grass"))
    let backButton = BackButton(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        addActionToBackButton()
        setupCards()
    }
    
    // TODO: - make cards deck view to be child view controller
    private func setupCards() {
        let cardView = CardView()
        cardDeckView.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: cardDeckView.topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: cardDeckView.bottomAnchor, constant: -10),
            cardView.leadingAnchor.constraint(equalTo: cardDeckView.leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: cardDeckView.trailingAnchor, constant: -10)
        ])
    }
    
    private func layoutUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(cardDeckView)
        cardDeckView.translatesAutoresizingMaskIntoConstraints = false
        cardDeckView.backgroundColor = .systemPink
        view.addSubview(grassImageView)
        view.addSubview(backButton)
        
        grassImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            grassImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            grassImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            grassImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            grassImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            cardDeckView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            cardDeckView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            cardDeckView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardDeckView.heightAnchor.constraint(equalToConstant: 150),
            
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            //TODO: - test the button size on diffrent devices
            backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            backButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func addActionToBackButton() {
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    @objc func backButtonTapped(_ sender: UIButton) {
        if let button = sender as? BackButton {
            button.pulsate()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            //TODO: - confirm with the client removing navigation animation
            self.navigationController?.popViewController(animated: false)
        }
    }
}
