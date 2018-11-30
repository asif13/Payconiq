//
//  MapKitUtilities.swift
//  payconiq
//
//  Created by Asif Junaid on 11/30/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import MapKit

struct MapKitUtilities {
    /*
     Parse the coordinates from string to CLLocation, so that it can be used easily by MapKit
     */
    static func parseCoordinates(coordinate:String?)->CLLocationCoordinate2D?{
        guard let coordinatesStr = coordinate else { return nil }
      
        let coordinatesArray = coordinatesStr.components(separatedBy: ", ")
        let coordinates = coordinatesArray.compactMap { (coordinateStr) -> Double? in
            return Double(coordinateStr)
        }
        
        guard coordinates.count >= 2 else { return nil}
        
        return  CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1])
    }
}
