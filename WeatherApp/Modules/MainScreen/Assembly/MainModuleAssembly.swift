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
        let router = MainRouter(view: view)
        let presenter = MainScreenPresenter(view: view, interactor: interactor)

        view.lifecycleListener = presenter
        view.output = presenter
        presenter.router = router

        return view
    }

}
