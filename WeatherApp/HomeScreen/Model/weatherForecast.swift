//
//  weatherForecast.swift
//  WeatherApp
//
//  Created by Mina on 18/05/2024.
//

import Foundation

struct WeatherForecast: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}


struct Current: Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Int
    let tempF: Double
    let isDay: Int
    let condition: Condition

    let pressureMB: Int
    let pressureIn: Double
    let precipMm, precipIn, humidity, cloud: Int
    let feelslikeC, feelslikeF: Double
    let visKM: Int

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition

        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"

    }
}

struct Condition: Codable {
    let text: String
    let icon: Icon
    let code: Int
}

enum Icon: String, Codable {
    case cdnWeatherapiCOMWeather64X64Day113PNG = "//cdn.weatherapi.com/weather/64x64/day/113.png"
    case cdnWeatherapiCOMWeather64X64Day122PNG = "//cdn.weatherapi.com/weather/64x64/day/122.png"
    case cdnWeatherapiCOMWeather64X64Night113PNG = "//cdn.weatherapi.com/weather/64x64/night/113.png"
    case cdnWeatherapiCOMWeather64X64Night116PNG = "//cdn.weatherapi.com/weather/64x64/night/116.png"
}


struct Forecast: Codable {
    let forecastday: [Forecastday]
}

struct Forecastday: Codable {
    let date: String
    let dateEpoch: Int
    let day: Day
    let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, hour
    }
}

struct Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double
    let avgtempC, avgtempF, maxwindMph, maxwindKph: Double
    let totalprecipMm, totalprecipIn, totalsnowCM, avgvisKM: Int
    let avgvisMiles, avghumidity, dailyWillItRain, dailyChanceOfRain: Int
    let dailyWillItSnow, dailyChanceOfSnow: Int
    let condition: Condition
    let uv: Int

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition, uv
    }
}


struct Hour: Codable {
    let timeEpoch: Int
    let time: String
    let tempC, tempF: Double
    let isDay: Int
    //let condition: Condition?
    let windMph, windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMB: Int
    let pressureIn: Double
    let precipMm, precipIn, snowCM, humidity: Int
    let cloud: Int
    let feelslikeC, feelslikeF, windchillC, windchillF: Double
    let heatindexC, heatindexF, dewpointC, dewpointF: Double
    let willItRain, chanceOfRain, willItSnow, chanceOfSnow: Int
    let visKM, visMiles: Int
    let gustMph, gustKph: Double
    let uv: Int

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        //case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case snowCM = "snow_cm"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}


struct Location: Codable {
    let name, region, country: String

    enum CodingKeys: String, CodingKey {
        case name, region, country
    }
}
