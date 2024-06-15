//
//  WeatherModelMappers.swift
//  WeatherApp
//
//  Created by SKC on 20.01.2024.
//

final class WeatherModelMappers {

    func mapDailyWeatherModel(_ model: Weather) -> [WeatherViewModel.DailyForecastModel] {
        model.daily.map {
            WeatherViewModel.DailyForecastModel(
                dt: $0.dt,
                weather: WeatherViewModel.WeatherElement(
                    icon: $0.weather[safe: 0]?.weatherConditions.rawValue
                ),
                temperature: WeatherViewModel.Temperature(
                    day: $0.temp.day.asRoundedString(),
                    min: $0.temp.min.asRoundedString(),
                    max: $0.temp.max.asRoundedString()
                ),
                humidity: String($0.humidity),
                clouds: $0.clouds
            )
        }
    }

    func mapHourlyWeatherModel(_ model: Weather) -> [WeatherViewModel.CurrentForecastModel] {
        var viewModel = [WeatherViewModel.CurrentForecastModel]()

        _ = model.hourly.map {
            let hourViewModel = WeatherViewModel.CurrentForecastModel(
                dt: DateConverter.getHour(from: $0.dt),
                temp: $0.temp.asRoundedString(),
                weather: WeatherViewModel.WeatherElement(
                    icon: $0.weather[safe: 0]?.weatherConditions.rawValue
                )
            )
            
            viewModel.append(hourViewModel)
        }

        if viewModel[safe: 0] != nil {
            viewModel[0].dt = "Now"
        }

        return viewModel
    }

}
