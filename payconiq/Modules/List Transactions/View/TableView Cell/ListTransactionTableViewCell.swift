//
//  ListTransactionTableViewCell.swift
//  payconiq
//
//  Created by Asif Junaid on 11/30/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

class ListTransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var mapSnapshotImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var effectiveDateLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    
    @IBOutlet weak var backgroundCellView: UIView!
    let emptyLabelText = "--"
    var didSelectOpenMap: ((_ transation : Transaction)->())? // closure called when open map is selected
    var transation: Transaction!
    /// Update cell from model
    ///
    /// - Parameter transaction: transation
    func updateCell(transaction:Transaction){
        self.transation = transaction
        descriptionLbl.text = transaction.description ?? emptyLabelText
        effectiveDateLbl.text = transaction.effectiveDate ?? emptyLabelText
        amountLbl.text = transaction.currency ?? emptyLabelText
        amountLbl.textColor = transaction.amount >= 0 ? ColorConstants.depositMoney : ColorConstants.deductionMoney
        if let coordinates = transaction.coordinates{
            mapSnapshotImg.setSnapshotOfLocationAsImage(key: coordinates)
        }
    }
   
}
