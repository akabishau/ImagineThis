//
//  CardView.swift
//  ImagineThis
//
//  Created by Aleksey on 1208..20.
//

import UIKit

class CardView: UIView {
    
    let backgroundImageView = UIImageView()
    let sentenceLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        configureImageView()
        configureSentenceLabel()
    }
    
    
    private func configureImageView() {
        addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "card")
        backgroundImageView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
    
    private func configureSentenceLabel() {
        addSubview(sentenceLabel)
        sentenceLabel.translatesAutoresizingMaskIntoConstraints = false
        sentenceLabel.text = "Some random text"
        
        NSLayoutConstraint.activate([
            sentenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            sentenceLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}