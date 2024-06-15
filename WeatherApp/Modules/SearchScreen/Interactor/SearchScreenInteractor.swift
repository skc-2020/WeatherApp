//
//  SearchModuleInteractor.swift
//  WeatherApp
//
//  Created by SKC on 20.04.2022.
//

protocol SearchScreenInteractorInput {
    func fetchCitiesList(completionHandler: @escaping (Result<[CityModel.City.Country], Error>) -> Void)
    func fetchWeather(for city: String, completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void )
}

struct SearchScreenInteractor {

    private let citiesListService: CitiesListService
    private let weatherService: WeatherService

    init(citiesService: CitiesListService, weatherService: WeatherService) {
        self.citiesListService = citiesService
        self.weatherService = weatherService
    }

}

// MARK: - SearchScreenInteractorInput

extension SearchScreenInteractor: SearchScreenInteractorInput {

    func fetchCitiesList(completionHandler: @escaping (Result<[CityModel.City.Country], Error>) -> Void) {
        citiesListService.requestCities(completionHandler: completionHandler)
    }

    func fetchWeather(for city: String, completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void) {
        weatherService.requestWeather(for: city, completionHandler: completionHandler)
    }

}
