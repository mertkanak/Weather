//
//  Weather.swift
//  Weather
//
//  Created by mert Kanak on 11.12.2022.
//

import Foundation

struct Weather: Decodable {
    var name: String
    var main: Main
    
    struct Main: Decodable {
        var temp: Double
        var feelsLike: Double
        var tempMin: Double
        var tempMax: Double
        var pressure: Double
        var humidity: Double
        
        enum CodingKeys: String, CodingKey {
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case temp
            case pressure
            case humidity
        }
    }
}


extension Weather {
    var temp: Double {
        return main.temp 
    }
    
    var feelsLike: Double {
        return main.temp
    }
    
    var tempMin: Double {
        return main.tempMin
    }
    
    var tempMax: Double {
        return main.tempMax
    }
    
    var pressure: Double {
        return main.pressure
    }
    
    var humidity: Double {
        return main.humidity
    }
    
}
