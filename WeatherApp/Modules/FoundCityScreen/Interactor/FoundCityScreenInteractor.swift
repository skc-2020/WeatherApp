//
//  FoundCityScreenInteractor.swift
//  WeatherApp
//
//  Created by SKC on 15.01.2024.
//

struct FoundCityScreenInteractor {

    private let weatherService: WeatherServiceProtocol

    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }

}

// MARK: - FoundCityScreenInteractorInput

extension FoundCityScreenInteractor: FoundCityScreenInteractorInput {

    // MARK: Get Current, Hourly, Daily Weather
    func fetchWeather(for city: String = "Kyiv", completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void) {
        weatherService.requestWeather(for: city, completionHandler: completionHandler)
    }

}
