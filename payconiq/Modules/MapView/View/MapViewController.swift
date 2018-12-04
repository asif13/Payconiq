//
//  MapViewController.swift
//  payconiq
//
//  Created by Asif Junaid on 12/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var viewModel: MapViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Transaction Location"
        tabBarController?.navigationController?.title = "Transaction Location"
        pinMapWithTransactionLocation()
    }
    ///Pin map with transaction location
    func pinMapWithTransactionLocation(){
        guard let coordinate = viewModel.model.coordinates else{
            return
        }
        let regionDistance:CLLocationDistance = 10000
        let regionSpan = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        mapView.setRegion(regionSpan, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = viewModel.model.description ?? ""
        mapView.addAnnotation(annotation)
    }
}
