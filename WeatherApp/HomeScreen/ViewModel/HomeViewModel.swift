//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Mina on 18/05/2024.
//

import Foundation
import Alamofire
import MapKit
class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var response: WeatherForecast?
    @Published var errorMessage: String?
    @Published var day2: String?
    @Published var day3: String?
    func fetchData(lat: Double, lon: Double) {
        print(lat)
        print(lon)
        AF.request("https://api.weatherapi.com/v1/forecast.json?key=91d7e89612444588848112540241805&q=\(lat),\(lon)&days=3&aqi=no&alerts=no")
            .validate()
            .responseDecodable(of: WeatherForecast.self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.day2 = data.forecast.forecastday[1].date
                        self.day3 = data.forecast.forecastday[2].date
                        print("success")
                        print(data.forecast.forecastday[0].hour.count)
                        
                        self.response = data
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error)
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
    }
    func dayName(from date: String) -> String {
        let dateFormatter = DateFormatter(); dateFormatter.dateFormat = "yyyy-MM-dd"
        let dayName = dateFormatter.weekdaySymbols[Calendar.current.component(.weekday, from: dateFormatter.date(from: date)!) - 1]
        return dayName
    }
}
