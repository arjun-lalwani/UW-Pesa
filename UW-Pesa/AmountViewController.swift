//
//  AmountViewController.swift
//  UW-Pesa
//
//  Created by Arjun Lalwani on 11/11/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class AmountViewController: UIViewController {
    
    @IBOutlet var collectionOfButtons: Array<UIButton>?
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var seguedFrom = "Balance"
    var currTextState = "0.00"
    var pinEntered = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.customPurple
        updateUI()
    }

    func updateUI() {
        let navBar = navigationController?.navigationBar
        for button in collectionOfButtons! {
            if (button.currentTitle == ".") {
                if seguedFrom == "UserName" {
                    button.setTitle("", for: .normal)
                    button.isEnabled = false
                } else {
                    button.tag = 10
                }
            } else if (button.currentTitle == "<") {
                button.tag = 11
            } else {
                button.tag = Int(button.currentTitle!)!
            }
            button.setTitleColor(UIColor.white, for: .normal)
        }
        nextButton.setTitleColor(UIColor.white, for: .normal)
        amountLabel.textColor = UIColor.white
        
        // update amount Label UI
        switch seguedFrom {
        case "Balance":
            amountLabel.text = "$0.00"
            titleLabel.text = "Enter Amount to Send"
            navBar?.topItem?.title = "Balance"
        case "UserName":
            amountLabel.text = ""
            currTextState = ""
            titleLabel.text = "Enter PIN"
            navBar?.topItem?.title = "User Name"
        default:
            break
        }
        
        // update label UIs
        amountLabel.font = UIFont.customAmount58Med
        amountLabel.textColor = UIColor.white
        titleLabel.font = UIFont.customBalance22Med
        titleLabel.textColor = UIColor.white
        
        // customize navBar
        navBar?.isTranslucent = false
        
        // hide 1px line below nav bar
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
    }
    
    @IBAction func keypadTapped(_ sender: UIButton) {
        switch seguedFrom {
        case "Balance":
            updateStateForAmount(sender)
            amountLabel.text = "$\(currTextState)"
        case "UserName":
            updateStateForPIN(sender)
            amountLabel.text = "\(currTextState)"
        default:
            break
        }
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        switch seguedFrom  {
        case "Balance":
            performSegue(withIdentifier: "userNameSegue", sender: self)
        case "UserName":
              print(pinEntered)
              // Dummy Alert
              let alert = UIAlertController(title: "Transfer Complete", message: "Transfer Amount = $7.60 + Fee = $25.89", preferredStyle: .alert)
              let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
              alert.addAction(cancel)
              self.present(alert, animated: true, completion: nil)
            
        default:
            break
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "userNameSegue") {
            let destination = segue.destination as? UserNameViewController
            destination?.navigationItem.title = "User Name"
        }
    }
    
    private func updateStateForAmount(_ sender: UIButton) {
        let title = sender.currentTitle!
        if (currTextState == "0.00") {
            if (sender.tag == 10) {
                currTextState = "0."
            } else if (sender.tag == 11) {
                currTextState = "0.00"
            } else {
                currTextState = title
            }
        } else {
            switch sender.tag {
            case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
                if (currTextState.count > 15) { break }
                currTextState.append(title)
            case 10:
                if (currTextState.count > 15) { break }
                if (currTextState.range(of: ".") == nil) {
                    currTextState.count == 0 ? currTextState.append("0\(title)") : currTextState.append(title)
                }
            case 11:
                currTextState = String(currTextState.dropLast())
            default:
                break
            }
        }
    }
    
    private func updateStateForPIN(_ sender: UIButton) {
        let title = sender.currentTitle!
        switch sender.tag {
        case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
            if (currTextState.count > 3) { break }
            currTextState.append("\u{25CF}")
            pinEntered.append(title)
        case 11:
            currTextState = String(currTextState.dropLast())
            pinEntered = String(pinEntered.dropLast())
        default:
            break
        }
    }
}
