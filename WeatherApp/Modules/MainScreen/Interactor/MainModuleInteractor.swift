//
//  MainModuleInteractor.swift
//  WeatherApp
//
//  Created by AndUser on 15.03.2021.
//

// MARK: - MainModuleInteractorInput

struct MainModuleInteractor: MainModuleInteractorInput {

    var networker: NetworkerProtocol!

    // MARK: - Get Current, Hourly, Daily Weather

    func getCurrentWeather(for city: String = "Kyiv", completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void) {
        networker.fetchWeather(for: city, completionHandler: completionHandler)
    }

    func getInitialCurrentWeather(completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void) {
        networker.fetchWeather(completionHandler: completionHandler)
    }

}
