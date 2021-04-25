//
//  CLLocation.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 25.04.21.
//

import CoreLocation

extension CLLocation {
    
    ///Adding the complete location as a title
    func lookUpPlaceMark(_ completion: @escaping (CLPlacemark?) -> Void) {
        let geocoder = CLGeocoder()
        //Ищем местоположение и передаем его обработчику завершения
        geocoder.reverseGeocodeLocation(self) { (placemarks, error) in
            guard error == nil else { return completion(nil) }
            let firstLocation = placemarks?[0]
            completion(firstLocation)
        }
    }
    
    ///Gives us the full address
    func lookUpLocationName(_ completion: @escaping (String?) -> Void) {
        lookUpPlaceMark { placemark in
            if let thoroughfare = placemark?.thoroughfare, let locality = placemark?.locality {
                completion(locality + " " + thoroughfare)
            } else if let locality = placemark?.locality {
                completion(locality)
            } else if let country = placemark?.country {
                completion(country)
            }
        }
    }
}
