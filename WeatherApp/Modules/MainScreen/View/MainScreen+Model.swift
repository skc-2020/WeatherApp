//
//  MainScreen+Model.swift
//  WeatherApp
//
//  Created by AndUser on 24.03.2021.
//

// MARK: - Mapper

extension MainScreen {

    typealias Model = Weather.DailyModel

    static func map(model: Model) -> Model {
        Model(locationName: model.locationName,
              cloudiness: model.cloudiness,
              temperature: model.temperature,
              maxTemperature: "H: " + model.maxTemperature + "°",
              minTemperature: "L: " + model.minTemperature + "°",
              humidity: model.humidity,
              description: model.description)
    }

}
