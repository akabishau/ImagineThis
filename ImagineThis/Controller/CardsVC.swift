//
//  CardsVC.swift
//  ImagineThis
//
//  Created by Aleksey on 1125..20.
//

import UIKit

class CardsVC: UIViewController {

    lazy var backgroundImageView = BGImageView(frame: view.bounds)
    var selectionsView: SelectionsStackView!
    let containerView = UIView()
    let grassImageView = UIImageView(image: UIImage(named: "grass"))
    let backButton = BackButton(frame: .zero)
    
    var category: Category!
    var level: Level!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionsView = SelectionsStackView(category: category, level: level)
        layoutUI()
        addActionToBackButton()
        add(childVC: CardsDeckVC(sentenceManager: SentenceManager(category: category, level: level)), to: containerView)
    }
    
    
    private func layoutUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(selectionsView)
        view.addSubview(containerView)
        view.addSubview(grassImageView)
        view.addSubview(backButton)
        
        grassImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.fillSuperView()
        containerView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            grassImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            grassImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            grassImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            grassImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
//            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
//            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
//            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            containerView.heightAnchor.constraint(equalToConstant: 150),
            
            // position and size based on card collection view current height of 150
            selectionsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            selectionsView.heightAnchor.constraint(equalToConstant: 40),
            selectionsView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            selectionsView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
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
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
