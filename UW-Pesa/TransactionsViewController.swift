//
//  TransactionsViewController.swift
//  UW-Pesa
//
//  Created by Arjun Lalwani on 11/2/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var historyTableView: UITableView!
    
    // dummy data
    let transactionModel1 = TransactionDetail(historyDetials: "Reboot", amount: "- $12.17", historySummary: "Cafe", transactionTime: "12h")
    let transactionModel2 = TransactionDetail(historyDetials: "Sent", amount: "- $25.7", historySummary: "p_0001", transactionTime: "18h")
    let transactionModel3 = TransactionDetail(historyDetials: "Receieved", amount: "+ $49.0", historySummary: "p_004", transactionTime: "1d")
    let transactionModel4 = TransactionDetail(historyDetials: "Snack Overflow", amount: "- $10.1", historySummary: "Food", transactionTime: "4d")
     let transactionModel5 = TransactionDetail(historyDetials: "Received", amount: "+ $180.0", historySummary: "a_0007", transactionTime: "6d")
     let transactionModel6 = TransactionDetail(historyDetials: "Reboot", amount: "- $21.7", historySummary: "Cafe", transactionTime: "7d")
    
    var historyModel = [TransactionDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar = navigationController?.navigationBar
        navBar?.topItem?.title = "Balance"
        navBar?.isTranslucent = false
        
        // hide 1px line below nav bar
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
        
        // Do any additional setup after loading the view.
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.backgroundColor = UIColor.customPurple
        historyTableView.allowsSelection = false
        
        // load dummy data
        historyModel.append(transactionModel1)
        historyModel.append(transactionModel2)
        historyModel.append(transactionModel3)
        historyModel.append(transactionModel4)
        historyModel.append(transactionModel5)
        historyModel.append(transactionModel6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateUI()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return historyModel.count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 18))
        footerView.backgroundColor = UIColor.customPurple
        return footerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 18
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        
        // Cell Data
        cell.historyDetails.text = historyModel[indexPath.section].historyDetails
        cell.amount.text = historyModel[indexPath.section].amount
        cell.time.text = historyModel[indexPath.section].transactionTime
        cell.historySummary.text = historyModel[indexPath.section].historySummary!
        
        // Cell UI
        cell.backgroundColor = UIColor.customDarkPurple
        cell.historyDetails.textColor = UIColor.white
        if (historyModel[indexPath.section].amount.contains("-")) {
            cell.amount.textColor = UIColor.customRedNegative
        } else {
            cell.amount.textColor = UIColor.customGreenPositive
        }
        cell.time.textColor = UIColor.white
        cell.historySummary.textColor = UIColor.white
        
        return cell
    }
    
    
    
    func updateUI() {
        self.view.backgroundColor = UIColor.customPurple
        
        // Text
        let currencySign = NSMutableAttributedString(string: "$")
        let amount = NSMutableAttributedString(string: "73") // update with real value later
        let amountDetails = NSMutableAttributedString(string: ".73")
        let balanceText = NSMutableAttributedString(string: "  Balance")
        let currency = NSMutableAttributedString(string: " USD")
        
        let customCurrencySignAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                            NSAttributedStringKey.font: UIFont.customBalance36Med]
        
        let customAmountAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                      NSAttributedStringKey.font: UIFont.customBalance36Med]
        
        let customAmountDetailsAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                             NSAttributedStringKey.font: UIFont.customBalance24]
        
        let customBalanceAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                       NSAttributedStringKey.font: UIFont.customBalance16]
        
        let customCurrencyAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                        NSAttributedStringKey.font: UIFont.customBalance16]
        
    
        currencySign.addAttributes(customCurrencySignAttributes, range: makeRange(currencySign))
        amount.addAttributes(customAmountAttributes, range: makeRange(amount))
        amountDetails.addAttributes(customAmountDetailsAttributes, range: makeRange(amountDetails))
        balanceText.addAttributes(customBalanceAttributes, range: makeRange(balanceText))
        currency.addAttributes(customCurrencyAttributes, range: makeRange(currency))
     
        balanceText.append(currency)
        amountDetails.append(balanceText)
        amount.append(amountDetails)
        currencySign.append(amount)
        
        balance.attributedText = currencySign
    
        balance.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 96)
    }
    
    private func makeRange(_ text: NSMutableAttributedString) -> NSRange {
        return NSMakeRange(0, text.length)
    }
}
