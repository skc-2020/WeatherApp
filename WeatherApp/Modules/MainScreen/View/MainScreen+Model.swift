//
//  MainScreen+Model.swift
//  WeatherApp
//
//  Created by AndUser on 24.03.2021.
//

// MARK: - Mapper

extension MainScreen {

    typealias Model = Weather

    // MARK: - Map Current Model

    static func mapCurrentModel(_ model: Model) -> ViewModel {
        guard let currentDay = model.daily?.first else { return ViewModel() }

        return ViewModel(
            locationName: model.timezone?.components(separatedBy: "/")[1] ?? "",
            daily: [
                ViewModel.DailyForecastModel(
                    dt: currentDay.dt ?? 0,
                    temperature: ViewModel.Temperature(
                        day: convertTemperature(currentDay.temp.day),
                        min: "L: " + convertTemperature(currentDay.temp.min),
                        max: "H: " + convertTemperature(currentDay.temp.max)
                    ),
                    humidity: String(currentDay.humidity ?? 0),
                    clouds: currentDay.clouds
                )
            ]
        )
    }

    // MARK: - Map Hourly Model

    static func mapHourlyModel(_ model: [ViewModel.CurrentForecastModel]) -> [ViewModel.CurrentForecastModel] {
        var mappedModel = [ViewModel.CurrentForecastModel]()

        for item in model {
            mappedModel.append(
                ViewModel.CurrentForecastModel(
                    dt: item.dt,
                    temp: item.temp + Degree.sign.rawValue,
                    weather: item.weather
                )
            )
        }

        return mappedModel
    }

}

// MARK: - Convert Temperature

private extension MainScreen {

    static func convertTemperature(_ temp: Double) -> String {
        String(temp).components(separatedBy: ".")[0] + Degree.sign.rawValue
    }

}
