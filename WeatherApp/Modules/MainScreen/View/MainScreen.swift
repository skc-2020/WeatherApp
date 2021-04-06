//
//  ViewController.swift
//  WeatherApp
//
//  Created by AndUser on 11.03.2021.
//

import UIKit

final class MainScreen: BaseViewController {

    private let cellId = WeeklyTableView.defaultReuseIdentifier + "Cell"

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

    private let weeklyTableView = WeeklyTableView()
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
            weeklyTableView
        )
    }

}

// MARK: - Setup Layout

private extension MainScreen {

    func setupViewConstraints() {
        dailyView.pinLeadingEdge(to: view, attribute: .leading)
        dailyView.pinTrailingEdge(to: view, attribute: .trailing)
        dailyView.pinTop(to: view, attribute: .top)
        dailyView.height(equalTo: 410)

        hourlyView.pinLeadingEdge(to: view, attribute: .leading, constant: 15)
        hourlyView.pinTrailingEdge(to: view, attribute: .trailing)
        hourlyView.pinTop(to: dailyView, attribute: .bottom)
        hourlyView.height(equalTo: 120)

        weeklyTableView.pinLeadingEdge(to: view, attribute: .leading, constant: 10)
        weeklyTableView.pinTrailingEdge(to: view, attribute: .trailing)
        weeklyTableView.pinTop(to: hourlyView, attribute: .bottom)
        weeklyTableView.height(equalTo: 600)
    }

}

// MARK: - DataSource & Delegate

extension MainScreen: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Weather.WeeklyModel.mock.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let reusableCell = tableView.dequeueReusableCell(
            withIdentifier: cellId,
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
        weeklyTableView.configure(with: WeeklyTableView.Model(delegate: self, dataSource: self))
    }

}
