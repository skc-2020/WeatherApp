//
//  DesignSystem.swift
//  WeatherApp
//
//  Created by SKC on 23.03.2021.
//

import UIKit

struct DesignSystem {}

// MARK: Images

extension DesignSystem {

    struct Images {
        static let sky = UIImage(named: "sky")
        static let noIcon = UIImage(named: "no_Icon")
        static let list = UIImage(named: "list")
        static let favouriteCity = UIImage(named: "FavouriteCity")
    }

}

// MARK: Colors

extension DesignSystem {

    struct Colors {
        static let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        static let black = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        static let lightBlack = UIColor(red: 0.02, green: 0.02, blue: 0.02, alpha: 1)
        static let gray = UIColor(red: 0.412, green: 0.443, blue: 0.478, alpha: 1)
        static let extraLightGray = UIColor(red: 0.737, green: 0.737, blue: 0.765, alpha: 1)
        static let lightGray = UIColor(red: 0.43, green: 0.43, blue: 0.445, alpha: 1)
        static let darkGray = UIColor(red: 0.25, green: 0.25, blue: 0.26, alpha: 1)
        static let extraDarkGray = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
    }

}

// MARK: Fonts

extension DesignSystem {

    struct Fonts {

        struct Sizes {
            static let small: CGFloat = 8
            static let medium0: CGFloat = 16
            static let medium1: CGFloat = 18
            static let medium2: CGFloat = 19
            static let medium3: CGFloat = 20
            static let medium4: CGFloat = 21
            static let medium5: CGFloat = 22
            static let large: CGFloat = 30
            static let extraLarge: CGFloat = 50
            static let giant: CGFloat = 90
        }

        static let small = UIFont.systemFont(ofSize: Sizes.small)
        static let medium0 = UIFont.systemFont(ofSize: Sizes.medium0)
        static let medium1 = UIFont.systemFont(ofSize: Sizes.medium1)
        static let medium2 = UIFont.systemFont(ofSize: Sizes.medium2)
        static let medium3 = UIFont.systemFont(ofSize: Sizes.medium3)
        static let medium4 = UIFont.systemFont(ofSize: Sizes.medium4)
        static let medium5Bold = UIFont.systemFont(ofSize: Sizes.medium5, weight: .bold)
        static let large = UIFont.systemFont(ofSize: Sizes.large)
        static let largeBold = UIFont.systemFont(ofSize: Sizes.large, weight: .bold)
        static let extraLarge = UIFont.systemFont(ofSize: Sizes.extraLarge)
        static let giantThin = UIFont.systemFont(ofSize: Sizes.giant, weight: .thin)
    }

}

// MARK: - Weather stub

extension DesignSystem {

    static let weatherStub = Weather(
        timezone: "Europe/Kyiv",
        timezoneOffset: 7200,
        current: Current(
            dt: 1696676623,
            temp: 12,
            humidity: 75,
            clouds: 23,
            weather:
                [
                    WeatherElement(
                        weatherConditions: WeatherConditions(rawValue: "Clouds")!,
                        weatherDescription: "overcast clouds",
                        icon: "04d"
                    )
                ]
        ),
        daily: [Daily(
            dt: 1696676623,
            temp: Temp(day: 13, min: 11, max: 17),
            humidity: 44,
            weather: [WeatherElement(
                weatherConditions: WeatherConditions(rawValue: "Clouds")!,
                weatherDescription: "overcast clouds",
                icon: "04d"
            )],
            clouds: 55
        )
        ],
        hourly: []
    )
    
    static let weatherArrayStub = [
        Weather(
            timezone: "Europe/Kyiv",
            timezoneOffset: 7200,
            current: Current(
                dt: 1696676623,
                temp: 12,
                humidity: 75,
                clouds: 23,
                weather:[WeatherElement(
                    weatherConditions: WeatherConditions(rawValue: "Clouds")!,
                    weatherDescription: "overcast clouds",
                    icon: "04d")]
            ),
            daily: [Daily(
                dt: 1696676623,
                temp: Temp(day: 13, min: 11, max: 17),
                humidity: 44,
                weather: [WeatherElement(
                    weatherConditions: WeatherConditions(rawValue: "Clouds")!,
                    weatherDescription: "overcast clouds",
                    icon: "04d")],
                clouds: 55
            )],
            hourly: []
        ),
        Weather(
            timezone: "Europe/Cairo",
            timezoneOffset: 7200,
            current: Current(
                dt: 1696676623,
                temp: 22,
                humidity: 75,
                clouds: 23,
                weather:[WeatherElement(
                    weatherConditions: WeatherConditions(rawValue: "Clouds")!,
                    weatherDescription: "overcast clouds",
                    icon: "04d")]
            ),
            daily: [Daily(
                dt: 1696676623,
                temp: Temp(day: 13, min: 11, max: 27),
                humidity: 44,
                weather: [WeatherElement(
                    weatherConditions: WeatherConditions(rawValue: "Clouds")!,
                    weatherDescription: "overcast clouds",
                    icon: "04d")],
                clouds: 55
            )],
            hourly: []
        )
    ]
}
