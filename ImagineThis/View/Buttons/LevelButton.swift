//
//  LevelButton.swift
//  ImagineThis
//
//  Created by Aleksey on 1119..20.
//

import UIKit

class LevelButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(level: String) {
        self.init(frame: .zero)
        setImage(UIImage(named: level), for: .normal)
        setImage(UIImage(named: "\(level)_selected"), for: .selected)
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        imageView?.contentMode = .scaleAspectFit
        isSelected = false
    }
}
