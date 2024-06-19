//
//  FoundCityScreenOutput.swift
//  WeatherApp
//
//  Created by SKC on 04.07.2023.
//

protocol FoundCityScreenOutput {

    func getDailyModel() -> [WeatherViewModel.DailyForecastModel]
    func getHourlyModel() -> [WeatherViewModel.CurrentForecastModel]
    func goBackToPreviousScreen()
    func showMainScreenWithNewWeather()

}
