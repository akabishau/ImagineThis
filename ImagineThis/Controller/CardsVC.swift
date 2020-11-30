//
//  CardsVC.swift
//  ImagineThis
//
//  Created by Aleksey on 1125..20.
//

import UIKit

class CardsVC: UIViewController {

    lazy var backgroundImageView = BGImageView(frame: view.bounds)
    let grassImageView = UIImageView(image: UIImage(named: "grass"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    
    private func layoutUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(grassImageView)
        
        grassImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            grassImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            grassImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            grassImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            grassImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
}
