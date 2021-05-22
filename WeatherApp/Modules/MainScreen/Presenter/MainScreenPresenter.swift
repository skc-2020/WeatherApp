//
//  MainScreenPresenter.swift
//  WeatherApp
//
//  Created by AndUser on 14.03.2021.
//

final class MainScreenPresenter {

    // MARK: - Private Variables

    private var state = State(
        weather: Weather(
            timezone: "",
            current: Current(dt: 0,
                             temp: 0,
                             humidity: 0,
                             clouds: 0,
                             weather: []),
            daily: [],
            hourly: []
        )
    )

    // MARK: - External dependencies

    private unowned let view: MainScreenInput

    private let interactor: MainModuleInteractor

    // MARK: - Initializers

    init(view: MainScreenInput, interactor: MainModuleInteractor) {
        self.view = view
        self.interactor = interactor
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
    func getDailyModel() -> [WeatherViewModel.DailyForecastModel] {
        var viewModel = [WeatherViewModel.DailyForecastModel]()

        _ = state.weather.daily.map {
            let dayViewModel = WeatherViewModel.DailyForecastModel(
                dt: $0.dt,
                weather: WeatherViewModel.WeatherElement(
                    icon: $0.weather[0].weatherConditions.rawValue
                ),
                temperature: WeatherViewModel.Temperature(
                    day: $0.temp.day.asRoundedString(),
                    min: $0.temp.min.asRoundedString(),
                    max: $0.temp.max.asRoundedString()
                ),
                humidity: String($0.humidity),
                clouds: $0.clouds
            )

            viewModel.append(dayViewModel)
        }

        return viewModel
    }

    // MARK: Get Hourly Model
    func getHourlyModel() -> [WeatherViewModel.CurrentForecastModel] {
        var viewModel = [WeatherViewModel.CurrentForecastModel]()

        _ = state.weather.hourly.map {
            let hourViewModel = WeatherViewModel.CurrentForecastModel(
                dt: DateConverter.getHour(from: $0.dt),
                temp: $0.temp.asRoundedString(),
                weather: WeatherViewModel.WeatherElement(
                    icon: $0.weather[0].weatherConditions.rawValue
                )
            )

            viewModel.append(hourViewModel)
        }
        viewModel[0].dt = "Now"

        return viewModel
    }

}
