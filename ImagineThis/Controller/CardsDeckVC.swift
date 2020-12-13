//
//  CardsDeckVC.swift
//  ImagineThis
//
//  Created by Aleksey on 1212..20.
//

import UIKit

class CardsDeckVC: UIViewController {
    
    let cardView = CardView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCards()
    }
    
    
    private func setupCards() {
        view.addSubview(cardView)
        cardView.fillSuperView()
        //cardView.frame = view.bounds
        
//        NSLayoutConstraint.activate([
//
//        ])
    }
}
