//
//  FavouriteCityTableViewCell.swift
//  WeatherApp
//
//  Created by SKC on 17.02.2024.
//

import UIKit

final class FavouriteCityTableViewCell: ReusableTableView {

    var tapCompletionHandler: (String) -> Void = { _ in }
    var swipeLeftCompletionHandler: (String) -> Void = { _ in }

    // MARK: - Private variables

    let innerView: UIView = {
        let innerView = UIView()
        innerView.translatesAutoresizingMaskIntoConstraints = false
        innerView.layer.cornerRadius = 23
        innerView.layer.masksToBounds = true

        return innerView
    }()

    private let backgroundImage = UIImageView(image: DesignSystem.Images.favouriteCity)

    private let cityNameLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "City name"
        label.font = DesignSystem.Fonts.medium5Bold
        
        return label
    }()

    private let timeLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "19:02"

        return label
    }()

    private let cloudsLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Sunny"
        label.font = DesignSystem.Fonts.medium0

        return label
    }()

    private let temperatureLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "16°"
        label.font = DesignSystem.Fonts.extraLarge

        return label
    }()

    private let temperatureRangeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 7

        return stackView
    }()

    private let minTemperatureLabel = makeTemperatureLabel(with: DesignSystem.Fonts.medium0)

    private let maxTemperatureLabel = makeTemperatureLabel(with: DesignSystem.Fonts.medium0)

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configuration

extension FavouriteCityTableViewCell {

    typealias Model = WeatherViewModel

    func configure(with model: Model) {
        guard let favouriteCityWeather = model.daily.first else {
            print("Couldn't configure FavouriteCityView with favourite city weather")
            return
        }

        cityNameLabel.text = model.locationName
        timeLabel.text = DateConverter.getTime(from: model.current?.dt ?? -1)
        cloudsLabel.text = String(describing: favouriteCityWeather.clouds)
        temperatureLabel.text = String(describing: favouriteCityWeather.temperature.day)
        maxTemperatureLabel.text = String(describing: favouriteCityWeather.temperature.max)
        minTemperatureLabel.text = String(describing: favouriteCityWeather.temperature.min)
    }

}

// MARK: - Setup View

private extension FavouriteCityTableViewCell {

    func setupView() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        addSubviews(innerView)
        innerView.addSubviews(
        backgroundImage,
        cityNameLabel,
        timeLabel,
        cloudsLabel,
        temperatureLabel,
        temperatureRangeStackView
        )

        temperatureRangeStackView.addArrangedSubview(
            maxTemperatureLabel,
            minTemperatureLabel
        )

        setupViewConstraints()
    }

}

// MARK: - Setup Layout

private extension FavouriteCityTableViewCell {

    func setupViewConstraints() {
        innerView.pinTopEdge(to: .view(self), attribute: .top, constant: 10)
        innerView.pinBottomEdge(to: .view(self), attribute: .bottom, constant: -10)
        innerView.pinLeadingEdge(to: .view(self), attribute: .leading)
        innerView.pinTrailingEdge(to: .view(self), attribute: .trailing)

        backgroundImage.pinTopEdge(to: .view(innerView), attribute: .top)
        backgroundImage.pinBottomEdge(to: .view(innerView), attribute: .bottom)
        backgroundImage.pinLeadingEdge(to: .view(innerView), attribute: .leading)
        backgroundImage.pinTrailingEdge(to: .view(innerView), attribute: .trailing)

        cityNameLabel.pinTopEdge(to: .view(innerView), attribute: .top, constant: 10)
        cityNameLabel.pinLeadingEdge(to: .view(innerView), attribute: .leading, constant: 15)

        timeLabel.pinLeadingEdge(to: .view(innerView), attribute: .leading, constant: 15)
        timeLabel.pinTopEdge(to: .view(cityNameLabel), attribute: .bottom, constant: 5)

        cloudsLabel.pinLeadingEdge(to: .view(innerView), attribute: .leading, constant: 15)
        cloudsLabel.pinBottomEdge(to: .view(innerView), attribute: .bottom, constant: -8)
        
        temperatureLabel.pinTopEdge(to: .view(innerView), attribute: .top, constant: 10)
        temperatureLabel.pinTrailingEdge(to: .view(innerView), attribute: .trailing, constant: -15)
        
        temperatureRangeStackView.pinBottomEdge(to: .view(innerView), attribute: .bottom, constant: -7)
        temperatureRangeStackView.pinTrailingEdge(to: .view(innerView), attribute: .trailing, constant: -15)
    }   

}
