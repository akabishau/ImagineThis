//
//  Category.swift
//  ImagineThis
//
//  Created by Aleksey on 1126..20.
//

import UIKit

enum Category: String, CaseIterable {
    case horror
    case urban
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
    var breadCrumbsImage: UIImage? {
        return UIImage(named: "bc_\(self.rawValue)")
    }
}
