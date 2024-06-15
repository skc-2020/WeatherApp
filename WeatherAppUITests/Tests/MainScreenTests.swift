//
//  MainScreenTests.swift
//  WeatherAppUITests
//
//  Created by SKC on 05.09.2021.
//

import XCTest

class MainScreenTests: CommonTestCase {

    func testMainScreenisFullyLoaded() {
        application.launch()

        MainScreen(app: application)
            .checkActivityIndicatorDissapeared()
        sleep(4)
    }

    func testSearchScreenAppeared() {
        application.launch()

        MainScreen(app: application)
            .tapSearchButton()
        SearchPage(app: application)
            .verifySearchPageIsDisplayed()
    }

}
