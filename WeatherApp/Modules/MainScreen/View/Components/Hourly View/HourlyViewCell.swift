//
//  HourlyViewCell.swift
//  WeatherApp
//
//  Created by AndUser on 25.03.2021.
//

import UIKit

typealias ReusableCollection = UICollectionViewCell & ReusableView

final class HourlyViewCell: ReusableCollection {

    // MARK: - Private variables

    private let hourLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = DesignSystem.Fonts.medium1
        label.textAlignment = .center

        return label
    }()
    
    private let cloudnessImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit

        return image
    }()

    private let temperatureLabel = makeTemperatureLabel(with: DesignSystem.Fonts.medium3)

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configuration

extension HourlyViewCell {

    typealias Model = Weather.HourlyModel

    func configure(with model: Model) {
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

// MARK: - Make functions

extension HourlyViewCell {

    static func makeTemperatureLabel(with font: UIFont) -> CustomLabel {
        let label = CustomLabel()
        label.font = font
        label.textAlignment = .center

        return label
    }

}
