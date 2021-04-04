//
//  ViewExtensions.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

import UIKit

// MARK: - Subviews

extension UIView {

    func addSubviews(_ views: UIView...) {

        for view in views {
            addSubview(view)
        }
    }

}

// MARK: - Setup Constraints

extension UIView {

    func pinToSuperview() {
        guard let superview = superview else { return }

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }

}

// MARK: - Make functions

extension UIView {

    static func makeTemperatureLabel(with font: UIFont) -> CustomLabel {
        let label = CustomLabel()
        label.font = font
        label.textAlignment = .center

        return label
    }

}
