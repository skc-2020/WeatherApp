//
//  ViewModel.swift
//  WeatherApp
//
//  Created by AndUser on 09.04.2021.
//

// MARK: - View Model

struct ViewModel: Codable {

    var locationName: String?
    var daily: [DailyForecastModel]?
    var hourly: [CurrentForecastModel]?

    enum CodingKeys: String, CodingKey {
        case locationName = "timezone"
        case daily, hourly
    }

    // MARK: - Daily

    struct DailyForecastModel: Codable {

        var dt: Int?
        var weather: WeatherElement?
        var temperature: Temperature?
        var humidity: String?
        var clouds: Int?

        enum CodingKeys: String, CodingKey {
            case dt, weather, humidity, clouds
            case temperature = "Temp"
        }

    }

    // MARK: - Current

    struct CurrentForecastModel: Codable {

        var dt: String
        let temp: String
        let weather: WeatherElement

        enum CodingKeys: String, CodingKey {
            case dt, temp, weather
        }

    }

    // MARK: - Temperature

    struct Temperature: Codable {

        var day, min, max: String?

        enum CodingKeys: String, CodingKey {
            case day, min, max
        }

    }

    // MARK: - WeatherElement

    struct WeatherElement: Codable {

        var icon: String?
        var weatherDescription: String?

        enum CodingKeys: String, CodingKey {
            case icon
            case weatherDescription = "description"
        }

    }

}
