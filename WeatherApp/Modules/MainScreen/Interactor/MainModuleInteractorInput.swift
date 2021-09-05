//
//  MainModuleInteractorInput.swift
//  WeatherApp
//
//  Created by AndUser on 26.07.2021.
//

protocol MainModuleInteractorInput {

    func getCurrentWeather(completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void)
    func obtainCoordinates(address: String)
    func obtainCurrentLocation()

}
