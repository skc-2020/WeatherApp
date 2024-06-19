//
//  FoundCityModuleAssembly.swift
//  WeatherApp
//
//  Created by SKC on 26.04.2022.
//

import UIKit

final class FoundCityModuleAssembly {

    static func buildModule(with city: String) -> BaseViewController {
        let view = FoundCityScreen()
        let interactor = FoundCityScreenInteractor(weatherService: WeatherService(location: Location()))//service: CitiesListService())
        let presenter = FoundCityScreenPresenter(view: view, interactor: interactor, city: city)
        let router: FoundCityRouterInput = FoundCityRouter(view: view)

        view.lifecycleListener = presenter
        view.output = presenter
        presenter.router = router

        return view
    }

}
