//
//  LocationManagerDelegate.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 27.04.21.
//

import CoreLocation

extension ViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationClicking(self)
    }
}
