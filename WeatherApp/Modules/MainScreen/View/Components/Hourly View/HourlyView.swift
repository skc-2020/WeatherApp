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
        let delegate: UICollectionViewDelegate
        let dataSource: UICollectionViewDataSource
    }

    func configure(with model: Model) {
        delegate = model.delegate
        dataSource = model.dataSource
    }

}

// MARK: - Setup View

extension HourlyView: UICollectionViewDelegateFlowLayout {

    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear

        delegate = self
        dataSource = self
        self.register(HourlyViewCell.self,
                      forCellWithReuseIdentifier: Constants.cellIdentifier)
    }

}

extension HourlyView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Weather.HourlyModel.mock.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reusableCell = dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as? HourlyViewCell

        guard let cell = reusableCell else { return UICollectionViewCell() }

        cell.configure(with: Weather.HourlyModel.mock[indexPath.row])

        return cell
    }

}

// MARK: - Constants

private extension HourlyView {

    struct Constants {
        static let cellIdentifier = "HourlyViewCell"
    }

}
