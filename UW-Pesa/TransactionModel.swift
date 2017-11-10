//
//  HistoryDetails.swift
//  UW-Pesa
//
//  Created by Arjun Lalwani on 11/9/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import Foundation


struct TransactionDetail {
    let historyDetails, amount, transactionTime: String
    let historySummary: String?
    
    init(historyDetials details: String, amount: String, historySummary summary: String? = nil, transactionTime time: String) {
        self.historyDetails = details
        self.amount = amount
        self.transactionTime = time
        self.historySummary = summary
    }
}
