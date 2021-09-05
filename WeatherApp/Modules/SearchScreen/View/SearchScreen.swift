//
//  SearchScreen.swift
//  WeatherApp
//
//  Created by AndUser on 09.07.2021.
//

import UIKit

final class SearchScreen: BaseViewController {

    // MARK: - Private Variables

    private let weatherTitle: UILabel = {
        let title = UILabel()
        title.text = "Weather"
        title.font = DesignSystem.Fonts.boldLarge
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.backgroundColor = .green // delete

        return title
    }()

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search city"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.layer.cornerRadius = 10
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = .gray
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
        let placeholder = textFieldInsideSearchBar?.value(forKey: "placeholderLabel") as? UILabel
        placeholder?.textColor = .white // NOT WORKING !!!

        return searchBar
    }()

    private let cityWidget: UIView = { // make as separate component
        let cityView = UIView()
        cityView.translatesAutoresizingMaskIntoConstraints = false
 
        return cityView
    }()

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black // TODO: DELETE !!!

        setupView()
        setupViewConstraints()
    }

}

// MARK: - Setup View

private extension SearchScreen {

    func setupView() {
        view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubviews(
            weatherTitle,
            searchBar
        )
    }

}

// MARK: - Setup Layout

private extension SearchScreen {

    func setupViewConstraints() {
        weatherTitle.pinTopEdge(to: .view(view), attribute: .top, constant: 20)
        weatherTitle.pinLeadingEdge(to: .view(view), attribute: .leading, constant: 15)
        weatherTitle.pinTrailingEdge(to: .view(view), attribute: .trailing, constant: -15)
        weatherTitle.height(equalTo: 30)

        searchBar.pinTopEdge(to: .view(weatherTitle), attribute: .bottom, constant: 10)
        searchBar.pinLeadingEdge(to: .view(view), attribute: .leading, constant: 15)
        searchBar.pinTrailingEdge(to: .view(view), attribute: .trailing, constant: -15)
        searchBar.height(equalTo: 30)
    }

}
