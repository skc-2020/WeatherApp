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
            static let medium0: CGFloat = 16
            static let medium1: CGFloat = 18
            static let medium2: CGFloat = 19
            static let medium3: CGFloat = 20
            static let large: CGFloat = 30
            static let giant: CGFloat = 90
        }

        static let medium0 = UIFont.systemFont(ofSize: Sizes.medium0)
        static let medium1 = UIFont.systemFont(ofSize: Sizes.medium1)
        static let medium2 = UIFont.systemFont(ofSize: Sizes.medium2)
        static let medium3 = UIFont.systemFont(ofSize: Sizes.medium3)
        static let large = UIFont.systemFont(ofSize: Sizes.large)
        static let thinGiant = UIFont.systemFont(ofSize: Sizes.giant, weight: .thin)

    }

}
