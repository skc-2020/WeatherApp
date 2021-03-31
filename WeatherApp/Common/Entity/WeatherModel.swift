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
        let maxTemperature: String
        let minTemperature: String
        let humidity: String?
        let description: String?

    }

    struct HourlyModel {

        let hour: String
        let icon: String
        let temperature: String

    }

    struct WeeklyModel {

        let dayOfWeek: String
        let icon: String
        let maxTemperature: String
        let minTemperature: String
        let humidity: String

    }

    static let mockedDailyWeather: DailyModel = .init(
        locationName: "Kyiv",
        cloudiness: "Mostly cloudy",
        temperature: "-4",
        maxTemperature: "3",
        minTemperature: "-9",
        humidity: "",
        description: ""
    )

    static let mockedHourlyWeather: [HourlyModel] = [
        .init(hour: "Now", icon: "sunny", temperature: "11"),
        .init(hour: "16", icon: "sunny", temperature: "11"),
        .init(hour: "17", icon: "cloudy", temperature: "12"),
        .init(hour: "18", icon: "cloudy", temperature: "12"),
        .init(hour: "19", icon: "cloudy", temperature: "13"),
        .init(hour: "20", icon: "sunny", temperature: "13")
    ]

    static let mockedWeeklyWeather: [WeeklyModel] = [
        .init(dayOfWeek: "Monday",
              icon: "cloudy",
              maxTemperature: "5",
              minTemperature: "-9",
              humidity: "65%"),
        .init(dayOfWeek: "Tuesday",
              icon: "sunny",
              maxTemperature: "7",
              minTemperature: "-8",
              humidity: "50%"),
        .init(dayOfWeek: "Wednesday",
              icon: "rainy",
              maxTemperature: "5",
              minTemperature: "-9",
              humidity: "65%"),
        .init(dayOfWeek: "Thursday",
              icon: "cloudy",
              maxTemperature: "5",
              minTemperature: "-9",
              humidity: "65%"),
        .init(dayOfWeek: "Friday",
              icon: "sunny",
              maxTemperature: "7",
              minTemperature: "-8",
              humidity: "50%"),
        .init(dayOfWeek: "Saturday",
              icon: "rainy",
              maxTemperature: "5",
              minTemperature: "-9",
              humidity: "65%"),
        .init(dayOfWeek: "Sunday",
              icon: "sunny",
              maxTemperature: "5",
              minTemperature: "-9",
              humidity: "33%"),
        .init(dayOfWeek: "Monday",
              icon: "cloudy",
              maxTemperature: "5",
              minTemperature: "-9",
              humidity: "65%"),
        .init(dayOfWeek: "Tuesday",
              icon: "cloudy",
              maxTemperature: "7",
              minTemperature: "-8",
              humidity: "50%")
    ]

}
