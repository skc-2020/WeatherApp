//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

struct Weather {

    struct DailyModel {

        static let mock = Self(locationName: "Kyiv",
                               cloudiness: "Mostly cloudy",
                               temperature: "-4",
                               maxTemperature: "3",
                               minTemperature: "-9",
                               humidity: "",
                               description: "")

        let locationName: String
        let cloudiness: String
        let temperature: String
        var maxTemperature: String
        var minTemperature: String
        let humidity: String?
        let description: String?

    }

}
