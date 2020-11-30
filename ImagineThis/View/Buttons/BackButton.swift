//
//  BackButton.swift
//  ImagineThis
//
//  Created by Aleksey on 1129..20.
//

import UIKit

class BackButton: UIButton {
    
    let image = UIImage(named: "back")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsImageWhenHighlighted = false
        setImage(image, for: .normal)
    }
    
    
    //TODO: - refactor repeated function in UIButton extension
    func pulsate() {
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = 0.1
        pulse.fromValue = 1
        pulse.toValue = 0.95
        pulse.autoreverses = true
        
        layer.add(pulse, forKey: "pulse")
    }
}
