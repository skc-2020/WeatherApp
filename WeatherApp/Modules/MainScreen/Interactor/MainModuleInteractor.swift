//
//  MainModuleInteractor.swift
//  WeatherApp
//
//  Created by AndUser on 15.03.2021.
//

protocol MainModuleInteractorProtocol {
    func getDailyWeather() -> Weather.DailyModel
}

struct MainModuleInteractor: MainModuleInteractorProtocol {
    func getDailyWeather() -> Weather.DailyModel {
        Weather.mockedDailyWeather
    }

}
