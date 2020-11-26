//
//  StartButton.swift
//  ImagineThis
//
//  Created by Aleksey on 1125..20.
//

import UIKit

class StartButton: UIButton {

    
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
        setImage(UIImage(named: "start"), for: .normal)
    }
    
    
    func pulsate() {
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = 0.1
        pulse.fromValue = 1
        pulse.toValue = 0.95
        pulse.autoreverses = true
        
        layer.add(pulse, forKey: "pulse")
    }
}
