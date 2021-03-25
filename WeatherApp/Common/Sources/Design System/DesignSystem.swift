//
//  DesignSystem.swift
//  WeatherApp
//
//  Created by AndUser on 23.03.2021.
//

import UIKit

struct DesignSystem {}

// MARK: Images

extension DesignSystem {

    struct Images {
        static let sky = UIImage(named: "sky")
    }

}

// MARK: Colors

extension DesignSystem {

    struct Colors {
        static let gray = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }

}

// MARK: Fonts

extension DesignSystem {

    struct Fonts {

        struct Sizes {
            static let small: CGFloat = 8
            static let medium: CGFloat = 13
            static let large: CGFloat = 16
        }

        static let f1 = UIFont.boldSystemFont(ofSize: Sizes.large)
    }

}