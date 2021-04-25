//
//  WeatherManager.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 23.04.21.
//

import MapKit

class WeatherManager {
    
    static let shared = WeatherManager()
//    Еще не полностью понял зачем и как работает
//    private init() {}
    
    var networkDataFetcher: NetworkDataFetcher
    init(networkDataFetcher: NetworkDataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
    }
    
    ///Create a link ready for sending (with: coordinate, and: key)
    func createLinkGetWeatherData(coordinates: CLLocationCoordinate2D, completion: @escaping (WeatherData?) -> Void) {
        let latitude = coordinates.latitude
        let longitude = coordinates.longitude
        let urlString = "\(Const.API.url)&appid=\(Const.API.key)&lat=\(latitude)&lon=\(longitude)"
        
        networkDataFetcher.fetchJSON(urlString: urlString, completionResponse: completion)
    }
}
