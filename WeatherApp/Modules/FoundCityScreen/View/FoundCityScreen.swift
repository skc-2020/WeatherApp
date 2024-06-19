//
//  FoundCityScreen.swift
//  WeatherApp
//
//  Created by SKC on 26.04.2022.
//

import UIKit

protocol FoundCityScreenInput: UIViewController, AlertViewTrait {
    func configureScreen(with model: Weather)
}

final class FoundCityScreen: BaseViewController {

    private var foundCity = ""

    // MARK: - External Dependencies

    var output: FoundCityScreenOutput!

    private var activityIndicator: UIActivityIndicatorView = {
        var activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.color = DesignSystem.Colors.white

        return activityIndicator
    }()

    private let cancelButton: UIButton = {
        let cnclButton = UIButton()
        cnclButton.translatesAutoresizingMaskIntoConstraints = false
        cnclButton.setTitle("Cancel", for: .normal)
        cnclButton.accessibilityIdentifier = "FoundCityScreen.cancelButton.acid"

        return cnclButton
    }()

    private let addCityButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)

        return button
    }()

    private let currentWeatherView = CurrentWeatherView()

    private let hourlyView = HourlyView(
        frame: .zero, collectionViewLayout: {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width / 7, height: 110)

            return layout
        }()
    )

    private let dailyTableView = DailyTableView()

    private let backgroundImage = UIImageView(image: DesignSystem.Images.sky)

    init() {
        super.init(nibName: nil, bundle: nil)
        print("Found City Screen Initialised")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("Found City Screen DE-Inited")
    }

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addCityButton.addTarget(self,
                                action: #selector(addCityButtonTapped),
                                for: UIControl.Event.touchUpInside)
        cancelButton.addTarget(self,
                               action: #selector(cancelButtonTapped),
                               for: UIControl.Event.touchUpInside)
    }

}

// MARK: - Setup View

private extension FoundCityScreen {

    func setupView() {
        view.backgroundColor = DesignSystem.Colors.gray
        view.addSubviews(
            currentWeatherView,
            cancelButton,
            addCityButton,
            hourlyView,
            dailyTableView,
            activityIndicator
        )

        setupViewConstraints()
        activityIndicator.startAnimating()
    }

}

// MARK: - Setup Layout

private extension FoundCityScreen {

    func setupViewConstraints() {
        activityIndicator.pinTopEdge(to: .view(view), attribute: .top)
        activityIndicator.pinBottomEdge(to: .view(view), attribute: .bottom)
        activityIndicator.pinLeadingEdge(to: .view(view), attribute: .leading)
        activityIndicator.pinTrailingEdge(to: .view(view), attribute: .trailing)

        addCityButton.pinTopEdge(to: .view(view), attribute: .top, constant: 10)
        addCityButton.pinLeadingEdge(to: .view(view), attribute: .leading, constant: 10)
        addCityButton.height(equalTo: 40)

        cancelButton.pinTopEdge(to: .view(view), attribute: .top, constant: 10)
        cancelButton.pinTrailingEdge(to: .view(view), attribute: .trailing, constant: -10)
        cancelButton.height(equalTo: 40)

        currentWeatherView.pinLeadingEdge(to: .view(view), attribute: .leading)
        currentWeatherView.pinTrailingEdge(to: .view(view), attribute: .trailing)
        currentWeatherView.pinTopEdge(to: .view(view), attribute: .top)
        currentWeatherView.height(equalTo: 370)

        hourlyView.pinLeadingEdge(to: .view(view), attribute: .leading, constant: -1)
        hourlyView.pinTrailingEdge(to: .view(view), attribute: .trailing, constant: 1)
        hourlyView.pinTopEdge(to: .view(currentWeatherView), attribute: .bottom)
        hourlyView.height(equalTo: 120)

        dailyTableView.pinLeadingEdge(to: .view(view), attribute: .leading)
        dailyTableView.pinTrailingEdge(to: .view(view), attribute: .trailing)
        dailyTableView.pinTopEdge(to: .view(hourlyView), attribute: .bottom)
        dailyTableView.height(equalTo: 280)
    }

}

// MARK: - Daily Model DataSource & Delegate

extension FoundCityScreen: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.getDailyModel().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.dequeueReusableCell(
            withIdentifier: dailyTableView.cellId, for: indexPath
        ) as? DailyTableViewCell

        guard let cell = reusableCell else { return UITableViewCell() }

        cell.configure(with: output.getDailyModel()[indexPath.row])

        tableView.separatorColor = UIColor.clear

        return cell
    }

}

// MARK: - Hourly Model DataSource & Delegate

extension FoundCityScreen: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        output.getHourlyModel().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reusableCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: hourlyView.hourlyCellId, for: indexPath
        ) as? HourlyViewCell

        guard let cell = reusableCell else { return UICollectionViewCell() }

        let mappedHourlyModel = Self.mapHourlyModel(output.getHourlyModel())
        cell.configure(with: mappedHourlyModel[indexPath.row])

        return cell
    }

}

// MARK: - FoundCityScreenInput

extension FoundCityScreen: FoundCityScreenInput {

    func configureScreen(with model: Weather) {
        // MARK: current view

        guard let mappedCurrentModel = Self.mapCurrentModel(model) else { return }

        self.currentWeatherView.configure(with: mappedCurrentModel)

        // MARK: hourly view
        hourlyView.delegate = self
        hourlyView.dataSource = self
        hourlyView.reloadData()

        // MARK: daily view
        dailyTableView.delegate = self
        dailyTableView.dataSource = self
        dailyTableView.reloadData()

        self.activityIndicator.stopAnimating()
    }

}

// MARK: - Button Actions

 extension FoundCityScreen {

    @objc
    func cancelButtonTapped() {
        output.goBackToPreviousScreen()
    }

    @objc
    func addCityButtonTapped() {
        output.showMainScreenWithNewWeather()
    }

}
