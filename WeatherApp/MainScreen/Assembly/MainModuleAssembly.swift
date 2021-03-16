//
//  MainModuleAssembly.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

import UIKit

final class MainModuleAssembly {

    static func buildModule(with model: Weather.DailyModel) -> UIViewController {
        let view = MainScreen()
        let interactor = MainModuleInteractor()
        let presenter = MainScreenPresenter(with: model)

        presenter.view = view
        presenter.interactor = interactor
        view.lifecycleListener = presenter

        return view
    }
}
