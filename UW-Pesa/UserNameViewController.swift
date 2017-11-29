//
//  UserNameViewController.swift
//  UW-Pesa
//
//  Created by Arjun Lalwani on 11/15/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class UserNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userName: UITextField!

        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.customPurple
        userName.delegate = self
        userName.becomeFirstResponder()
        updateUI()
    }
    
    func updateUI() {
        titleLabel.text = "Enter User Name"
        titleLabel.font = UIFont.customBalance22Med
        titleLabel.textColor = UIColor.white
        
        userName.setLeftPaddingPoints(10)
        userName.layer.borderColor = UIColor.white.cgColor
        userName.layer.borderWidth = 2.0
        userName.layer.cornerRadius = 16
        userName.backgroundColor = UIColor.white
        
        let navBar = navigationController?.navigationBar
        navBar?.topItem?.title = "Amount"
        navBar?.isTranslucent = false
        
        // hide 1px line below nav bar
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Important to create a new instance of AmountViewController as the same
        // instance cannot be pushed onto the navigation stack again.
        let newAmountVC = storyboard?.instantiateViewController(withIdentifier: "keyPadVC") as! AmountViewController
        newAmountVC.seguedFrom = "UserName"
        newAmountVC.navigationItem.title = "PIN"
        navigationController?.pushViewController(newAmountVC, animated: true)
        return true
    }
}


