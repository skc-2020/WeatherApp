//
//  UIView+Layout.swift
//  WeatherApp
//
//  Created by AndUser on 31.03.2021.
//

import UIKit

extension UIView {

    func pinTop(
        to: UIView,
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0
        ) {
        NSLayoutConstraint(
            item: self,
            attribute: .top,
            relatedBy: relation,
            toItem: to,
            attribute: attribute,
            multiplier: 1,
            constant: constant
        ).isActive = true
    }

    func pinBottom(
        to: UIView,
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0
        ) {
        NSLayoutConstraint(
            item: self,
            attribute: .bottom,
            relatedBy: relation,
            toItem: to,
            attribute: attribute,
            multiplier: 1,
            constant: constant
        ).isActive = true
    }

    func pinLeadingEdge(
        to: UIView,
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0
        ) {
        NSLayoutConstraint(
            item: self,
            attribute: .leading,
            relatedBy: relation,
            toItem: to,
            attribute: attribute,
            multiplier: 1,
            constant: constant
        ).isActive = true
    }

    func pinTrailingEdge(
        to: UIView,
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0
        ) {
        NSLayoutConstraint(
            item: self,
            attribute: .trailing,
            relatedBy: relation,
            toItem: to,
            attribute: attribute,
            multiplier: 1,
            constant: constant
        ).isActive = true
    }

    func height(equalTo constant: CGFloat, multiplier: CGFloat = 1) {
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func width(equalTo constant: CGFloat, multiplier: CGFloat = 1) {
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func centerX(equalsCenter view: UIView, constant: CGFloat = 0) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }

    func centerY(equalsCenter view: UIView, constant: CGFloat = 0) {
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }

}
