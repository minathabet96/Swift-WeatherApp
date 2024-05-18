//
//  WeatherItems.swift
//  WeatherApp
//
//  Created by Mina on 17/05/2024.
//

import Foundation
struct WeatherItem : Identifiable {
    var id: Int
    
    var day: String = "Tue"
    var icon = "🌥️"
    var degree: String = "24.5"
    var condition: String = "cloudy"
}
let weatherItems = [WeatherItem(id: 0), WeatherItem(id: 1), WeatherItem(id: 2)]
