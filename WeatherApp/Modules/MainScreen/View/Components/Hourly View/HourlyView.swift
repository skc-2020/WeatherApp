//
//  HourlyView.swift
//  WeatherApp
//
//  Created by AndUser on 25.03.2021.
//

import UIKit

final class HourlyView: UICollectionView {

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

// MARK: - Configuration

extension HourlyView: ViewConfiguration {

    struct Model {
        weak var delegate: UICollectionViewDelegate?
        let dataSource: UICollectionViewDataSource
    }

    func configure(with model: Model) {
        delegate = model.delegate
        dataSource = model.dataSource
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
