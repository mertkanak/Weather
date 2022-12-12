//
//  HomeViewModel.swift
//  Weather
//
//  Created by mert Kanak on 11.12.2022.
//

import Foundation

class HomeViewModel {
    var weather: Weather?
    
    // MARK: - Header Strings
    
    var temperatureString: String {
        return String(format : "%.1f", ((weather?.temp ?? 0).kelvinToCelcius)) + "° C"
    }
    
    var nameString: String {
        return String(weather?.name ?? "")
    }
    
    // MARK: - SubHeader Strings
    
    var feelsLikeTemperatureString: String {
        return displayableTemperature(weather?.feelsLike ?? 0)
    }
    var minTemperatureString: String {
        return displayableTemperature(weather?.tempMin ?? 0)
    }
    var maxTemperatureString: String {
        return displayableTemperature(weather?.tempMax ?? 0)
    }
        
    var pressureTemperatureString: String {
        return String((weather?.pressure ?? 0) )
    }
    var humidityTemperatureString: String {
        return String((weather?.humidity ?? 0) )
    }
    
    // MARK: - Helpers
    private func displayableTemperature(_ temperatureAsCelcius: Double) -> String {
        return String(format: "%.1f", temperatureAsCelcius.kelvinToCelcius) + "° C"
    }
    /*
     feelslikeLabel.text = viewModel.feelsLikeTemperatureString
     minTemperatureLabel.text = viewModel.minTemperatureString
     maxTemperatureLabel.text = viewModel.maxTemperatureString
     pressureLabel.text = viewModel.pressureTemperatureString
     humidityLabel.text = viewModel.humidityTemperatureString
     */
    
    func fetchWeather(for cityId: Int = 5128581, _ completion: @escaping (() -> Void)) {
        NetworkController.fetchWeather(for: cityId) { weather in
            self.weather = weather
            completion()
        }
    }
}
