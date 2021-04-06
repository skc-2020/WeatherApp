//
//  WeeklyTableViewCell.swift
//  WeatherApp
//
//  Created by AndUser on 26.03.2021.
//

import UIKit

final class WeeklyTableViewCell: UITableViewCell, ReusableView {

    // MARK: - Private variables

    private let minTemperatureLabel = makeTemperatureLabel(with: DesignSystem.Fonts.medium3)

    private let maxTemperatureLabel = makeTemperatureLabel(with: DesignSystem.Fonts.medium3)

    private let dayLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = DesignSystem.Fonts.medium3
        label.textAlignment = .left

        return label
    }()

    private let cloudnessImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit

        return image
    }()

    private let humidityLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = DesignSystem.Fonts.medium0
        label.textAlignment = .center

        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
        setupViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configuration

extension WeeklyTableViewCell {

    typealias Model = Weather.WeeklyModel

    func configure(with model: Model) {
        dayLabel.text = model.dayOfWeek
        cloudnessImage.image = UIImage(named: model.icon)
        humidityLabel.text = model.humidity
        maxTemperatureLabel.text = model.maxTemperature
        minTemperatureLabel.text = model.minTemperature
    }

}

// MARK: - Setup View

private extension WeeklyTableViewCell {

    func setupView() {
        backgroundColor = UIColor(white: 0, alpha: 0)
    }

}

// MARK: - Setup Layout

private extension WeeklyTableViewCell {

    func setupViewConstraints() {
        addSubviews(dayLabel,
                    cloudnessImage,
                    humidityLabel,
                    maxTemperatureLabel,
                    minTemperatureLabel)

        layoutMargins = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            dayLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dayLabel.widthAnchor.constraint(equalToConstant: 150),

            cloudnessImage.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            cloudnessImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            cloudnessImage.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 6),
            cloudnessImage.widthAnchor.constraint(equalToConstant: 42),

            humidityLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            humidityLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: cloudnessImage.trailingAnchor, constant: 6),
            humidityLabel.widthAnchor.constraint(equalToConstant: 40),

            maxTemperatureLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            maxTemperatureLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            maxTemperatureLabel.leadingAnchor.constraint(equalTo: humidityLabel.trailingAnchor, constant: 50),
            maxTemperatureLabel.widthAnchor.constraint(equalToConstant: 30),

            minTemperatureLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            minTemperatureLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            minTemperatureLabel.leadingAnchor.constraint(equalTo: maxTemperatureLabel.trailingAnchor, constant: 10),
            minTemperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }

}

// MARK: - Make functions

extension WeeklyTableViewCell {

    static func makeTemperatureLabel(with font: UIFont) -> CustomLabel {
        let label = CustomLabel()
        label.font = font
        label.textAlignment = .center

        return label
    }

}
