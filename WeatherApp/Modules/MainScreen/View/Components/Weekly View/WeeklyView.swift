//
//  WeeklyView.swift
//  WeatherApp
//
//  Created by AndUser on 25.03.2021.
//

import UIKit

final class WeeklyView: UITableView {

    // MARK: - Initializers

    override init(frame: CGRect, style: Style) {
        super.init(frame: frame, style: style  )

        setupTableView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configuration

extension WeeklyView: ViewConfiguration {

    struct Model {
        let delegate: UITableViewDelegate
        let dataSource: UITableViewDataSource
    }

    func configure(with model: Model) {
        delegate = model.delegate
        dataSource = model.dataSource
    }

}

// MARK: - Setup View

private extension WeeklyView {

    func setupTableView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        rowHeight = 40

        self.register(WeeklyTableViewCell.self,
                      forCellReuseIdentifier: Constants.cellIdentifier)
    }

}

// MARK: - Constants

extension WeeklyView {

    struct Constants {
        static let cellIdentifier = "WeeklyTableViewCell"
    }

}
