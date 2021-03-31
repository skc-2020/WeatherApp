//
//  WeeklyTableViewCell.swift
//  WeatherApp
//
//  Created by AndUser on 26.03.2021.
//

import UIKit

final class WeeklyTableViewCell: UITableViewCell {

    // MARK: - Private variables

    private let minTemperatureLabel = makeTemperatureLabel()

    private let maxTemperatureLabel = makeTemperatureLabel()

    private let dayLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 20)
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
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center

        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViewConstraints()
    }

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

// MARK: - Setup Layout

private extension WeeklyTableViewCell {

    func setupViewConstraints() {
        backgroundColor = .clear
        addSubviews(dayLabel,
                    cloudnessImage,
                    humidityLabel,
                    maxTemperatureLabel,
                    minTemperatureLabel)

        layoutMargins = .init(top: 6, left: 0, bottom: -6, right: 0)

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
