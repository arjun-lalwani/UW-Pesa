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
    
    class var customBalance18Med: UIFont {
        return UIFont(name: "AvenirNext-Medium", size: CGFloat(18))!
    }
    
    class var customBalance24: UIFont {
        return UIFont(name: "Avenir Next", size: CGFloat(24))!
    }
    
    class var customBalance36: UIFont {
        return UIFont(name: "Avenir Next", size: CGFloat(36))!
    }
    
    class var customBalance22Med: UIFont {
        return UIFont(name: "AvenirNext-Medium", size: CGFloat(22))!
    }
    
    class var customBalance36Med: UIFont {
        return UIFont(name: "AvenirNext-Medium", size: CGFloat(36))!
    }
    
    class var customAmount58Med: UIFont {
        return UIFont(name: "AvenirNext-Medium", size: CGFloat(58))!
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
        return UIColor(red: CGFloat(131.0/255.0), green: CGFloat(84.0/255.0), blue: CGFloat(238/250.0), alpha: CGFloat(1.0))
    }
    
    class var customGreenPositive: UIColor {
        return UIColor(red: CGFloat(143.0/255.0), green: CGFloat(228.0/255.0), blue: CGFloat(149.0/250.0), alpha: CGFloat(1.0))
    }
    
    class var customRedNegative: UIColor {
        return UIColor(red: CGFloat(1.0), green: CGFloat(154.0/255.0), blue: CGFloat(154.0/250.0), alpha: CGFloat(1.0))
    }
    
    class var customButtonBackground: UIColor {
        return UIColor(red: CGFloat(94.0/255.0), green: CGFloat(39.0/255.0), blue: CGFloat(219.0/255.0), alpha: CGFloat(1.0))
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    // creates the keyboard done button using UIToolbar
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    // triggered when the user presses the keyboard Done button; the keyboard gets resigned
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
