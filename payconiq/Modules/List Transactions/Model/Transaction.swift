//
//  Transaction.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import Foundation
import MapKit
struct Transaction: Codable,Hashable {
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case coordinatesStr = "coordinates"
        case date = "date"
        case effectiveDate = "effective date"
        case amountStr = "amount"
    }
    let description: String?
    let coordinatesStr: String?
    let date: String?
    let effectiveDate: String?
    let amountStr: String?
    var coordinates: CLLocationCoordinate2D? {
        get {
            return PayconiqUtilities.parseCoordinates(coordinatesStr)
        }
    }
    var amount:Double{
        get {
            return PayconiqUtilities.parseAmount(amountStr) ?? 0
        }
    }
    var currency:String?{
        get {
            return PayconiqUtilities.parseAmountToCurrency(amountStr)
        }
    }
    
}
