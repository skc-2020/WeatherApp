//
//  FoundCityRouter.swift
//  WeatherApp
//
//  Created by SKC on 04.07.2023.
//

import UIKit

protocol FoundCityRouterInput {
    func goBackToPreviousScreen()
    func openMainScreen(for city: String)
}

final class FoundCityRouter: FoundCityRouterInput {

    // MARK: - Private variables

    private weak var view: UIViewController?

    // MARK: - Initialisers

    init(view: UIViewController) {
        self.view = view
    }

    // MARK: - Display Screen

    func goBackToPreviousScreen() {
        view?.dismiss(animated: true, completion: nil)
    }

    func openMainScreen(for city: String) {
        view?.dismiss(animated: true)
        navController.popToRootViewController(animated: true)
    }

}
