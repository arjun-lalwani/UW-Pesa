//
//  LoginViewController.swift
//  UW-Pesa
//
//  Created by Arjun Lalwani on 11/28/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var pinTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }

    func updateUI() {
        
        view.backgroundColor = UIColor.customPurple
        
        // configure login Label
        let uwPesa = NSMutableAttributedString(string: "UW PESA")
        let logIn = NSMutableAttributedString(string: "\nLOG IN")
        
        let customUWPesaAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                      NSAttributedStringKey.font: UIFont.customBalance36Med]
        
        let customLoginAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                     NSAttributedStringKey.font: UIFont.customBalance24]
        
        uwPesa.addAttributes(customUWPesaAttributes, range: NSMakeRange(0, uwPesa.length))
        logIn.addAttributes(customLoginAttributes, range: NSMakeRange(0, logIn.length))
        
        uwPesa.append(logIn)
        
        loginLabel.attributedText = uwPesa
        
        // configure text fields
        updateTextFieldUI(userNameTextField)
        updateTextFieldUI(pinTextField)
        pinTextField.addDoneButtonOnKeyboard()
        
        // configure submit button
        submitButton.backgroundColor = UIColor.customButtonBackground
        submitButton.layer.cornerRadius = CGFloat(16.0)
        submitButton.titleLabel?.font = UIFont.customBalance18Med
        submitButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    func updateTextFieldUI(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = CGFloat(16.0)
        textField.setRightPaddingPoints(10)
        textField.setLeftPaddingPoints(10)
    }
    
    @IBAction func subitButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainStoryboard") as UIViewController
        
        let navigationController = UINavigationController(rootViewController: controller)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
