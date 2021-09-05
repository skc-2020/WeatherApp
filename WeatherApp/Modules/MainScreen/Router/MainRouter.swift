//
//  MainRouter.swift
//  WeatherApp
//
//  Created by AndUser on 10.07.2021.
//

import UIKit

final class MainRouter {

    // MARK: - Private variables

    private weak var view: UIViewController?

    // MARK: - Initializers

    init(view: UIViewController) {
        self.view = view
    }

    func displaySearchScreen() {
        let searchScreen = SearchModuleAssembly.buildModule()
//        searchScreen.modalPresentationStyle = .fullScreen
        view?.present(searchScreen, animated: true, completion: nil)
    }

}
