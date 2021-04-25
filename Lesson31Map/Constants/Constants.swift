//
//  Constants.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 24.04.21.
//

import Foundation

struct Const {
    
    struct API {
        static let url = "https://api.openweathermap.org/data/2.5/weather?units=metric"
        static let key = "964eb72593abb13b5677af07a8ca0fe8"
    }
    
    struct Error {
        static let problem = "Хьюстон, у нас проблемы"
        static let dontGetData = "Не смогли получить данные"
        static let dontParse = "Не смогли распарсить"
    }
}
