//
//  UIView+Ext.swift
//  ImagineThis
//
//  Created by Aleksey on 1208..20.
//

import UIKit

extension UIView {
    
    func fillSuperView(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding.bottom),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding.right)
        ])
    }
    
    
    func centerInSuperView(size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            widthAnchor.constraint(equalTo: superview.widthAnchor, constant: size.width),
            heightAnchor.constraint(equalTo: superview.heightAnchor, constant: size.height)
        ])
    }
}
