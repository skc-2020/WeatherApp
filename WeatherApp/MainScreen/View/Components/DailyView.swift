//
//  Component.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

import UIKit
import SnapKit

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

    private let minTemperatureLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 20)

        return label
    }()

    private let maxTemperatureLabel: CustomLabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 20)

        return label
    }()

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

    struct Model {
        let locationName: String
        let cloudiness: String
        let temperature: String
        let maxTemperature: String
        let minTemperature: String
        let humidity: String?
        let description: String?
    }

    func configure(with model: Model) {
        locationNameLabel.text = model.locationName
        cloudinessLabel.text = model.cloudiness
        temperatureLabel.text = model.temperature
        maxTemperatureLabel.text = "H: " + model.maxTemperature + "°"
        minTemperatureLabel.text = "L: " + model.minTemperature + "°"
    }
}

// MARK: - Setup View

extension DailyView {
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

extension DailyView {
    func setupStackViewLayout() {
        translatesAutoresizingMaskIntoConstraints = false

        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(190)
            make.centerX.equalTo(snp.centerX)
        }
    }
}
