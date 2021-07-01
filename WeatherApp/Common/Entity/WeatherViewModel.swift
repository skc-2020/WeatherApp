//
//  ViewModel.swift
//  WeatherApp
//
//  Created by AndUser on 09.04.2021.
//

// MARK: - View Model

struct WeatherViewModel {

    let locationName: String
    let daily: [DailyForecastModel]
    var hourly: [CurrentForecastModel]?

}

// MARK: - Daily

extension WeatherViewModel {

    struct DailyForecastModel {
        let dt: Int
        let weather: WeatherElement
        let temperature: Temperature
        let humidity: String
        let clouds: Int
    }

}

// MARK: - Current

extension WeatherViewModel {

    struct CurrentForecastModel {
        var dt: String
        let temp: String
        let weather: WeatherElement
    }

}

// MARK: - Temperature

extension WeatherViewModel {

    struct Temperature {
        let day: String
        let min: String
        let max: String
    }

}

// MARK: - WeatherElement

extension WeatherViewModel {

    struct WeatherElement {
        var icon: String?
        var weatherDescription: String?
    }

}
