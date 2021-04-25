//
//  CurrentWeather.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 24.04.21.
//

import Foundation

struct CurrentWeather {
    
    private let temp: Double
    var tempStr: String {
        String(format: "%.f°C", temp)
    }
    
    private let tempMin: Double
    var tempMinStr: String {
        String(format: "%.f°", tempMin)
    }
    
    private let tempMax: Double
    var tempMaxStr: String {
        String(format: "%.f°", tempMax)
    }
    
    private let tempFeelsLike: Double
    var tempFeelsLikeStr: String {
        String(format: "%.f°", tempFeelsLike)
    }
    
    init?(weatherData: WeatherData) {
        temp = weatherData.main.temp
        tempMin = weatherData.main.tempMin
        tempMax = weatherData.main.tempMax
        tempFeelsLike = weatherData.main.tempFeelsLike
    }
}
