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
    let backButton = BackButton(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        addActionToBackButton()
    }
    
    
    private func layoutUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(grassImageView)
        view.addSubview(backButton)
        
        grassImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            grassImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            grassImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            grassImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            grassImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            
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
