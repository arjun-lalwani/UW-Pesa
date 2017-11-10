//
//  HistoryTableViewCell.swift
//  UW-Pesa
//
//  Created by Arjun Lalwani on 11/9/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var historyDetails: UILabel!
    @IBOutlet weak var historySummary: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
