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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        updateNav()
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
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(69.0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            performSegue(withIdentifier: "transactionsSegue", sender: self)
        } else if (indexPath.row == 1) {
            performSegue(withIdentifier: "sendMoneySegue", sender: self)
        } else if (indexPath.row == 2) {
            performSegue(withIdentifier: "payAtStoreSegue", sender: self)
        } else if (indexPath.row == 3){
            performSegue(withIdentifier: "generateQRCodeSegue", sender: self)
        }
    }
    
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
    
    func updateNav() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func updateUI() {
        
        view.backgroundColor = UIColor.customPurple
    
        // Text
        let dollarSign = NSMutableAttributedString(string: "$")
        let amount = NSMutableAttributedString(string: "73.73") // update with real value later
        let usd = NSMutableAttributedString(string: "\nBalance USD")
        
        let customCurrencySignAttributes = [NSAttributedStringKey.foregroundColor: UIColor.customLightGray,
                                            NSAttributedStringKey.font: UIFont.details]
        
        let customAmountAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                      NSAttributedStringKey.font: UIFont.amount]

        let customCurrencyAttributes = [NSAttributedStringKey.foregroundColor: UIColor.customLightGray,
                                        NSAttributedStringKey.font: UIFont.customBalance24]
    
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
        
        // Nav Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "transactionsSegue") {
            let destination = segue.destination as? TransactionsViewController
            destination?.navigationItem.title = "Transactions"
        }
    }
}
