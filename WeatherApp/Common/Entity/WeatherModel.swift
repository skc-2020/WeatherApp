//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by AndUser on 07.04.2021.
//

// MARK: - Weather

struct Weather: Decodable {

    let timezone: String
    let current: Current
    let daily: [Daily]
    var hourly: [Current]

}

// MARK: - Current

struct Current: Decodable {

    var dt: Int
    let temp: Double
    let humidity: Int
    let clouds: Int
    let weather: [WeatherElement]

}

// MARK: - WeatherElement

struct WeatherElement: Decodable {

    let weatherConditions: WeatherConditions
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case icon
        case weatherConditions = "main"
        case weatherDescription = "description"
    }

}

enum WeatherConditions: String, Decodable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
    case mist = "Mist"
    case fog = "Fog"
}

// MARK: - Daily

struct Daily: Decodable {

    let dt: Int
    let temp: Temp
    let humidity: Int
    let weather: [WeatherElement]
    let clouds: Int

}

// MARK: - Temp

struct Temp: Decodable {

    let day: Double
    let min: Double
    let max: Double

}
