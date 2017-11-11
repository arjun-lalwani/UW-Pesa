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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.customPurple
        updateUI()
    }

    func updateUI() {
        for button in collectionOfButtons! {
            button.setTitleColor(UIColor.white, for: .normal)
        }
        nextButton.setTitleColor(UIColor.white, for: .normal)
        amountLabel.textColor = UIColor.white
        titleLabel.textColor = UIColor.white
        
        let navBar = navigationController?.navigationBar
        
        navBar?.topItem?.title = "Balance"
        navBar?.isTranslucent = false
        
        
        // hide 1px line below nav bar
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
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
