//
//  WeeklyTableViewCell.swift
//  WeatherApp
//
//  Created by SKC on 26.03.2021.
//

import UIKit

typealias ReusableTableView = UITableViewCell & ReusableView

final class DailyTableViewCell: ReusableTableView {

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

extension DailyTableViewCell {

    typealias Model = WeatherViewModel.DailyForecastModel

    func configure(with model: Model) {
        dayLabel.text = DateConverter.getDayOfWeek(from: model.dt)
        cloudnessImage.image = UIImage(named: model.weather.icon ?? "") ?? DesignSystem.Images.noIcon
        humidityLabel.text = model.humidity
        maxTemperatureLabel.text = model.temperature.max
        minTemperatureLabel.text = model.temperature.min
    }

}

// MARK: - Setup View

private extension DailyTableViewCell {

    func setupView() {
        backgroundColor = UIColor(white: 0, alpha: 0)
        addSubviews(dayLabel,
                    cloudnessImage,
                    humidityLabel,
                    maxTemperatureLabel,
                    minTemperatureLabel)
    }

}

// MARK: - Setup Layout

private extension DailyTableViewCell {

    // swiftlint:disable function_body_length
    func setupViewConstraints() {
        layoutMargins = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)

        dayLabel.pinTopEdge(to: .layout(layoutMarginsGuide), attribute: .top)
        dayLabel.pinBottomEdge(to: .layout(layoutMarginsGuide), attribute: .bottom)
        dayLabel.pinLeadingEdge(to: .view(self), attribute: .leading, constant: 20)
        dayLabel.width(equalTo: 150)

        cloudnessImage.pinTopEdge(to: .view(self), attribute: .top, constant: 3)
        cloudnessImage.pinBottomEdge(to: .view(self), attribute: .bottom, constant: -3)
        cloudnessImage.pinLeadingEdge(to: .view(dayLabel), attribute: .trailing, constant: 6)
        cloudnessImage.width(equalTo: 42)

        humidityLabel.pinTopEdge(to: .view(self), attribute: .top)
        humidityLabel.pinBottomEdge(to: .view(self), attribute: .bottom)
        humidityLabel.pinLeadingEdge(to: .view(cloudnessImage), attribute: .trailing, constant: 6)
        humidityLabel.width(equalTo: 40)

        maxTemperatureLabel.pinTopEdge(to: .layout(layoutMarginsGuide), attribute: .top)
        maxTemperatureLabel.pinBottomEdge(to: .layout(layoutMarginsGuide), attribute: .bottom)
        maxTemperatureLabel.pinLeadingEdge(to: .view(humidityLabel), attribute: .trailing, constant: 50)
        maxTemperatureLabel.width(equalTo: 30)

        minTemperatureLabel.pinTopEdge(to: .layout(layoutMarginsGuide), attribute: .top)
        minTemperatureLabel.pinBottomEdge(to: .layout(layoutMarginsGuide), attribute: .bottom)
        minTemperatureLabel.pinLeadingEdge(to: .view(maxTemperatureLabel), attribute: .trailing, constant: 10)
        minTemperatureLabel.pinTrailingEdge(to: .view(self), attribute: .trailing, constant: -10)
    }
    // swiftlint:enable function_body_length

}
