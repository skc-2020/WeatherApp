//
//  MainPage.swift
//  WeatherAppUITests
//
//  Created by SKC on 05.09.2021.
//

import XCTest

class MainScreen: CommonScreen {

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

    private lazy var activityIndicator: XCUIElement = {
        view.images.element(boundBy: 0)
    }()

    // MARK: - Actions

    @discardableResult
    func tapSearchButton() -> Self {
        searchButton.tap()
        return self
    }

    // MARK: - Checks

    func checkActivityIndicatorDissapeared() {
        activityIndicator.waitForNotExistence()
    }
}
