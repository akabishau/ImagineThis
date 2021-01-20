//
//  SelectionsStackView.swift
//  ImagineThis
//
//  Created by Aleksey on 0119..21.
//

import UIKit

class SelectionsStackView: UIStackView {

    let categoryImageView = UIImageView(image: UIImage(named: "bc_horror"))
    let dividerImageView = UIImageView(image: UIImage(named: "bc_divider"))
    let levelImageView = UIImageView(image: UIImage(named: "bc_easy"))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(category: Category, level: Level) {
        super.init(frame: .zero)
        categoryImageView.image = category.breadCrumbsImage
        levelImageView.image = level.breadCrumbsImage
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillProportionally
        spacing = 10
        addArrangedSubview(categoryImageView)
        addArrangedSubview(dividerImageView)
        addArrangedSubview(levelImageView)
        
        categoryImageView.contentMode = .scaleAspectFit
        dividerImageView.contentMode = .scaleAspectFit
        levelImageView.contentMode = .scaleAspectFit

    }
}
