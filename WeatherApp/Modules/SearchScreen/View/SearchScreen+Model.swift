//
//  SearchScreen+Model.swift
//  WeatherApp
//
//  Created by SKC on 07.10.2023.
//

// MARK: - Mapper

extension SearchScreen {

    typealias Model = Weather

    // MARK: - Map Current Model

    static func mapCurrentModel(_ model: Model) -> WeatherViewModel? {
        guard let currentDay = model.daily.first else {
            // TODO: add logging

            return nil
        }

        return WeatherViewModel(
            locationName: CityNameConverter.getCityName(from: model.timezone) ?? "",
            current: Current(
                dt: model.current.dt + model.timezoneOffset,
                temp: model.current.temp,
                humidity: model.current.humidity,
                clouds: model.current.clouds,
                weather: []
            ),
            daily: [
                WeatherViewModel.DailyForecastModel(
                    dt: currentDay.dt,
                    weather: WeatherViewModel.WeatherElement(),
                    temperature: WeatherViewModel.Temperature(
                        day: convertTemperature(currentDay.temp.day),
                        min: "L: " + convertTemperature(currentDay.temp.min),
                        max: "H: " + convertTemperature(currentDay.temp.max)
                    ),
                    humidity: String(currentDay.humidity),
                    clouds: currentDay.clouds
                )
            ]
        )
    }

}

// MARK: - Convert Temperature

private extension SearchScreen {

    static func convertTemperature(_ temperature: Double) -> String {
        temperature.asRoundedString() + Degree.sign.rawValue
    }

}
