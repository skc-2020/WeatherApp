//
//  MainRouter.swift
//  WeatherApp
//
//  Created by SKC on 10.07.2021.
//

import UIKit

protocol MainRouterInput {
    func displaySearchScreen()
}

final class MainRouter: MainRouterInput {

    // MARK: - Private variables

    private weak var view: UIViewController?
    private let weatherService: WeatherService
    // MARK: - Initializers

    init(view: UIViewController, weatherService: WeatherService) {
        self.view = view
        self.weatherService = weatherService
    }

    func displaySearchScreen() {
        let searchScreen: SearchScreenInput = SearchModuleAssembly.buildModule(weatherService: weatherService)
        navController.pushViewController(searchScreen, animated: true)
    }

}
