//
//  QRCodeReceiveViewController.swift
//  UW-Pesa
//
//  Created by Arjun Lalwani on 11/21/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class QRCodeReceiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }

    
    func updateUI() {
        self.view.backgroundColor = UIColor.customPurple
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
