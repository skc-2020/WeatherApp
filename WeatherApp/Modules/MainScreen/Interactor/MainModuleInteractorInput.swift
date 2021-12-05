//
//  MainModuleInteractorInput.swift
//  WeatherApp
//
//  Created by AndUser on 26.07.2021.
//

protocol MainModuleInteractorInput {

    func getCurrentWeather(for city: String, completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void)
    func getInitialCurrentWeather(completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void)

}
