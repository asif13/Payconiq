//
//  ListTransactionExpandedTableViewCell.swift
//  payconiq
//
//  Created by Asif Junaid on 12/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

class ListTransactionExpandedTableViewCell: ListTransactionTableViewCell {
    
    @IBOutlet weak var transactionDateLbl: UILabel!
    @IBOutlet weak var openMapBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        openMapBtn.layer.borderColor = ColorConstants.border.cgColor
    }
    /// Update cell from model
    ///
    /// - Parameter transaction: transation
    override func updateCell(transaction:Transaction){
        super.updateCell(transaction: transaction)
        transactionDateLbl.text = transaction.date ?? emptyLabelText
    }
    @IBAction func openMapAction(_ sender: UIButton) {
        didSelectOpenMap?(transation)
    }
    
}
