//
//  FoundCityScreenInteractorInput.swift
//  WeatherApp
//
//  Created by SKC on 15.01.2024.
//

protocol FoundCityScreenInteractorInput {

    func fetchWeather(for city: String, completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void)

}
