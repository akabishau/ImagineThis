//
//  BGImageView.swift
//  ImagineThis
//
//  Created by Aleksey on 1123..20.
//

import UIKit

class BGImageView: UIImageView {
    
    let backgroundImage = UIImage(named: "background")
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        contentMode = .scaleAspectFill
        image = backgroundImage
    }
}
