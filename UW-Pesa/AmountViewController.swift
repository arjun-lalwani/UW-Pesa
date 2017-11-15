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
    
    var currTextState = "0.00";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.customPurple
        updateUI()
    }

    func updateUI() {
        for button in collectionOfButtons! {
            if (button.currentTitle == ".") {
                button.tag = 10
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
        amountLabel.text = "$0.00"
        amountLabel.font = UIFont.customAmount58Med
        amountLabel.textColor = UIColor.white
        
        // update title label UI
        titleLabel.text = "Amount to Send"
        titleLabel.font = UIFont.customBalance22Med
        titleLabel.textColor = UIColor.white
        
        let navBar = navigationController?.navigationBar
        navBar?.topItem?.title = "Balance"
        navBar?.isTranslucent = false
        
        // hide 1px line below nav bar
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
    }
    
    @IBAction func keypadTapped(_ sender: UIButton) {
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
                if (amountLabel.text!.count > 15) { break;}
                currTextState.append(title)
            case 10:
                if (amountLabel.text!.count > 15) { break;}
                if (currTextState.range(of: ".") == nil) {
                    currTextState.count == 0 ? currTextState.append("0\(title)") : currTextState.append(title)
                }
            case 11:
                currTextState = String(currTextState.dropLast())
            default:
                break
            }
        }
        
        amountLabel.text = "$\(currTextState)"
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
