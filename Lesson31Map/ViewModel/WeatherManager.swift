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
    

}
