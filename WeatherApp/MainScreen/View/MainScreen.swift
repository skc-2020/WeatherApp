//
//  ViewController.swift
//  WeatherApp
//
//  Created by AndUser on 11.03.2021.
//

import UIKit
import SnapKit

final class MainScreen: BaseViewController {

    // MARK: - Private Variables

    private let dailyView = DailyView()

    private let backgroundImage: UIImageView = {
        let image = UIImage(named: "sky")
        let imageView = UIImageView(image: image)

        return imageView
    }()

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupWeatherWidgetView()
    }
}

// MARK: - Setup View

extension MainScreen {

    func setupView() {
        view.addSubviews(backgroundImage, dailyView)
    }
}

// MARK: - Setup Constraints

extension MainScreen {
    func setupWeatherWidgetView() {
        dailyView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }
}

// MARK: - MainScreen Input

extension MainScreen: MainScreenInput {
    func configureMainScreen(with model: Weather.DailyModel) {
        dailyView.configure(
            with:DailyView.Model(
                locationName: model.locationName,
                cloudiness: model.cloudiness,
                temperature: model.temperature,
                maxTemperature: model.maxTemperature,
                minTemperature: model.minTemperature,
                humidity: nil,
                description: nil
            )
        )
    }
}
