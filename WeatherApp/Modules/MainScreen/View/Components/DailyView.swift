//
//  Component.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

import UIKit

final class DailyView: UIView {

    // MARK: - Private variables

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        return stackView
    }()

    private let locationNameLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center

        return label
    }()

    private let cloudinessLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textAlignment = .center

        return label
    }()

    private let temperatureLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 90, weight: .light)
        label.textAlignment = .center

        return label
    }()

    // MARK: Temperature Range StackView

    private let temperatureRangeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 7

        return stackView
    }()

    private let minTemperatureLabel = makeTemperaratureLabel()

    private let maxTemperatureLabel = makeTemperaratureLabel()

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

extension DailyView: ViewConfiguration {

    typealias Model = Weather.DailyModel

    func configure(with model: Model) {
        locationNameLabel.text = model.locationName
        cloudinessLabel.text = model.cloudiness
        temperatureLabel.text = model.temperature
        maxTemperatureLabel.text = model.maxTemperature
        minTemperatureLabel.text = model.minTemperature
    }

}

// MARK: - Setup View

private extension DailyView {

    func setupView() {
        stackView.addArrangedSubview(
            locationNameLabel,
            cloudinessLabel,
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

private extension DailyView {

    func setupStackViewLayout() {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 190),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}

// MARK: - Make functions

private extension DailyView {

    static func makeTemperaratureLabel() -> CustomLabel {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 20)

        return label
    }

}