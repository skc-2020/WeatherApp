//
//  SearchScreen.swift
//  WeatherApp
//
//  Created by SKC on 09.07.2021.
//

import UIKit

protocol SearchScreenInput: UIViewController {
    func reloadCitiesTableData()
    func reloadWeatherTableData()
    func configureTableView()
}

final class SearchScreen: BaseViewController {

    let cityCellId = CityCell.defaultReuseIdentifier
    let favCityCellId = FavouriteCityTableViewCell.defaultReuseIdentifier
    var showWeather = true

    private var cityList = [String]()
    private var sortedWeather = [Weather]()

    // MARK: - External Dependencies

    var output: SearchScreenOutput!
    var onSearchTextChange: ((String) -> Void)?

    // MARK: - Private Variables

    private let searchHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15

        return view
    }()

    private let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = DesignSystem.Colors.extraDarkGray

        return button
    }()

    private let searchTitle: UILabel = {
        let title = UILabel()
        title.text = "Weather"
        title.font = DesignSystem.Fonts.largeBold
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left

        return title
    }()

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Enter city, postcode or airport location", attributes: [
            NSAttributedString.Key.foregroundColor: DesignSystem.Colors.extraLightGray
        ])
        searchBar.searchTextField.textColor = DesignSystem.Colors.white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.layer.cornerRadius = 10
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = DesignSystem.Colors.extraDarkGray

//        searchBar.showsSearchResultsButton = true
//        searchBar.searchBarStyle = .prominent

        return searchBar
    }()

//    private let scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//
//        return scrollView
//    }()

    private let favouriteCityTableView = FavouriteCityTableView()

//    private let favouriteCityStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 20
//
//        return stackView
//    }()

    private let citiesTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = DesignSystem.Colors.lightBlack

        return table
    }()

    private var filteredCityList = [String]()

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupViewConstraints()
        setupSearchBarView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let cities: [String] = defaults.value(forKey: Saved.favouriteCitiesList.rawValue) as? [String] else {
            print("Error! Couldn't get the list of favourite cities from the UserDefaults")
            return
        }
        cityList = cities

//        setupView()
//        setupViewConstraints()
//        setupSearchBarView()
        configureTableView()
        cancelButton.addTarget(self,
                               action: #selector(cancelButtonTapped),
                               for: UIControl.Event.touchUpInside)
    }


}

// MARK: - Setup View

private extension SearchScreen {

    func setupView() {
        view.accessibilityIdentifier = "SearchView"
        searchBar.delegate = self

        view.addSubviews(
            searchHeaderView,
            cancelButton,
//            scrollView
            favouriteCityTableView
        )
//        scrollView.addSubview(favouriteCityStackView)
        searchHeaderView.addSubviews(
            searchTitle,
            searchBar
        )
    }

}

// MARK: - Setup Layout

private extension SearchScreen {

    //  swiftlint:disable function_body_length
    func setupViewConstraints() {
        searchHeaderView.pinTopEdge(to: .view(view), attribute: .top, constant: 40)
        searchHeaderView.pinLeadingEdge(to: .view(view), attribute: .leading, constant: 15)
        searchHeaderView.pinTrailingEdge(to: .view(view), attribute: .trailing, constant: -15)
        searchHeaderView.height(equalTo: 95)

//        scrollView.pinTopEdge(to: .view(searchHeaderView), attribute: .bottom)
//        scrollView.pinLeadingEdge(to: .view(view), attribute: .leading)
//        scrollView.pinTrailingEdge(to: .view(view), attribute: .trailing)
//        scrollView.pinBottomEdge(to: .view(view), attribute: .bottom)

        cancelButton.pinTopEdge(to: .view(searchTitle), attribute: .bottom, constant: 10)
        cancelButton.pinLeadingEdge(to: .view(searchBar), attribute: .trailing, constant: 10)
//        cancelButton.width(equalTo: UIScreen.main.bounds.width - 20)
        cancelButton.pinTrailingEdge(to: .view(view), attribute: .trailing, constant: -15)
        cancelButton.height(equalTo: 30)
//        cancelButton.pinBottomEdge(to: .view(view), attribute: .bottom)

        favouriteCityTableView.pinTopEdge(to: .view(searchHeaderView), attribute: .bottom, constant: 5)
        favouriteCityTableView.pinLeadingEdge(to: .view(view), attribute: .leading, constant: 10)
        favouriteCityTableView.width(equalTo: UIScreen.main.bounds.width - 20)
        favouriteCityTableView.pinBottomEdge(to: .view(view), attribute: .bottom)

        searchTitle.pinTopEdge(to: .view(searchHeaderView), attribute: .top, constant: 5)
        searchTitle.pinLeadingEdge(to: .view(searchHeaderView), attribute: .leading, constant: 60)
        searchTitle.pinTrailingEdge(to: .view(searchHeaderView), attribute: .trailing)
        searchTitle.height(equalTo: 30)

        searchBar.pinTopEdge(to: .view(searchTitle), attribute: .bottom, constant: 10)
        searchBar.pinLeadingEdge(to: .view(searchHeaderView), attribute: .leading, constant: 15)
        searchBar.pinTrailingEdge(to: .view(searchHeaderView), attribute: .trailing, constant: -85)
        searchBar.height(equalTo: 30)

//        favouriteCityStackView.pinTopEdge(to: .view(scrollView), attribute: .top, constant: 10)
//        favouriteCityStackView.pinLeadingEdge(to: .view(scrollView), attribute: .leading, constant: 10)
//        favouriteCityStackView.width(equalTo: UIScreen.main.bounds.width - 20)
//        favouriteCityStackView.pinBottomEdge(to: .view(scrollView), attribute: .bottom)
    }

}

