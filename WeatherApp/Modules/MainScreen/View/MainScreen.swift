//
//  ViewController.swift
//  WeatherApp
//
//  Created by AndUser on 11.03.2021.
//

import UIKit

final class MainScreen: BaseViewController {

    // MARK: - External Dependencies

    var output: MainScreenOutput!

    // MARK: - Private Variables

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

    private let footerView = FooterView()

    private let backgroundImage = UIImageView(image: DesignSystem.Images.sky)

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        openSearchScreen()
        setupView()
        setupViewConstraints()

        // MARK: get initial current location
        output.getCurrentLocation()
    }

}

// MARK: - Setup View

private extension MainScreen {

    func setupView() {
        view.addSubviews(
            backgroundImage,
            currentWeatherView,
            hourlyView,
            dailyTableView,
            footerView
        )
        view.accessibilityIdentifier = "MainView"
    }

}

// MARK: - Setup Layout

private extension MainScreen {

    func setupViewConstraints() {
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

        footerView.pinLeadingEdge(to: .view(view), attribute: .leading)
        footerView.pinTrailingEdge(to: .view(view), attribute: .trailing)
        footerView.pinTopEdge(to: .view(dailyTableView), attribute: .bottom)
        footerView.height(equalTo: 80)
    }

}

// MARK: - Daily Model DataSource & Delegate

extension MainScreen: UITableViewDataSource, UITableViewDelegate {

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

extension MainScreen: UICollectionViewDataSource, UICollectionViewDelegate {

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

// MARK: - MainScreenInput

extension MainScreen: MainScreenInput {

    func configureMainScreen(with model: Weather) {
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
    }

}

// MARK: - MainScreenInput

extension MainScreen {

    func openSearchScreen() {
        footerView.closureHandler = {
            self.output.didTapSearchButton()
        }
    }

}
