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

        hourLabel.pinLeadingEdge(to: self, attribute: .leading, constant: 10)
        hourLabel.pinTrailingEdge(to: self, attribute: .trailing, constant: -10)
        hourLabel.pinTop(to: self, attribute: .top, constant: 4)
        hourLabel.height(equalTo: 34)

        cloudnessImage.pinLeadingEdge(to: self, attribute: .leading, constant: 10)
        cloudnessImage.pinTrailingEdge(to: self, attribute: .trailing, constant: -10)
        cloudnessImage.pinTop(to: hourLabel, attribute: .bottom, constant: 4)
        cloudnessImage.height(equalTo: 37)
        cloudnessImage.width(equalTo: 37)

        temperatureLabel.pinLeadingEdge(to: self, attribute: .leading, constant: 10)
        temperatureLabel.pinTrailingEdge(to: self, attribute: .trailing, constant: -10)
        temperatureLabel.pinTop(to: cloudnessImage, attribute: .bottom, constant: 4)
        temperatureLabel.pinBottom(to: self, attribute: .bottom)
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
