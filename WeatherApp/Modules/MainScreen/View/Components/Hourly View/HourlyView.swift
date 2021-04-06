//
//  HourlyView.swift
//  WeatherApp
//
//  Created by AndUser on 25.03.2021.
//

import UIKit

final class HourlyView: UICollectionView {

    private let cellId = HourlyView.defaultReuseIdentifier + "Cell"

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

        delegate = self
        dataSource = self
        register(HourlyViewCell.self)
    }

}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HourlyView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Weather.HourlyModel.mock.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reusableCell = dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HourlyViewCell

        guard let cell = reusableCell else { return UICollectionViewCell() }

        cell.configure(with: Weather.HourlyModel.mock[indexPath.row])

        return cell
    }

}
