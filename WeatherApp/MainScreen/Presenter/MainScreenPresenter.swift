//
//  MainScreenPresenter.swift
//  WeatherApp
//
//  Created by AndUser on 14.03.2021.
//

final class MainScreenPresenter {

    // MARK: - Private variables

    private let dailyModel: Weather.DailyModel

    // MARK: - External dependencies

    weak var view: MainScreenInput?

    var interactor: MainModuleInteractor!

    // MARK: - Initializers

    init(with model: Weather.DailyModel) {
        self.dailyModel = model
        print("Main Presenter Initialized")
    }

    // MARK: - Configure Main Screen

    func showMainScreen(with model: Weather.DailyModel) {
        view?.configureMainScreen(with: (interactor.getDailyWeather()))
    }
}

// MARK: - Lifecycle Listener

extension MainScreenPresenter: LifecycleListener {
    func viewDidLoad() {
        showMainScreen(with: dailyModel)
    }
}
