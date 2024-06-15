//
//  FavouriteCityView.swift
//  WeatherApp
//
//  Created by SKC on 02.10.2023.
//

import UIKit

final class FavouriteCityView: UIView {

    private let backgroundImage = UIImageView(image: DesignSystem.Images.favouriteCity)

    var tapCompletionHandler: (String) -> Void = { _ in }
    var swipeLeftCompletionHandler: (String) -> Void = { _ in }

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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configuration

extension FavouriteCityView: ViewConfiguration {

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

private extension FavouriteCityView {

    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapFavouriteCityView(_:)))
        addGestureRecognizer(tap)
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeFavouriteCityView(_:)))
        swipe.direction = .left
        addGestureRecognizer(swipe)

        addSubviews(
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

        setupConstraints()
    }

}

// MARK: - Setup Constraints

private extension FavouriteCityView {

    func setupConstraints() {
        backgroundImage.pinTopEdge(to: .view(self), attribute: .top)
        backgroundImage.pinBottomEdge(to: .view(self), attribute: .bottom)
        backgroundImage.pinLeadingEdge(to: .view(self), attribute: .leading)
        backgroundImage.pinTrailingEdge(to: .view(self), attribute: .trailing)

        cityNameLabel.pinTopEdge(to: .view(self), attribute: .top, constant: 10)
        cityNameLabel.pinLeadingEdge(to: .view(self), attribute: .leading, constant: 15)

        timeLabel.pinLeadingEdge(to: .view(self), attribute: .leading, constant: 15)
        timeLabel.pinTopEdge(to: .view(cityNameLabel), attribute: .bottom, constant: 5)

        cloudsLabel.pinLeadingEdge(to: .view(self), attribute: .leading, constant: 15)
        cloudsLabel.pinBottomEdge(to: .view(self), attribute: .bottom, constant: -8)

        temperatureLabel.pinTopEdge(to: .view(self), attribute: .top, constant: 10)
        temperatureLabel.pinTrailingEdge(to: .view(self), attribute: .trailing, constant: -15)

        temperatureRangeStackView.pinBottomEdge(to: .view(self), attribute: .bottom, constant: -7)
        temperatureRangeStackView.pinTrailingEdge(to: .view(self), attribute: .trailing, constant: -15)
    }

}

// MARK: - Guesture handler

private extension FavouriteCityView {

    @objc
    func didTapFavouriteCityView(_ sender: UITapGestureRecognizer? = nil) {
        guard let newView = sender?.view as? FavouriteCityView else {
            print("Error! Couldn't get/cast view: \(String(describing: sender?.view)) as FavouriteCityView")
            return
        }
        guard let touchedCity = newView.cityNameLabel.text else {
            print("Error! Couldn't get text from cityNameLabel: \(String(describing: newView.cityNameLabel.text))")
            return
        }
        defaults.set(touchedCity, forKey: Saved.cityForMainScreen.rawValue)
        tapCompletionHandler(touchedCity)
    }

    @objc
    func didSwipeFavouriteCityView(_ sender: UITapGestureRecognizer? = nil) {
        guard let newView = sender?.view as? FavouriteCityView else {
            print("Error! Couldn't get/cast view: \(String(describing: sender?.view)) as FavouriteCityView")
            return
        }
        guard let touchedCity = newView.cityNameLabel.text else {
            print("Error! Couldn't get text from cityNameLabel: \(String(describing: newView.cityNameLabel.text))")
            return
        }
        swipeLeftCompletionHandler(touchedCity)
    }

}
