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
