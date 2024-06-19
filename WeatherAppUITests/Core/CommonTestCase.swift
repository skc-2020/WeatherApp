//
//  CommonTestCase.swift
//  WeatherAppUITests
//
//  Created by SKC on 05.09.2021.
//

import XCTest

class CommonTestCase: XCTestCase {

    let application = XCUIApplication()

    override func setUp() {
        super.setUp()

        addUIInterruptionMonitor(withDescription: "Allow") { alert in
            if alert.buttons["Allow Once"].exists {
                alert.buttons.element(boundBy: 1).tap()
                return true
            }
            return false
        }

        executionTimeAllowance = 420
        continueAfterFailure = false
    }
    
}
