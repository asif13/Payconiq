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
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var effectiveDateLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    
    @IBOutlet weak var backgroundCellView: UIView!
    let emptyLabelText = "--"
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundCellView.dropShadow(UIColor.black.withAlphaComponent(40))
    }
    
    func updateCell(transaction:Transaction){
        descriptionLbl.text = transaction.description ?? emptyLabelText
        dateLbl.text = transaction.date ?? emptyLabelText
        effectiveDateLbl.text = transaction.effectiveDate ?? emptyLabelText
        amountLbl.text = transaction.amount ?? emptyLabelText
        if let coordinates = transaction.coordinates{
            mapSnapshotImg.setSnapshotOfLocationAsImage(key: coordinates)
        }
    }
}
