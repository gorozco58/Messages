//
//  UIColorExtension.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var whiteTwo: UIColor {
        return UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
    }
    
    class var whiteLoader: UIColor {
        return white.withAlphaComponent(0.35)
    }
    
    class var tintGreen: UIColor {
        return UIColor(red: 0, green: 204/255, blue: 0, alpha: 1)
    }
}
