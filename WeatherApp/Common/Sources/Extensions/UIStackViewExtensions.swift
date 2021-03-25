//
//  UIStackViewExtension.swift
//  WeatherApp
//
//  Created by AndUser on 23.03.2021.
//

import UIKit

extension UIStackView {

    func addArrangedSubview(_ views: UIView...) {

        for view in views {
            addArrangedSubview(view)
        }
    }

}
