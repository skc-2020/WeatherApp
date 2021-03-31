//
//  ViewConfiguration.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

protocol ViewConfiguration {

    associatedtype Model
    func configure(with model: Model)

}
