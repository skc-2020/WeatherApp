//
//  UIView+Extensions.swift
//  WeatherApp
//
//  Created by SKC on 17.02.2024.
//

import UIKit

extension UIView {

     static func makeTemperatureLabel(with font: UIFont) -> CustomLabel {
        let label = CustomLabel()
        label.font = font
        label.textAlignment = .center

        return label
    }

}
