//
//  MainModuleInteractor.swift
//  WeatherApp
//
//  Created by AndUser on 15.03.2021.
//

// MARK: - MainModuleInteractorProtocol

protocol MainModuleInteractorProtocol {
    func getCurrentWeather(completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void)
}

struct MainModuleInteractor: MainModuleInteractorProtocol {

    // MARK: - Get Current, Hourly, Daily Weather

    func getCurrentWeather(completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void) {
        Networker().requestWeather(completion: completionHandler)
    }

}
