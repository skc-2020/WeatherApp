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

        static let mock = [
            Self(hour: "Now", icon: "sunny", temperature: "11"),
            Self(hour: "16", icon: "sunny", temperature: "11"),
            Self(hour: "17", icon: "cloudy", temperature: "12"),
            Self(hour: "18", icon: "cloudy", temperature: "12"),
            Self(hour: "19", icon: "cloudy", temperature: "13"),
            Self(hour: "20", icon: "sunny", temperature: "13")
        ]

        let hour: String
        let icon: String
        let temperature: String

    }

    struct WeeklyModel {

        static let mock = [
            Self(dayOfWeek: "Monday",
                 icon: "cloudy",
                 maxTemperature: "5",
                 minTemperature: "-9",
                 humidity: "65%"),
            Self(dayOfWeek: "Tuesday",
                 icon: "sunny",
                 maxTemperature: "7",
                 minTemperature: "-8",
                 humidity: "50%"),
            Self(dayOfWeek: "Wednesday",
                 icon: "rainy",
                 maxTemperature: "5",
                 minTemperature: "-9",
                 humidity: "65%"),
            Self(dayOfWeek: "Thursday",
                 icon: "cloudy",
                 maxTemperature: "5",
                 minTemperature: "-9",
                 humidity: "65%"),
            Self(dayOfWeek: "Friday",
                 icon: "sunny",
                 maxTemperature: "7",
                 minTemperature: "-8",
                 humidity: "50%"),
            Self(dayOfWeek: "Saturday",
                 icon: "rainy",
                 maxTemperature: "5",
                 minTemperature: "-9",
                 humidity: "65%"),
            Self(dayOfWeek: "Sunday",
                 icon: "sunny",
                 maxTemperature: "5",
                 minTemperature: "-9",
                 humidity: "33%"),
            Self(dayOfWeek: "Monday",
                 icon: "cloudy",
                 maxTemperature: "5",
                 minTemperature: "-9",
                 humidity: "65%"),
            Self(dayOfWeek: "Tuesday",
                 icon: "cloudy",
                 maxTemperature: "7",
                 minTemperature: "-8",
                 humidity: "50%")
        ]

        let dayOfWeek: String
        let icon: String
        let maxTemperature: String
        let minTemperature: String
        let humidity: String

    }

}
