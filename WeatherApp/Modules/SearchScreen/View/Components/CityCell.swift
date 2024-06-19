//
//  CityCell.swift
//  WeatherApp
//
//  Created by SKC on 21.04.2022.
//

import UIKit

final class CityCell: ReusableTableView {

    // MARK: - Components
    private let cityNameLabel: UILabel = {
        let label = CustomLabel()
        label.font = DesignSystem.Fonts.large
        label.textAlignment = .left
        label.textColor = DesignSystem.Colors.lightGray

        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configuration

extension CityCell {

    typealias Model = String

    func configure(with model: Model) {
        cityNameLabel.text = model
    }

}

// MARK: - Setup View

extension CityCell {

    func setupView() {
        addSubview(cityNameLabel)

        cityNameLabel.pinTopEdge(to: .view(self), attribute: .top)
        cityNameLabel.pinBottomEdge(to: .view(self), attribute: .bottom)
        cityNameLabel.pinLeadingEdge(to: .view(self), attribute: .leading, constant: 20)
    }

}
