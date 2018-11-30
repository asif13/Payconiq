//
//  Transaction.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import Foundation

struct Transaction: Codable {
    enum CodingKeys: String, CodingKey {
        case coordinates = "coordinates"
        case data = "data"
        case effectiveDate = "effective date"
        case amount = "amount"
    }
    let coordinates: String?
    let data: String?
    let effectiveDate: String?
    let amount: String?
}
