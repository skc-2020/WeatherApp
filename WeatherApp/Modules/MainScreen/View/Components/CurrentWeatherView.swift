//
//  Component.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

import UIKit

final class CurrentWeatherView: UIView {

    // MARK: - Private variables

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        return stackView
    }()

    private let locationNameLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = DesignSystem.Fonts.large
        label.textAlignment = .center

        return label
    }()

    private let cloudsLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = DesignSystem.Fonts.medium2
        label.textAlignment = .center

        return label
    }()

    private let temperatureLabel = makeTemperatureLabel(with: DesignSystem.Fonts.thinGiant)

    // MARK: Temperature Range StackView

    private let temperatureRangeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 7

        return stackView
    }()

    private let minTemperatureLabel = makeTemperatureLabel(with: DesignSystem.Fonts.medium3)

    private let maxTemperatureLabel = makeTemperatureLabel(with: DesignSystem.Fonts.medium3)

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupStackViewLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configuration

extension CurrentWeatherView: ViewConfiguration {

    typealias Model = ViewModel

    func configure(with model: Model) {
        guard let currentDay = model.daily?.first else { return }

        locationNameLabel.text = model.locationName
        cloudsLabel.text = String(describing: currentDay.clouds ?? 0)
        temperatureLabel.text = String(describing: currentDay.temperature?.day ?? "")
        maxTemperatureLabel.text = String(describing: currentDay.temperature?.max ?? "")
        minTemperatureLabel.text = String(describing: currentDay.temperature?.min ?? "")
    }

}

// MARK: - Setup View

private extension CurrentWeatherView {

    func setupView() {
        stackView.addArrangedSubview(
            locationNameLabel,
            cloudsLabel,
            temperatureLabel,
            temperatureRangeStackView
        )

        temperatureRangeStackView.addArrangedSubview(
            maxTemperatureLabel,
            minTemperatureLabel
        )

        addSubviews(stackView)
    }

}

// MARK: - Setup Constraints

private extension CurrentWeatherView {

    func setupStackViewLayout() {
        translatesAutoresizingMaskIntoConstraints = false

        stackView.pinTopEdge(to: .view(self), attribute: .top, constant: 120)
        stackView.centerX(equalsToCenterIn: self)
    }

}

// MARK: - Make functions

private extension CurrentWeatherView {

    static func makeTemperatureLabel(with font: UIFont) -> CustomLabel {
        let label = CustomLabel()
        label.font = font
        label.textAlignment = .center

        return label
    }

}
