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
    
    ///Zoom version 2.0. If there is a pin on the map, it is drawn exactly on it.
    func zoom(mapView: MKMapView, _ zoomin : Bool) {
        var region: MKCoordinateRegion = mapView.region
        
        if let latitude = mapView.annotations.first?.coordinate.latitude, let longitude = mapView.annotations.first?.coordinate.longitude {
            region.center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        
        region.span.latitudeDelta = zoomin ? region.span.latitudeDelta / 3 : region.span.latitudeDelta * 5
        region.span.longitudeDelta = zoomin ? region.span.longitudeDelta / 3 : region.span.longitudeDelta * 5
        mapView.setRegion(region, animated: true)
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
    
    ///General zoom over the current geo position. Used for a nice zoom.
    func generalZoom(_ mapView: MKMapView, to locationManager: CLLocationManager) {
        let viewRegion = MKCoordinateRegion(center: locationManager.location!.coordinate, latitudinalMeters: 600_000, longitudinalMeters: 600_000)
        mapView.setRegion(viewRegion, animated: true)
    }
    
    //Самописная отсрочка перед выполнение блока кода
    func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }
}
