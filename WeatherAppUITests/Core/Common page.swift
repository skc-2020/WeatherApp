//
//  Common page.swift
//  WeatherAppUITests
//
//  Created by AndUser on 05.09.2021.
//

import XCTest

class CommonPage {

    let view: XCUIElement
    let app: XCUIApplication

    init(
        view: XCUIElement,
        app: XCUIApplication
    ) {
        self.view = view
        self.app = app
    }

    @discardableResult
    func wait(timeout: TimeInterval = 10) -> Self {
        view.wait(for: .exists, time: timeout)
        return self
    }
    
    @discardableResult
    func asyncWait(timeout: TimeInterval = 30) -> Self {
        view.checkExistence(timeout: timeout)
        return self
    }

    @discardableResult
    func waitFor(interval: TimeInterval = 0.05) -> Self {
        Thread.sleep(forTimeInterval: interval)
        return self
    }

}
