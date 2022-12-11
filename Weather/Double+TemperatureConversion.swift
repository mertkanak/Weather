//
//  Double+TemperatureConversion.swift
//  Weather
//
//  Created by mert Kanak on 11.12.2022.
//

import Foundation

extension Double {
    var kelvinToCelcius: Double {
        return (self - 273.15)
    }
}
