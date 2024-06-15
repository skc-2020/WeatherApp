//
//  Double+Extension.swift
//  WeatherApp
//
//  Created by SKC on 20.05.2021.
//

extension Double {

    func asRoundedString() -> String {
        String(self).components(separatedBy: ".")[safe: 0] ?? ""
    }

}
