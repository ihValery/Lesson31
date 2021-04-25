//
//  MapPointManager.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 25.04.21.
//

import Foundation
import MapKit

protocol MapPoint {

    func sendRequestAndSetPonit(_ mapView: MKMapView, location: CLLocation)
}

class MapPointManager: MapPoint {
    
    ///A complete method including sending a request and setting a point.
    func sendRequestAndSetPonit(_ mapView: MKMapView, location: CLLocation) {
        WeatherManager.shared.createLinkGetWeatherData(coordinates: location.coordinate) { weatherData in
            DispatchQueue.main.async {
                guard let wearherData = weatherData else { return }
                self.createPin(mapView, coordinate: location.coordinate, data: wearherData)
            }
        }
    }
    
    ///Create Point with a description of the weather in a given location.
    private func createPin(_ mapView: MKMapView, coordinate: CLLocationCoordinate2D, data: WeatherData) {
        let point = MKPointAnnotation()
        point.coordinate = coordinate
        if let currentWeather = CurrentWeather(weatherData: data) {
            point.title = "Температура: \(currentWeather.tempStr)\n По ощущения:  \(currentWeather.tempFeelsLikeStr)"
            point.subtitle = "Мин: \(currentWeather.tempMinStr) Макс: \(currentWeather.tempMaxStr)"
        } else {
            point.title = Const.Error.dontGetData
        }
        //Добавляем булавку на карту (одну)
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(point)
    }
}
