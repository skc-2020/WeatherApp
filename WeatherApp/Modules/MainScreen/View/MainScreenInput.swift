//
//  MainScreenInput.swift
//  WeatherApp
//
//  Created by SKC on 15.03.2021.
//

import UIKit

/// Describes the contract with the view.
protocol MainScreenInput: UIViewController, AlertViewTrait {

    func configureMainScreen(with dailyModel: Weather)

}
