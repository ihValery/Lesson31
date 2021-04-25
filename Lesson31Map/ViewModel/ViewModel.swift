//
//  MapUpdateManager.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 25.04.21.
//

import UIKit
import MapKit

class ViewModel {
    
    var mapPointManager = MapPointManager()

    ///Update PlaceMark when entering address in textField.
    func updatePlaceMark(_ mapView: MKMapView, _ textField: UITextField, to address: String) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { placemark, error in
            guard let placemark = placemark?.first, let location = placemark.location else { return }
            self.updateLocationOnMap(mapView, textField, to: location, with: placemark.locality)
        }
    }
    
    ///
    func updateTitleOnMap(_ mapView: MKMapView, _ textField: UITextField, to location: CLLocation, with title: String?) {
        textField.text = title
        mapPointManager.sendRequestAndSetPonit(mapView, location: location)
    }
    
    ///Updating the location on the map. And zoom Up to this point.
    func updateLocationOnMap(_ mapView: MKMapView, _ textField: UITextField, to location: CLLocation, with title: String?) {
        textField.text = title
        mapPointManager.sendRequestAndSetPonit(mapView, location: location)
        
        let viewRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 3000, longitudinalMeters: 3000)
        mapView.setRegion(viewRegion, animated: true)
    }
}
