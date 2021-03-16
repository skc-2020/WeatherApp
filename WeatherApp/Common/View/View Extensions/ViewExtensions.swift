//
//  ViewExtensions.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

import UIKit

// MARK: - UIView Extension

extension UIView {
    func addSubviews(_ views: UIView...) {

        for view in views {
            addSubview(view)
        }
    }
}

// MARK: - UIStackView Extension

extension UIStackView {
    func addArrangedSubview(_ views: UIView...) {

        for view in views {
            addArrangedSubview(view)
        }
    }
}
