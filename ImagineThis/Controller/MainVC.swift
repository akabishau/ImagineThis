//
//  MainVC.swift
//  ImagineThis
//
//  Created by Aleksey on 1118..20.
//

import UIKit

class MainVC: UIViewController {

    lazy var backgroundImageView = BGImageView(frame: view.bounds)
    let buttonsStackView = UIStackView()
    let easyLevelButton = LevelButton(level: "easy")
    let normalLevelButton = LevelButton(level: "normal")
    let hardLevelButton = LevelButton(level: "hard")
    
    // data model: categories + levels
    // collection view
    let startButton = StartButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureButtonsStackView()
        // configure collection view
        layoutUI()
        addActionToStartButton()
    }
    
    
    private func layoutUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(buttonsStackView)
        view.addSubview(startButton)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding * 4),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 44),
            
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding * 3),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding * 3),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding * 2),
            startButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    private func configureViewController() { }
    
    
    private func configureButtonsStackView() {
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10
        buttonsStackView.addArrangedSubview(easyLevelButton)
        buttonsStackView.addArrangedSubview(normalLevelButton)
        buttonsStackView.addArrangedSubview(hardLevelButton)
        
        easyLevelButton.isSelected = true
        
        easyLevelButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
        normalLevelButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
        hardLevelButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
        
    }
    
    
    @objc private func selectLevel(sender: UIButton) {
        let buttons = buttonsStackView.arrangedSubviews as! [UIButton]
        buttons.forEach { $0.isSelected = false }
        sender.isSelected = true
    }
    
    
    @objc private func startButtonTapped(_ sender: UIButton) {
        if let button = sender as? StartButton {
            button.pulsate()
        }
    }

    
    private func addActionToStartButton() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
}

