//
//  Date Converter.swift
//  WeatherApp
//
//  Created by SKC on 07.04.2021.
//

import Foundation

struct DateConverter {

    // MARK: - Get Day From TimeInterval

     static func getDayOfWeek(from timeInterval: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"

        return dateFormatter.string(from: date).capitalized
    }

    // MARK: - Get Hour From TimeInterval

    static func getHour(from timeInterval: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))

        return String(Calendar.current.component(.hour, from: date))
    }

    static func getTime(from timeInterval: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.string(from: date)

        return dateString
    }

}

// MARK: - City Name Converter

struct CityNameConverter {

    static func getCityName(from model: String) -> String? {
        guard var cityName = model.components(separatedBy: "/")[safe: 1] else {
            print("City name couldn't be get")
            return nil
        }
        if cityName.contains("_") {
            cityName = cityName.replacingOccurrences(of: "_", with: " ")
        }
        return cityName
    }

}
