//
//  HourlyView.swift
//  WeatherApp
//
//  Created by SKC on 25.03.2021.
//

import UIKit

final class HourlyView: UICollectionView {

    // MARK: - Variables

    let hourlyCellId = HourlyView.defaultReuseIdentifier + "Cell"

    // MARK: - Initializers

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Setup View

private extension HourlyView {

    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(white: 1, alpha: 0)
        showsHorizontalScrollIndicator = false
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.white.cgColor
        register(HourlyViewCell.self)
    }

}
