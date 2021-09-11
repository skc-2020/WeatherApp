//
//  SearchPage.swift
//  WeatherAppUITests
//
//  Created by AndUser on 05.09.2021.
//

import XCTest

class SearchPage: CommonPage {

    // MARK: - Initializers

    init(app: XCUIApplication) {
        super.init(
            view: app.otherElements["SearchView"],
            app: app
        )
    }

    // MARK: - UI Elements

    private lazy var searchField: XCUIElement = {
        view.searchFields.firstMatch
    }()

    // MARK: - Actions

    @discardableResult
    func tapSearchField() -> Self {
        searchField.tap()
        return self
    }

    // MARK: - Actions

    func verifySearchPageIsDisplayed() {
        XCTAssertTrue(view.exists == true)
    }
}
