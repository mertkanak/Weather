//
//  HomeViewModel.swift
//  Weather
//
//  Created by mert Kanak on 11.12.2022.
//

import Foundation

class HomeViewModel {
    var weather: Weather?
    
    var temperatureString: String {
        return String(format : "%.1f", ((weather?.temp ?? 0).kelvinToCelcius)) + "° C"
    }
    
    var nameString: String {
        return String(weather?.name ?? "")
    }
    
    func fetchWeather(for cityId: Int = 5128581, _ completion: @escaping (() -> Void)) {
        NetworkController.fetchWeather(for: cityId) { weather in
            self.weather = weather
            completion()
        }
    }
}
