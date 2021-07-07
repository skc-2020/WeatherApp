//
//  MainModuleInteractor.swift
//  WeatherApp
//
//  Created by AndUser on 15.03.2021.
//

// MARK: - MainModuleInteractorProtocol

protocol MainModuleInteractorProtocol {
    func getCurrentWeather(completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void)
    func didSetupUserLocation()
}

struct MainModuleInteractor: MainModuleInteractorProtocol {

    // MARK: - Private variables

    private let location = Location()

    // MARK: - Get Current, Hourly, Daily Weather

    func getCurrentWeather(completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void) {
        Networker().requestWeather(completion: completionHandler)
    }

    func didSetupUserLocation() {
        location.setupUserLocation()
    }

}
