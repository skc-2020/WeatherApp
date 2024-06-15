//
//  FavouriteCityTableView.swift
//  WeatherApp
//
//  Created by SKC on 17.02.2024.
//

import UIKit

final class FavouriteCityTableView: UITableView {

    // MARK: - Variables

    let cellId = FavouriteCityTableView.defaultReuseIdentifier + "Cell"

    // MARK: - Initializers

    override init(frame: CGRect, style: Style) {
        super.init(frame: frame, style: style  )

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Setup View

private extension FavouriteCityTableView {

    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear

        rowHeight = 140
        register(DailyTableViewCell.self)
    }

}
