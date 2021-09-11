//
//  MainScreenTests.swift
//  WeatherAppUITests
//
//  Created by AndUser on 05.09.2021.
//

import XCTest

class MainScreenTests: CommonTestCase {

    func testSearchPageAppeared() {
        application.launch()

        MainPage(app: application)
            .tapSearchButton()
        SearchPage(app: application)
            .verifySearchPageIsDisplayed()
    }

}
