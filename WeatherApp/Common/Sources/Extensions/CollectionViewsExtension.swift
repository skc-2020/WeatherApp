//
//  CollectionViews.swift
//  WeatherApp
//
//  Created by SKC on 04.04.2021.
//

import UIKit

// MARK: - UICollectionView

extension UICollectionView: ReusableView {

    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }

}

// MARK: - UITableView

extension UITableView: ReusableView {

    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

}
