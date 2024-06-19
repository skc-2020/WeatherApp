//
//  MainScreen+Model.swift
//  WeatherApp
//
//  Created by SKC on 24.03.2021.
//

// MARK: - Mapper

extension MainScreen {

    typealias Model = Weather

    // MARK: - Map Current Model

    static func mapCurrentModel(_ model: Model) -> WeatherViewModel? {
        guard let currentDay = model.daily.first else { return nil }

        return WeatherViewModel(
            locationName: CityNameConverter.getCityName(from: model.timezone) ?? "",
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

    // MARK: - Map Hourly Model

    static func mapHourlyModel(_ model: [WeatherViewModel.CurrentForecastModel])
    -> [WeatherViewModel.CurrentForecastModel] {
        model.map {
            WeatherViewModel.CurrentForecastModel(
                dt: $0.dt,
                temp: $0.temp + Degree.sign.rawValue,
                weather: $0.weather
            )
        }
    }

}

// MARK: - Convert Temperature

private extension MainScreen {

    static func convertTemperature(_ temperature: Double) -> String {
        temperature.asRoundedString() + Degree.sign.rawValue
    }

}
