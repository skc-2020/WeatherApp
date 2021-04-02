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

        self.pinTop(to: superview, attribute: .top)
        self.pinBottom(to: superview, attribute: .bottom)
        self.pinLeadingEdge(to: superview, attribute: .leading)
        self.pinTrailingEdge(to: superview, attribute: .trailing)

    }

}
