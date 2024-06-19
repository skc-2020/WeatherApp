//
//  SearchScreenPresenter.swift
//  WeatherApp
//
//  Created by SKC on 05.12.2021.
//

import Dispatch
import UIKit

final class SearchScreenPresenter: SearchScreenOutput {

    var router: SearchRouterInput?

    // MARK: - Private Variables

    private unowned let view: SearchScreenInput
    private let interactor: SearchScreenInteractorInput
    private let group = DispatchGroup()

    init(view: SearchScreenInput, interactor: SearchScreenInteractorInput) {
        self.view = view
        self.interactor = interactor

        guard let cities: [String] = defaults.value(forKey: Saved.favouriteCitiesList.rawValue) as? [String] else {
            print("Error! Couldn't get the list of favourite cities from the UserDefaults")
            return
        }

        getWeatherAndConfigureScreen(for: cities)
    }

    func showScreenWithFound(_ city: String) {
        router?.openFoundCityScreen(for: city)
    }

    func showMainScreen(for city: String) {
        router?.openMainScreen(for: city)
    }

}

// MARK: - Lifecycle Listener

extension SearchScreenPresenter: LifecycleListener {

    func viewDidAppear() {
        getAllCities()
    }

}

// MARK: - Configure Search Screen

extension SearchScreenPresenter {

    func getAllCities() {
        interactor.fetchCitiesList { [weak self] result in
            switch result {
            case let .success(countriesList):
                guard let mappedCityList = self?.mapCitiesModel(countriesList) else { return }

//               ADD: if there're no cities, then save!
                defaults.save(mappedCityList, forKey: Saved.citiesList.rawValue)
                self?.view.reloadCitiesTableData()
            case let .failure(error):
                print(error)
            }
        }
    }

    func getWeatherForFavourite(cities: [String]) {
        var tempWeatherArray = [Weather]()
        // create new structure with ordered indexes and weather
        var newTempArray = [Weather].init(
            repeating: Weather(
                timezone: "",
                timezoneOffset: 0,
                current: Current(
                    dt: 0,
                    temp: 0,
                    humidity: 0,
                    clouds: 0,
                    weather: []
                ),
                daily: [],
                hourly: []
            ),
            count: cities.count
        )

        for (index, city) in cities.enumerated() {
            self.group.enter()
            self.interactor.fetchWeather(for: city) { result in
                switch result {
                case var .success(weather):
                    if weather.timezone.contains("_") {
                        weather.timezone = weather.timezone.replacingOccurrences(of: "_", with: " ")
                    }
                    tempWeatherArray.append(weather)
                    defaults.save(tempWeatherArray, forKey: Saved.weatherForSearchScreen.rawValue)
                    newTempArray[index] = weather
                    self.group.leave()
                case let .failure(error):
                    print(error)
                }
            }
        }
    }

    func getWeatherAndConfigureScreen(for cities: [String]) {
        getWeatherForFavourite(cities: cities)

        group.notify(queue: .main) {
            self.view.reloadWeatherTableData()
        }
    }

}

// MARK: - Get Cities List

extension SearchScreenPresenter {

    func getCityList() -> [String] {
        return defaults.load(forKey: Saved.citiesList.rawValue, type: [String].self)
    }

    func mapCitiesModel(_ model: [CityModel.City.Country]) -> [String] {
        var citiesArray = [String]()

        _ = model.compactMap { countryInfo in
            citiesArray += countryInfo.cities
        }

        return citiesArray
    }

}
