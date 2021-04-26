//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by AndUser on 07.04.2021.
//

// MARK: - Weather

struct Weather: Codable {

    var lat, lon: Double?
    var timezone: String?
    var timezoneOffset: Int?
    var current: Current?
    var daily: [Daily]?
    var hourly: [Current]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, daily, hourly
    }

}

// MARK: - Current

struct Current: Codable {

    let dt: Int
    var sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [WeatherElement]
    var rain: Rain?
    var windGust, pop: Double?
    var snow: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, rain
        case windGust = "wind_gust"
        case pop, snow
    }

}

// MARK: - Rain

struct Rain: Codable {

    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }

}

// MARK: - WeatherElement

struct WeatherElement: Codable {

    let id: Int
    var main: Main?
    let weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }

}

enum Main: String, Codable {

    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
    case mist = "Mist"
    case fog = "Fog"

}

// MARK: - Daily

struct Daily: Codable {

    var dt, sunrise, sunset: Int?
    let temp: Temp
    var feelsLike: FeelsLike?
    var pressure, humidity: Int?
    var dewPoint, windSpeed: Double?
    var windDeg: Int?
    var weather: [WeatherElement]?
    let clouds: Int
    var pop: Double?
    var rain, snow: Double?
    var uvi: Double?

    enum CodingKeys: String, CodingKey {

        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, clouds, pop, rain, snow, uvi

    }

}

// MARK: - FeelsLike

struct FeelsLike: Codable {

    let day, night, eve, morn: Double

}

// MARK: - Temp

struct Temp: Codable {

    let day, min, max: Double
    var night, eve, morn: Double?

}
