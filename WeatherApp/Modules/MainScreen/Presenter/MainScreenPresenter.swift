//
//  MainScreenPresenter.swift
//  WeatherApp
//
//  Created by AndUser on 14.03.2021.
//

import UIKit
import CoreLocation

final class MainScreenPresenter {

    // MARK: - Private Variables

    private var state = State.initial

    private unowned let view: MainScreenInput

    private let interactor: MainModuleInteractorInput

    // MARK: - External dependencies

    var router: MainRouter?

    // MARK: - Initializers

    init(view: MainScreenInput, interactor: MainModuleInteractor) {
        self.view = view
        self.interactor = interactor
    }

}

// MARK: - Configure Main Screen

extension MainScreenPresenter {

    func getCurrentWeather() {
        interactor.getInitialCurrentWeather { [weak self] data in
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
                self?.state.weather = data
                self?.view.configureMainScreen(with: data)
            }
        }
    }

}

// MARK: - Lifecycle Listener

extension MainScreenPresenter: LifecycleListener {

    func viewDidLoad() {

        // MARK: Get Current Location
        getCurrentWeather()
    }

}

// MARK: - MainScreenOutput

extension MainScreenPresenter: MainScreenOutput {

    // MARK: Get Daily Model
    func getDailyModel() -> [WeatherViewModel.DailyForecastModel] {
        state.weather.daily.map {
            WeatherViewModel.DailyForecastModel(
                dt: $0.dt,
                weather: WeatherViewModel.WeatherElement(
                    icon: $0.weather[safe: 0]?.weatherConditions.rawValue
                ),
                temperature: WeatherViewModel.Temperature(
                    day: $0.temp.day.asRoundedString(),
                    min: $0.temp.min.asRoundedString(),
                    max: $0.temp.max.asRoundedString()
                ),
                humidity: String($0.humidity),
                clouds: $0.clouds
            )
        }
    }

    // MARK: Get Hourly Model
    func getHourlyModel() -> [WeatherViewModel.CurrentForecastModel] {
        var viewModel = [WeatherViewModel.CurrentForecastModel]()

        _ = state.weather.hourly.map {
            let hourViewModel = WeatherViewModel.CurrentForecastModel(
                dt: DateConverter.getHour(from: $0.dt),
                temp: $0.temp.asRoundedString(),
                weather: WeatherViewModel.WeatherElement(
                    icon: $0.weather[safe: 0]?.weatherConditions.rawValue
                )
            )

            viewModel.append(hourViewModel)
        }

        if viewModel[safe: 0] != nil {
            viewModel[0].dt = "Now"
        }

        return viewModel
    }

}

// MARK: - State

private extension MainScreenPresenter {

    struct State {
        static let initial = Self(
            weather: Weather(
                timezone: "",
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
            coordinates: CLLocationCoordinate2D()
        )

        var weather: Weather
        var coordinates: CLLocationCoordinate2D
    }

}

// MARK: - didTapSearchButton

extension MainScreenPresenter {

    func didTapSearchButton() {
        router?.displaySearchScreen()
    }

}