// MARK: - SearchScreenInput

extension SearchScreen: SearchScreenInput {

    func configureTableView() {
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        favouriteCityTableView.delegate = self
        favouriteCityTableView.dataSource = self
        favouriteCityTableView.register(FavouriteCityTableViewCell.self)
        citiesTableView.register(CityCell.self)
        reloadCitiesTableData()
    }

//    func configureSearchScreen(with models: [Weather]) {
//        // MARK: current view
//        for model in models {
//            guard let mappedCurrentModel = Self.mapCurrentModel(model) else {
//                // TODO: add logging
//                print("Error, the weather model: '\(model)' couldn't be mapped.")
//                return
//            }
////            let favouriteCityView: FavouriteCityView = {
////                let view = FavouriteCityView()
////                view.backgroundColor = .white
////                view.layer.cornerRadius = 23
////                view.clipsToBounds = true
////
////                return view
////            }()
////
////            favouriteCityStackView.addArrangedSubview(favouriteCityView)
////            favouriteCityView.height(equalTo: 120)
////            favouriteCityView.configure(with: mappedCurrentModel)
////            favouriteCityView.tapCompletionHandler = { city in
////                self.output.showMainScreen(for: city)
////            }
////            favouriteCityView.swipeLeftCompletionHandler = { city in
////                self.output.removeView(for: city)
////            }
//
//        }
//    }

}

// MARK: - DataSource & Delegate

extension SearchScreen: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          removeCityAndWeather(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showWeather {
            let decodedWeather = defaults.loadObject(forKey: Saved.weatherForSearchScreen.rawValue, type: [Weather].self)
            sortedWeather = sortWeatherData(decodedWeather)

            return sortedWeather.count
        } else {
            return filteredCityList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if showWeather {
            let reusableCell = favouriteCityTableView.dequeueReusableCell(
                withIdentifier: favCityCellId, for: indexPath
            ) as? FavouriteCityTableViewCell
            guard let cell = reusableCell else { return UITableViewCell() }

            guard let mappedCurrentModel = Self.mapCurrentModel(sortedWeather[indexPath.row]) else {
                print("Error, the weather model: '\(sortedWeather[indexPath.row])' couldn't be mapped.")
                return UITableViewCell()
            }
            cell.configure(with: mappedCurrentModel)
            return cell
        } else {
            let reusableCell = citiesTableView.dequeueReusableCell(
                withIdentifier: cityCellId, for: indexPath
            ) as? CityCell
            guard let cell = reusableCell else { return UITableViewCell() }

            cell.backgroundColor = .black
            cell.configure(with: filteredCityList[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if showWeather {
            let city = sortedWeather[indexPath.row].timezone.components(separatedBy: "/")[1]
            defaults.set(city, forKey: Saved.cityForMainScreen.rawValue)
            self.output.showMainScreen(for: city)
        } else {
            onSearchTextChange?(filteredCityList[indexPath.row])
        }
    }

    func reloadCitiesTableData() {
        citiesTableView.reloadData()
    }

    func reloadWeatherTableData() {
        favouriteCityTableView.reloadData()
    }

    func removeCityAndWeather(at index: Int) {
        NSLog("The city: '\(cityList[index])' was deleted.")
        sortedWeather.remove(at: index)
        cityList.remove(at: index)
        defaults.save(sortedWeather, forKey: Saved.weatherForSearchScreen.rawValue)
        defaults.set(cityList, forKey: Saved.favouriteCitiesList.rawValue)
    }

    /**
     Alighning weather data with ORDERED cities list
     */
    func sortWeatherData(_ weatherArray: [Weather]) -> [Weather] {
        var sortedArray = [Weather]()
        for city in cityList {
            for index in 0..<weatherArray.count {
                guard let cityFromWeatherArray = weatherArray[index].timezone.components(separatedBy: "/")[safe: 1] else {
                    print("Error! Couldn't get city from weather array.")
                    return []
                }
                if cityFromWeatherArray == city {
                    sortedArray.append(weatherArray[index])
                }
            }
        }
        return sortedArray
    }

}

// MARK: - Button Actions

private extension SearchScreen {

    @objc
    func cancelButtonTapped() {
        citiesTableView.removeFromSuperview()
        view.reloadInputViews()
    }

}

// MARK: - UISearchBarDelegate

extension SearchScreen: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        showWeather = false

        view.addSubviews(citiesTableView)
        reloadCitiesTableData()

        citiesTableView.pinTopEdge(to: .view(searchHeaderView), attribute: .bottom, constant: -10)
        citiesTableView.pinLeadingEdge(to: .view(view), attribute: .leading, constant: 5)
        citiesTableView.pinTrailingEdge(to: .view(view), attribute: .trailing, constant: -5)
        citiesTableView.pinBottomEdge(to: .view(view), attribute: .bottom)

        guard let text = searchBar.text, searchBar.text?.isEmpty == false else {
            filteredCityList = output.getCityList()
            reloadCitiesTableData()
            return
        }
        filteredCityList = output.getCityList().filter {
            $0.localizedCaseInsensitiveContains(text)
        }
        reloadCitiesTableData()
    }

}

// MARK: - Search Bar extension

extension SearchScreen {

    func setupSearchBarView() {
        onSearchTextChange = { [weak self] cityName in
            self?.output?.showScreenWithFound(cityName)
        }
    }

}
