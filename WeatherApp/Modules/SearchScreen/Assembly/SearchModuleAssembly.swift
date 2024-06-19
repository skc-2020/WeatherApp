//
//  SearchModuleAssembly.swift
//  WeatherApp
//
//  Created by SKC on 09.07.2021.
//

import UIKit

final class SearchModuleAssembly {

    static func buildModule(weatherService: WeatherService) -> SearchScreen {
        let view = SearchScreen()
        let interactor = SearchScreenInteractor(citiesService: CitiesListService(), weatherService: weatherService)
        let presenter = SearchScreenPresenter(view: view, interactor: interactor)
        let router: SearchRouterInput = SearchRouter(view: view)

        view.lifecycleListener = presenter
        view.output = presenter
        presenter.router = router

        return view
    }

}
