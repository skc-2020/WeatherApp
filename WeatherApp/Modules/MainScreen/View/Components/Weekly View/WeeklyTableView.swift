//
//  WeeklyTableView.swift
//  WeatherApp
//
//  Created by AndUser on 25.03.2021.
//

import UIKit

final class WeeklyTableView: UITableView {

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

extension WeeklyTableView: ViewConfiguration {

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

private extension WeeklyTableView {

    func setupTableView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        rowHeight = 40

        register(WeeklyTableViewCell.self)
    }

}
