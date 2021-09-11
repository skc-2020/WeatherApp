//
//  MainPage.swift
//  WeatherAppUITests
//
//  Created by AndUser on 05.09.2021.
//

import XCTest

class MainPage: CommonPage {

    // MARK: - Initializers

    init(app: XCUIApplication) {
        super.init(
            view: app.otherElements["MainView"],
            app: app
        )
    }

    // MARK: - UI Elements

    private lazy var searchButton: XCUIElement = {
        view.buttons.firstMatch
    }()

    // MARK: - Actions

    @discardableResult
    func tapSearchButton() -> Self {
        searchButton.tap()
        return self
    }

}
