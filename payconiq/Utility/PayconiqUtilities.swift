//
//  MapKitUtilities.swift
//  payconiq
//
//  Created by Asif Junaid on 11/30/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import MapKit

struct PayconiqUtilities {
    /*
     Parse the coordinates from string to CLLocation, so that it can be used easily by MapKit
     */
    static func parseCoordinates(_ coordinate:String?)->CLLocationCoordinate2D?{
        guard let coordinatesStr = coordinate else { return nil }
      
        let coordinatesArray = coordinatesStr.components(separatedBy: ", ")
        let coordinates = coordinatesArray.compactMap { (coordinateStr) -> Double? in
            return Double(coordinateStr)
        }
        
        guard coordinates.count >= 2 else { return nil}
        
        return  CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1])
    }
    static func parseAmount(_ amountStr:String?)->Double?{
        guard let amount = amountStr else { return nil }
        return Double(amount.replacingOccurrences(of: ",", with: "."))
    }
    static func parseAmountToCurrency(_ amountStr:String?)->String?{
        guard let amount = amountStr,
              let amountDouble = Double(amount.replacingOccurrences(of: ",", with: "."))
            else { return nil }
        let amountNSNumber = NSNumber(value: amountDouble)
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currency
        return formatter.string(from: amountNSNumber)
    }
}
