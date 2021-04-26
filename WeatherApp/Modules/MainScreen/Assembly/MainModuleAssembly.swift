//
//  MainModuleAssembly.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

final class MainModuleAssembly {

    static func buildModule() -> BaseViewController {
        let view = MainScreen()
        let interactor = MainModuleInteractor()
        let presenter = MainScreenPresenter(view: view, interactor: interactor)

        view.lifecycleListener = presenter
        view.output = presenter
        view.presenter = presenter

        return view
    }

}
