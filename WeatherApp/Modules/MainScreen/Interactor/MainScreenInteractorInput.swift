//
//  MainScreenInteractorInput.swift
//  WeatherApp
//
//  Created by SKC on 26.07.2021.
//

protocol MainScreenInteractorInput {

    func fetchWeather(for city: String, completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void)
    func fetchInitialWeather(completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void)

}
