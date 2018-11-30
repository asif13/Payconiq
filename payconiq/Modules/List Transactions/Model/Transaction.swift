//
//  Transaction.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import Foundation
import MapKit
struct Transaction: Codable {
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case coordinatesString = "coordinates"
        case date = "date"
        case effectiveDate = "effective date"
        case amount = "amount"
    }
    let description: String?
    let coordinatesString: String?
    let date: String?
    let effectiveDate: String?
    let amount: String?
    var coordinates: CLLocationCoordinate2D? {
        get {
            return MapKitUtilities.parseCoordinates(coordinate: coordinatesString)
        }
    }
}
