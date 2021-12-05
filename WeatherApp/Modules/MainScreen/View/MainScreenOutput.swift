//
//  MainScreenOutput.swift
//  WeatherApp
//
//  Created by AndUser on 23.03.2021.
//

protocol MainScreenOutput {

    func getDailyModel() -> [WeatherViewModel.DailyForecastModel]
    func getHourlyModel() -> [WeatherViewModel.CurrentForecastModel]
    func didTapSearchButton()
//    func getCurrentLocation()

}
