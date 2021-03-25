//
//  ViewController.swift
//  WeatherApp
//
//  Created by AndUser on 11.03.2021.
//

import UIKit

final class MainScreen: BaseViewController {

    // MARK: - External Dependencies

    var output: MainScreenOutput?

    // MARK: - Private Variables

    private let dailyView = DailyView()

    private let backgroundImage = UIImageView(image: DesignSystem.Images.sky)

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

}

// MARK: - Setup View

private extension MainScreen {

    func setupView() {
        view.addSubviews(backgroundImage, dailyView)
        dailyView.pinToSuperview()
    }

}

// MARK: - MainScreen Input

extension MainScreen: MainScreenInput {

    func configureMainScreen(with model: Weather.DailyModel) {
        let mappedModel = MainScreen.map(model: model)
        dailyView.configure(with: mappedModel)
    }

}
