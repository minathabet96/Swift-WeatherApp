//
//  DetailsViewModel.swift
//  WeatherApp
//
//  Created by Mina on 18/05/2024.
//

import Foundation
class DetailsViewModel {
    var forecast: Forecastday
    init(forecast: Forecastday) {
        self.forecast = forecast
    }
    
    func getHours() -> Forecastday {
        return forecast
    }
}
