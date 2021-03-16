//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

struct Weather {

    static let mockedDailyWeather: DailyModel = .init(locationName: "Kyiv",
                                                      cloudiness: "Mostly cloudy",
                                                      temperature: "-4",
                                                      maxTemperature: "3",
                                                      minTemperature: "-9",
                                                      humidity: "",
                                                      description: "")

    struct DailyModel {

        let locationName: String
        let cloudiness: String
        let temperature: String
        let maxTemperature: String
        let minTemperature: String
        let humidity: String?
        let description: String?

    }

}
