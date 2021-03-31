//
//  HourlyViewCell.swift
//  WeatherApp
//
//  Created by AndUser on 25.03.2021.
//

import UIKit

final class HourlyViewCell: UICollectionViewCell {

    // MARK: - Private variables

    private let hourLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center

        return label
    }()
    
    private let cloudnessImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill

        return image
    }()

    private let temperatureLabel = makeTemperatureLabel()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configuration

extension HourlyViewCell {

    typealias Model = Weather.HourlyModel

    func configure(with model: Model) {
        backgroundColor = .clear

        hourLabel.text = model.hour
        cloudnessImage.image = UIImage(named: model.icon)
        temperatureLabel.text = model.temperature
    }

}

// MARK: - Setup Layout

private extension HourlyViewCell {

    func setupViewConstraints() {
        addSubviews(hourLabel,
                    cloudnessImage,
                    temperatureLabel)

        NSLayoutConstraint.activate([
            hourLabel.leadingAnchor.constraint(equalTo:  leadingAnchor, constant: 10),
            hourLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            hourLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            hourLabel.heightAnchor.constraint(equalToConstant: 34),

            cloudnessImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cloudnessImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cloudnessImage.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 4),
            cloudnessImage.heightAnchor.constraint(equalToConstant: 37),
            cloudnessImage.widthAnchor.constraint(equalTo: cloudnessImage.heightAnchor),

            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            temperatureLabel.topAnchor.constraint(equalTo: cloudnessImage.bottomAnchor, constant: 4),
            temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
