//
//  Level.swift
//  ImagineThis
//
//  Created by Aleksey on 1125..20.
//

import UIKit

enum Level: String, CaseIterable {
    case easy
    case normal
    case hard
    
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
    var selectedImage: UIImage? {
        return UIImage(named: "\(self.rawValue)_selected")
    }
    
    var breadCrumbsImage: UIImage? {
        return UIImage(named: "bc_\(self.rawValue)")
    }
}
