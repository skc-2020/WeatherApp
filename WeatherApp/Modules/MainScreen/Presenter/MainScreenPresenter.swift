//
//  MainScreenPresenter.swift
//  WeatherApp
//
//  Created by AndUser on 14.03.2021.
//

final class MainScreenPresenter {

    // MARK: - Private Variables

    private var state: State

    // MARK: - External dependencies

    private unowned let view: MainScreenInput

    private let interactor: MainModuleInteractor

    // MARK: - Initializers

    init(view: MainScreenInput, interactor: MainModuleInteractor) {
        self.view = view
        self.interactor = interactor
        state = State(weather: Weather())
    }

    // MARK: - Configure Main Screen

    func showMainScreen() {
        interactor.getCurrentWeather { [weak self] data in
            guard let self = self else { return }

            self.state.weather = data
            self.view.configureMainScreen(with: data)
        }
    }

}

// MARK: - Lifecycle Listener

extension MainScreenPresenter: LifecycleListener {

    func viewDidLoad() {
        showMainScreen()
    }

}

// MARK: - MainScreenOutput

extension MainScreenPresenter: MainScreenOutput {}

// MARK: - State

private extension MainScreenPresenter {

    struct State {
        var weather: Weather
    }

}

// MARK: - Get Weather Model

extension MainScreenPresenter {

    // MARK: Get Daily Model
    func getDailyModel() -> [ViewModel.DailyForecastModel] {
        var viewModel = [ViewModel.DailyForecastModel]()
        var dayViewModel: ViewModel.DailyForecastModel

        for day in state.weather.daily ?? [] {
            dayViewModel = ViewModel.DailyForecastModel(
                dt: day.dt,
                weather: ViewModel.WeatherElement(
                    icon: day.weather?[0].main?.rawValue
                ),
                temperature: ViewModel.Temperature(
                    day: String(day.temp.day).components(separatedBy: ".")[0],
                    min: String(day.temp.min).components(separatedBy: ".")[0],
                    max: String(day.temp.max).components(separatedBy: ".")[0]
                ),
                humidity: String(day.humidity ?? 0),
                clouds: day.clouds
            )

            viewModel.append(dayViewModel)
        }

        return viewModel
    }

    // MARK: Get Hourly Model
    func getHourlyModel() -> [ViewModel.CurrentForecastModel] {
        var viewModel = [ViewModel.CurrentForecastModel]()
        var hourViewModel: ViewModel.CurrentForecastModel

        for hour in state.weather.hourly ?? [] {
            hourViewModel = ViewModel.CurrentForecastModel(
                dt: getHour(from: hour.dt),
                temp: String(hour.temp).components(separatedBy: ".")[0],
                weather: ViewModel.WeatherElement(
                    icon: hour.weather[0].main?.rawValue ?? ""
                )
            )

            viewModel.append(hourViewModel)
        }
        viewModel[0].dt = "Now"

        return viewModel
    }

}
