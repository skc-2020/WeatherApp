//
//  UIView+Layout.swift
//  WeatherApp
//
//  Created by AndUser on 31.03.2021.
//

import UIKit

enum View {

    case view(UIView)
    case layout(UILayoutGuide)

    var item: Any {
        switch self {
        case .view(let view):
            return view
        case .layout(let layout):
            return layout
        }
    }

}

extension UIView {

    @discardableResult
    func pinTopEdge(
        to: View,
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0
        ) -> NSLayoutConstraint {
        NSLayoutConstraint(
            item: self,
            attribute: .top,
            relatedBy: relation,
            toItem: to.item,
            attribute: attribute,
            multiplier: 1,
            constant: constant
        ).isActivating()
    }

    @discardableResult
    func pinBottomEdge(
        to: View,
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0
        ) -> NSLayoutConstraint {
        NSLayoutConstraint(
            item: self,
            attribute: .bottom,
            relatedBy: relation,
            toItem: to.item,
            attribute: attribute,
            multiplier: 1,
            constant: constant
        ).isActivating()
    }

    @discardableResult
    func pinLeadingEdge(
        to: View,
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0
        ) -> NSLayoutConstraint {
        NSLayoutConstraint(
            item: self,
            attribute: .leading,
            relatedBy: relation,
            toItem: to.item,
            attribute: attribute,
            multiplier: 1,
            constant: constant
        ).isActivating()
    }

    @discardableResult
    func pinTrailingEdge(
        to: View,
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0
        ) -> NSLayoutConstraint {
        NSLayoutConstraint(
            item: self,
            attribute: .trailing,
            relatedBy: relation,
            toItem: to.item,
            attribute: attribute,
            multiplier: 1,
            constant: constant
        ).isActivating()
    }

    @discardableResult
    func height(equalTo constant: CGFloat, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        heightAnchor
            .constraint(equalToConstant: constant)
            .isActivating()
    }

    @discardableResult
    func width(equalTo constant: CGFloat, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        widthAnchor
            .constraint(equalToConstant: constant)
            .isActivating()
    }

    @discardableResult
    func centerX(equalsToCenterIn view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        centerXAnchor
            .constraint(equalTo: view.centerXAnchor, constant: constant)
            .isActivating()
    }

    @discardableResult
    func centerX(equalsToCenterIn layout: UILayoutGuide, constant: CGFloat = 0) -> NSLayoutConstraint {
        centerXAnchor
            .constraint(equalTo: layout.centerXAnchor, constant: constant)
            .isActivating()
    }

    @discardableResult
    func centerY(equalsToCenterIn view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        centerYAnchor
            .constraint(equalTo: view.centerYAnchor, constant: constant)
            .isActivating()
    }

    @discardableResult
    func centerY(equalsToCenterIn layout: UILayoutGuide, constant: CGFloat = 0) -> NSLayoutConstraint {
        centerYAnchor
            .constraint(equalTo: layout.centerYAnchor, constant: constant)
            .isActivating()
    }

}

extension NSLayoutConstraint {

    func isActivating() -> Self {
        self.isActive = true
        return self
    }

}
