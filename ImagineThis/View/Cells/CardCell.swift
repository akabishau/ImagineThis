//
//  CardCell.swift
//  ImagineThis
//
//  Created by Aleksey on 1218..20.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    static let reuseIndentifier = String(describing: CardCell.self)
    
    let backgroundImageView = UIImageView(frame: .zero)
    let sentenceLabel = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //TODO: - struct sentence replaces the string?
    func set(sentence: String) {
        sentenceLabel.text = sentence
    }
    
    
    private func configure() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(sentenceLabel)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        sentenceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImageView.image = UIImage(named: "card")
        sentenceLabel.text = "some random text to show"
        
        sentenceLabel.textAlignment = .center
        sentenceLabel.numberOfLines = 0
        
        backgroundImageView.fillSuperView()
        sentenceLabel.fillSuperView(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
}
