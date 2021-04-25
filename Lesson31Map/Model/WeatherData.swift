//
//  WeathWeatherDataeData.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 23.04.21.
//

import MapKit

struct WeatherData: Decodable {
    var main: Main
}

struct Main: Decodable {
    var temp: Double
    var tempMin: Double
    var tempMax: Double
    var tempFeelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case tempFeelsLike = "feels_like"
    }
}
