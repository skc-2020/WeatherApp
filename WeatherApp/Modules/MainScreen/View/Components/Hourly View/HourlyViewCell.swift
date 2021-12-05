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

    typealias Model = WeatherViewModel.CurrentForecastModel

    func configure(with model: Model) {
        hourLabel.text = model.dt
        cloudnessImage.image = UIImage(named: model.weather.icon ?? "") ?? DesignSystem.Images.noIcon
        temperatureLabel.text = model.temp
    }

}

// MARK: - Setup Layout

private extension HourlyViewCell {

    func setupViewConstraints() {
        addSubviews(hourLabel,
                    cloudnessImage,
                    temperatureLabel)

        layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        hourLabel.pinLeadingEdge(to: .layout(layoutMarginsGuide), attribute: .leading)
        hourLabel.pinTrailingEdge(to: .layout(layoutMarginsGuide), attribute: .trailing)
        hourLabel.pinTopEdge(to: .view(self), attribute: .top, constant: 4)
        hourLabel.height(equalTo: 34)

        cloudnessImage.centerX(equalsToCenterIn: self)
        cloudnessImage.pinTopEdge(to: .view(hourLabel), attribute: .bottom, constant: 4)
        cloudnessImage.height(equalTo: 37)
        cloudnessImage.width(equalTo: 37)

        temperatureLabel.pinLeadingEdge(to: .layout(layoutMarginsGuide), attribute: .leading)
        temperatureLabel.pinTrailingEdge(to: .layout(layoutMarginsGuide), attribute: .trailing)
        temperatureLabel.pinTopEdge(to: .view(cloudnessImage), attribute: .bottom, constant: 4)
        temperatureLabel.pinBottomEdge(to: .view(self), attribute: .bottom)
    }

}

// MARK: - Make functions

private extension HourlyViewCell {

    static func makeTemperatureLabel(with font: UIFont) -> CustomLabel {
        let label = CustomLabel()
        label.font = font
        label.textAlignment = .center

        return label
    }

}
