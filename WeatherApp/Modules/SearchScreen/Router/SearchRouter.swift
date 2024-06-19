//
//  SearchScreenRouter.swift
//  WeatherApp
//
//  Created by SKC on 05.12.2021.
//

import UIKit

protocol SearchRouterInput {
    func openMainScreen()
    func openFoundCityScreen(for city: String)
    func openMainScreen(for city: String)
}

final class SearchRouter: SearchRouterInput {

    // MARK: - Private variables

    private weak var view: UIViewController?

    // MARK: - Initialisers

    init(view: UIViewController) {
        self.view = view
    }

    // MARK: - Display Screen

    func openMainScreen() {
        view?.dismiss(animated: true, completion: nil)
    }

    func openFoundCityScreen(for city: String) {
        let foundCityScreen = FoundCityModuleAssembly.buildModule(with: city)
        view?.present(foundCityScreen, animated: true)
    }

    func openMainScreen(for city: String) {
        view?.navigationController?.popViewController(animated: true)
    }

}
