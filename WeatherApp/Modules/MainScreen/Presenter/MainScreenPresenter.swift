//
//  MainScreenPresenter.swift
//  WeatherApp
//
//  Created by SKC on 14.03.2021.
//

import UIKit
import CoreLocation

final class MainScreenPresenter {

    // MARK: - Private Variables

    private let city: String?
    private unowned let view: MainScreenInput
    private let interactor: MainScreenInteractorInput

    // MARK: - External dependencies

    var router: MainRouterInput?

    // MARK: - Initializers

    init(view: MainScreenInput, interactor: MainScreenInteractor, city: String? = nil) {
        self.view = view
        self.interactor = interactor
        self.city = city
    }

}

// MARK: - Configure Main Screen

private extension MainScreenPresenter {

    func getInitialWeather() {
        interactor.fetchInitialWeather { [weak self] data in
            switch data {
            case .failure(let error):
                print(error.rawValue)
                self?.view.showAlert(
                    title: "There's a problem connecting to the server",
                    message: "Please, try again in a while",
                    actions: [
                        UIAlertAction(
                            title: "Ok",
                            style: .default,
                            handler: { _ in exit(0) }
                        )
                    ]
                )
            case .success(let data):
                defaults.save(data, forKey: Saved.weather.rawValue)
                defaults.save([data], forKey: Saved.weatherForSearchScreen.rawValue)

                self?.view.configureMainScreen(with: data)
            }
        }
    }

    func getSavedWeather(for city: String) {
        interactor.fetchWeather(for: city) { [weak self] data in
            switch data {
            case .failure(let error):
                print(error.rawValue)
                self?.view.showAlert(
                    title: "There's a problem connecting to the server",
                    message: "Please, try again in a while",
                    actions: [
                        UIAlertAction(
                            title: "Ok",
                            style: .default,
                            handler: { _ in exit(0) }
                        )
                    ]
                )
            case .success(let data):
                defaults.save(data, forKey: Saved.weather.rawValue)
                self?.view.configureMainScreen(with: data)
            }
        }
    }

}

// MARK: - Lifecycle Listener

extension MainScreenPresenter: LifecycleListener {

    func viewDidAppear() {
        // MARK: Get Current Location

        if let сityForMainScreen = defaults.value(forKey: Saved.cityForMainScreen.rawValue) as? String {
            getSavedWeather(for: сityForMainScreen)
        } else {
            defaults.set(["Kiev"], forKey: Saved.favouriteCitiesList.rawValue)
            getInitialWeather()
        }
    }

}

// MARK: - MainScreenOutput

extension MainScreenPresenter: MainScreenOutput {

    // MARK: Get Daily Model
    func getDailyModel() -> [WeatherViewModel.DailyForecastModel] {
        let decodedWeather = defaults.loadObject(forKey: Saved.weather.rawValue, type: Weather.self)
        return WeatherModelMappers().mapDailyWeatherModel(decodedWeather)
    }

    // MARK: Get Hourly Model
    func getHourlyModel() -> [WeatherViewModel.CurrentForecastModel] {
        let decodedWeather = defaults.loadObject(forKey: Saved.weather.rawValue, type: Weather.self)
        return WeatherModelMappers().mapHourlyWeatherModel(decodedWeather)
    }

}

// MARK: - didTapSearchButton

extension MainScreenPresenter {

    func didTapSearchButton() {
        router?.displaySearchScreen()
    }

}
