//
//  WeeklyTableView.swift
//  WeatherApp
//
//  Created by AndUser on 25.03.2021.
//

import UIKit

final class DailyTableView: UITableView {

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

private extension DailyTableView {

    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear

        rowHeight = 40
        register(DailyTableViewCell.self)
    }

}
