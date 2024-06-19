//
//  MainModuleInteractor.swift
//  WeatherApp
//
//  Created by SKC on 15.03.2021.
//

struct MainScreenInteractor {

    private let weatherService: WeatherServiceProtocol

    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }

}

// MARK: - MainModuleInteractorInput

extension MainScreenInteractor: MainScreenInteractorInput {

    // MARK: Get Current, Hourly, Daily Weather
    func fetchWeather(for city: String = "Kyiv", completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void) {
        weatherService.requestWeather(for: city, completionHandler: completionHandler)
    }

    func fetchInitialWeather(completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void) {
        weatherService.requestWeather(completionHandler: completionHandler)
    }

}
