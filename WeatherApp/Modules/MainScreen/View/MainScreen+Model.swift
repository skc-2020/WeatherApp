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
              temperature: model.temperature + Degree.sign.rawValue,
              maxTemperature: "H: " + model.maxTemperature + Degree.sign.rawValue,
              minTemperature: "L: " + model.minTemperature + Degree.sign.rawValue,
              humidity: model.humidity,
              description: model.description)
    }

}

private extension MainScreen {

    enum Degree: String {
        case sign = "°"
    }

}
