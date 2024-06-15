//
//  MainModuleAssembly.swift
//  WeatherApp
//
//  Created by SKC on 13.03.2021.
//

import CoreLocation

final class MainModuleAssembly {

    static func buildModule(with city: String? = nil) -> BaseViewController {
        let weatherService = WeatherService(location: Location())
        let view = MainScreen()
        let interactor = MainScreenInteractor(weatherService: weatherService)
        let presenter = MainScreenPresenter(view: view, interactor: interactor, city: city)
        let router: MainRouterInput = MainRouter(view: view, weatherService: weatherService)

        view.lifecycleListener = presenter
        view.output = presenter
        presenter.router = router

        return view
    }

}
