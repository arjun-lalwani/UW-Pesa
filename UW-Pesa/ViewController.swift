//
//  ViewController.swift
//  UW-Pesa
//
//  Created by Arjun Lalwani on 10/31/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let options = ["View Transactions", "Send Money", "Pay at Store", "Generate QR Code"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateUI()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0 // this should super view / 4 to cover entire bottom screen!!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "optionsCell", for: indexPath) as! OptionTableViewCell
       cell.backgroundColor = UIColor.customPurple
       cell.textLabel?.text = options[indexPath.row]
       cell.textLabel?.textColor = UIColor.white
       cell.textLabel?.font = UIFont.options
       cell.selectionStyle = UITableViewCellSelectionStyle.none
       return cell
    }
    // did Select Row at index path
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.backgroundColor = UIColor.customDarkPurple
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.backgroundColor = UIColor.customPurple
        }
    }
    
    func updateUI() {
        
        view.backgroundColor = UIColor.customPurple
        
        // Text
        let dollarSign = NSMutableAttributedString(string: "$")
        let amount = NSMutableAttributedString(string: "73.73") // update with real value later
        let usd = NSMutableAttributedString(string: "\nBalance USD")
        
        let customCurrencySignAttributes : [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor: UIColor.customLightGray,
                                                                            NSAttributedStringKey.font: UIFont.details]
        
        let customAmountAttributes : [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                                                      NSAttributedStringKey.font: UIFont.amount]

        let customCurrencyAttributes : [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor: UIColor.customLightGray,
                                                                        NSAttributedStringKey.font: UIFont.currency]
    
        dollarSign.addAttributes(customCurrencySignAttributes, range: NSMakeRange(0, dollarSign.length))
        amount.addAttributes(customAmountAttributes, range: NSMakeRange(0, amount.length))
        usd.addAttributes(customCurrencyAttributes, range: NSMakeRange(0, usd.length))
        
        amount.append(usd)
        dollarSign.append(amount)
        
        balance.attributedText = dollarSign
        
        // Table View configutation
        
        tableView.backgroundColor = UIColor.customPurple
        tableView.tableFooterView = UIView()
        if (options.count < 5) {
            self.tableView.isScrollEnabled = false
        }
    }
}

extension UIFont {
    class var details: UIFont {
        return UIFont(name: "Avenir Next", size: CGFloat(48))!
    }
    
    class var currency: UIFont {
        return UIFont(name: "Avenir Next", size: CGFloat(24))!
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
