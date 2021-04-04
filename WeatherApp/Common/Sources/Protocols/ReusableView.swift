//
//  ReusableView.swift
//  WeatherApp
//
//  Created by AndUser on 04.04.2021.
//

import UIKit

protocol ReusableView {

    static var defaultReuseIdentifier: String { get }

}

extension ReusableView where Self: UIView {

    static var defaultReuseIdentifier: String {
        String(describing: self)
    }

}
