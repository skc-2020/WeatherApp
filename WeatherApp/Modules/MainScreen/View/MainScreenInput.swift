//
//  MainScreenInput.swift
//  WeatherApp
//
//  Created by AndUser on 15.03.2021.
//

/// Describes the contract with the view.
protocol MainScreenInput: AnyObject {

    func configureMainScreen(with dailyModel: Weather.DailyModel)

}
