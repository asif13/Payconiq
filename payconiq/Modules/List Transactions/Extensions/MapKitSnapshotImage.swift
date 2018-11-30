//
//  MapKitSnapshotImage.swift
//  payconiq
//
//  Created by Asif Junaid on 11/30/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
import MapKit

let imageCache = NSCache<AnyObject, UIImage>()

extension UIImageView {
    func setSnapshotOfLocationAsImage(key: CLLocationCoordinate2D){
        
        if let imageFromCache = imageCache.object(forKey: key as AnyObject) {
            self.image = imageFromCache
            return
        }
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        
        let region = MKCoordinateRegion(center: key, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapSnapshotOptions.region = region
        mapSnapshotOptions.scale = UIScreen.main.scale
        mapSnapshotOptions.size = CGSize(width: 100, height: 100)
        
        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)
        snapShotter.start { (snapshot, error) in
            guard error == nil else { return }
            guard let image = snapshot?.image else { return }
            
            DispatchQueue.main.async {
                imageCache.setObject(image, forKey: key as AnyObject)
                self.image = image
            }
        }
    }
}

