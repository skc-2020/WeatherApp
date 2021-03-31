//
//  ViewController.swift
//  WeatherApp
//
//  Created by AndUser on 11.03.2021.
//

import UIKit

final class MainScreen: BaseViewController {

    // MARK: - External Dependencies

    var output: MainScreenOutput?

    // MARK: - Private Variables

    private let dailyView = DailyView()
    private let hourlyView = HourlyView(
        frame: .zero, collectionViewLayout: {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width / 7, height: 110)

            return layout
        }()
    )

    private let weeklyView = WeeklyView()
    private let backgroundImage = UIImageView(image: DesignSystem.Images.sky)

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupViewConstraints()
    }

}

// MARK: - Setup View

private extension MainScreen {

    func setupView() {
        view.addSubviews(
            backgroundImage,
            dailyView,
            hourlyView,
            weeklyView
        )
    }

}

// MARK: - Setup Layout

private extension MainScreen {

    func setupViewConstraints() {
        NSLayoutConstraint.activate([
            dailyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dailyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dailyView.topAnchor.constraint(equalTo: view.topAnchor),
            dailyView.heightAnchor.constraint(equalToConstant: 410),

            hourlyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            hourlyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hourlyView.topAnchor.constraint(equalTo: dailyView.bottomAnchor),
            hourlyView.heightAnchor.constraint(equalToConstant: 120),

            weeklyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            weeklyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weeklyView.topAnchor.constraint(equalTo: hourlyView.bottomAnchor),
            weeklyView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }

}

// MARK: - DataSource & Delegate

extension MainScreen: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Weather.HourlyModel.mock.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let reusableCell = tableView.dequeueReusableCell(
            withIdentifier: WeeklyView.Constants.cellIdentifier,
            for: indexPath
        ) as? WeeklyTableViewCell

        guard let cell = reusableCell else { return UITableViewCell() }

        cell.configure(with: Weather.WeeklyModel.mock[indexPath.row])
        tableView.separatorColor = UIColor.clear

        return cell
    }

}

// MARK: - MainScreenInput

extension MainScreen: MainScreenInput {

    func configureMainScreen(with dailyModel: Weather.DailyModel) {
        let mappedDailyModel = MainScreen.map(model: dailyModel)
        dailyView.configure(with: mappedDailyModel)
        weeklyView.configure(with: .init(delegate: self, dataSource: self))
    }

}
