//
//  XCUIElementExtension.swift
//  WeatherAppUITests
//
//  Created by AndUser on 07.09.2021.
//

import XCTest

enum XCUIElementEvent: String {
    case enabled = "enabled == true"
    case exists = "exists == true"
    case existsAndEnabled = "exists == true AND enabled == true"
    case hidden = "exists == false"
    case disabled = "exists == true AND enabled == false"
    case hittable = "isHittable == true"
}

extension XCUIElement {

    @discardableResult
    func wait(for event: XCUIElementEvent = .exists, time: TimeInterval = 10) -> XCUIElement {
        let expectation = makeWaitExpectation(event: event)
        let waitResult = XCTWaiter.wait(for: [expectation], timeout: time)

        XCTAssertTrue(waitResult == .completed, "Event '\(event.rawValue)' for \(self) did not happen")

        return self
    }

    private func makeWaitExpectation(event: XCUIElementEvent) -> XCTNSPredicateExpectation {
        let predicate = NSPredicate(format: event.rawValue)
        return XCTNSPredicateExpectation(predicate: predicate, object: self)
    }

    @discardableResult
    func isVisible() -> Bool {
        guard self.waitForAppear(timeout: 10) && !self.frame.isEmpty else {
            return false
        }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }

    @discardableResult
    func waitForAppear(
        timeout: TimeInterval = 6,
        checkFrequency: TimeInterval = 0.1,
        checkIfAppeared: Bool = true
    ) -> Bool {
        if exists == checkIfAppeared {
             return checkIfAppeared
        }
        return
            waitForExpression(
                timeout: timeout,
                checkFrequency: checkFrequency,
                exists == checkIfAppeared
            )
    }

    @discardableResult
    func waitForHittable(
        timeout: TimeInterval = 10,
        checkFrequency: TimeInterval = 0.5,
        checkIfHittable: Bool = true
    ) -> Bool {
        if isHittable == checkIfHittable {
            return checkIfHittable
        }
        return waitForExpression(
            timeout: timeout,
            checkFrequency: checkFrequency,
            isHittable == checkIfHittable
        )
    }

    func waitForEnabled(
        timeout: TimeInterval = 10,
        checkFrequency: TimeInterval = 0.5,
        checkIfEnabled: Bool = true
    ) -> Bool {
        if isEnabled == checkIfEnabled {
            return true
        }
        return waitForExpression(
            timeout: timeout,
            checkFrequency: checkFrequency,
            isEnabled == checkIfEnabled
        )
    }

    func scrollToElement(element: XCUIElement, scrollUp: Bool = true, maxSwipe: Int = 5) {
        var swipes = maxSwipe
        while !element.exists, swipes != 0 {
            if scrollUp {
                swipeUp()
            }
            else {
                swipeDown()
            }
            swipes -= 1
        }

        XCTAssertTrue(swipes != 0)
    }

    func waitForExpression(
        timeout: TimeInterval = 10,
        checkFrequency: TimeInterval = 0.01,
        _ expression: @autoclosure () -> Bool
    ) -> Bool {
        let startDate = NSDate()
        var success = false
        while !success && abs(startDate.timeIntervalSinceNow) < timeout {
            RunLoop.current.run(
                until: Date(timeIntervalSinceNow: checkFrequency)
            )
            success = expression()
        }
        return success
    }

    func checkExistence(
        _ isExists: Bool = true,
        timeout: TimeInterval = 7
    ) {
        if exists == isExists {
            return
        }
        _ = isExists ?
            wait(for: .exists, time: timeout) :
            wait(for: .hidden, time: timeout)
    }

}
