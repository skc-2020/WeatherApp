//
//  Date Converter.swift
//  WeatherApp
//
//  Created by AndUser on 07.04.2021.
//

import Foundation

// MARK: - Get Day From TimeInterval

func getDayOfWeek(from timeInterval: Int) -> String {

    let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"

    return dateFormatter.string(from: date).capitalized
}

// MARK: - Get Hour From TimeInterval

func getHour(from timeInterval: Int) -> String {

    let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))

    return String(Calendar.current.component(.hour, from: date))
}
