//
//  CustomExtensions.swift
//  UW-Pesa
//
//  Created by Arjun Lalwani on 11/2/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    class var details: UIFont {
        return UIFont(name: "Avenir Next", size: CGFloat(48))!
    }
    
    class var customBalance16: UIFont {
        return UIFont(name: "Avenir Next", size: CGFloat(16))!
    }
    
    class var customBalance24: UIFont {
        return UIFont(name: "Avenir Next", size: CGFloat(24))!
    }
    
    class var customBalance36: UIFont {
        return UIFont(name: "Avenir Next", size: CGFloat(36))!
    }

    class var amount:  UIFont {
        return UIFont(name: "Avenir Next", size: CGFloat(72))!
    }
    
    class var options: UIFont {
        return UIFont(name: "Avenir Next", size: CGFloat(22))!
    }
}

extension UIColor {
    class var customLightGray: UIColor {
        return UIColor(red: CGFloat(215.0/255.0), green: CGFloat(215.0/255.0), blue: CGFloat(215.0/255.0), alpha: CGFloat(1.0))
    }
    
    class var customPurple: UIColor {
        return UIColor(red: CGFloat(155.0/255.0), green: CGFloat(114.0/255.0), blue: CGFloat(249.0/250.0), alpha: CGFloat(1.0))
    }
    
    class var customDarkPurple: UIColor {
        return UIColor(red: CGFloat(125.0/255.0), green: CGFloat(72.0/255.0), blue: CGFloat(247.0/250.0), alpha: CGFloat(1.0))
    }
}
