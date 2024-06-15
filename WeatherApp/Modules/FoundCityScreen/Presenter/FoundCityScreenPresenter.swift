//
//  FoundCityScreenPresenter.swift
//  WeatherApp
//
//  Created by SKC on 04.07.2023.
//

import UIKit

final class FoundCityScreenPresenter {

    var router: FoundCityRouterInput?
    var city: String

    // MARK: - Private Variables

    private unowned let view: FoundCityScreenInput
    private let interactor: FoundCityScreenInteractorInput

    init(
        view: FoundCityScreenInput,
        interactor: FoundCityScreenInteractorInput,
        city: String
    ) {
        self.view = view
        self.interactor = interactor
        self.city = city
    }

}

// MARK: - Configure Main Screen

private extension FoundCityScreenPresenter {

    func getWeather(for city: String) {
        interactor.fetchWeather(for: city) { [weak self] data in
            switch data {
            case .failure(let error):
                print(error.rawValue)
                self?.view.showAlert(
                    title: "There's a problem connecting to the server to get weather for the city: \(city)",
                    message: "Please, try again in a while",
                    actions: [
                        UIAlertAction(
                            title: "Ok",
                            style: .default,
                            handler: { _ in exit(0) }
                        )
                    ]
                )
            case .success(var data):
                if data.timezone.contains("_") {
                    data.timezone = data.timezone.replacingOccurrences(of: "_", with: " ")
                }
                defaults.save(data, forKey: Saved.foundScreenWeather.rawValue)
                self?.view.configureScreen(with: data)
            }
        }
    }

}

// MARK: - Lifecycle Listener

extension FoundCityScreenPresenter: LifecycleListener {

    func viewDidAppear() {
        getWeather(for: city)
    }
 
}

// MARK: - FoundCityScreenOutput

extension FoundCityScreenPresenter: FoundCityScreenOutput {

    func goBackToPreviousScreen() {
        router?.goBackToPreviousScreen()
    }

    func getDailyModel() -> [WeatherViewModel.DailyForecastModel] {
        let decodedWeather = defaults.loadObject(forKey: Saved.foundScreenWeather.rawValue, type: Weather.self)
        return WeatherModelMappers().mapDailyWeatherModel(decodedWeather)
    }

    func getHourlyModel() -> [WeatherViewModel.CurrentForecastModel] {
        let decodedWeather = defaults.loadObject(forKey: Saved.foundScreenWeather.rawValue, type: Weather.self)
        return WeatherModelMappers().mapHourlyWeatherModel(decodedWeather)
    }

    func showMainScreenWithNewWeather() {
        defaults.set(city, forKey: Saved.cityForMainScreen.rawValue)
        saveCityToFavouritesList(city)
        router?.openMainScreen(for: city)
    }

}

extension FoundCityScreenPresenter {

    func saveCityToFavouritesList(_ cityName: String) {
        let savedCities = defaults.object(forKey: Saved.favouriteCitiesList.rawValue) as? [String]

        if var existingCities = savedCities {
            if !existingCities.contains(cityName) {
                existingCities.append(cityName)
                // if city doesn't exist
                defaults.set(existingCities, forKey: Saved.favouriteCitiesList.rawValue)
            }
        } else {
            // if there're no cities, then save new array
            var newCitiesList = [String]()
            newCitiesList.append(cityName)
            defaults.set(newCitiesList, forKey: Saved.favouriteCitiesList.rawValue)
        }
    }

}
