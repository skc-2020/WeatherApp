//
//  MainScreenPresenter.swift
//  WeatherApp
//
//  Created by AndUser on 14.03.2021.
//

final class MainScreenPresenter {

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
        view.configureMainScreen(with: (interactor.getDailyWeather()))
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
