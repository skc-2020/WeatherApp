//
//  SearchScreenOutput.swift
//  WeatherApp
//
//  Created by SKC on 06.12.2021.
//

protocol SearchScreenOutput {

    func showScreenWithFound(_ city: String)
    func getCityList() -> [String]
    func showMainScreen(for city: String)

}
