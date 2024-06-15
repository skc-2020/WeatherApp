//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by SKC on 07.04.2021.
//

// MARK: - Weather

struct Weather: Codable {

    var timezone: String
    let timezoneOffset: Int
    let current: Current
    let daily: [Daily]
    var hourly: [Current]

    enum CodingKeys: String, CodingKey {
        case timezone, current, daily, hourly
        case timezoneOffset = "timezone_offset"
    }

}

// MARK: - Current

struct Current: Codable {

    let dt: Int
    let temp: Double
    let humidity: Int
    let clouds: Int
    let weather: [WeatherElement]

}

// MARK: - WeatherElement

struct WeatherElement: Codable {

    let weatherConditions: WeatherConditions
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case icon
        case weatherConditions = "main"
        case weatherDescription = "description"
    }

}

enum WeatherConditions: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
    case mist = "Mist"
    case fog = "Fog"
    case sand = "Sand"
    case smoke = "Smoke"
}

// MARK: - Daily

struct Daily: Codable {

    let dt: Int
    let temp: Temp
    let humidity: Int
    let weather: [WeatherElement]
    let clouds: Int

}

// MARK: - Temp

struct Temp: Codable {

    let day: Double
    let min: Double
    let max: Double

}
