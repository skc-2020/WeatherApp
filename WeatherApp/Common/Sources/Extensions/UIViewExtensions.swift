//
//  ViewExtensions.swift
//  WeatherApp
//
//  Created by SKC on 13.03.2021.
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

        pinTopEdge(to: .view(superview), attribute: .top)
        pinBottomEdge(to: .view(superview), attribute: .bottom)
        pinLeadingEdge(to: .view(superview), attribute: .leading)
        pinTrailingEdge(to: .view(superview), attribute: .trailing)
    }

}
