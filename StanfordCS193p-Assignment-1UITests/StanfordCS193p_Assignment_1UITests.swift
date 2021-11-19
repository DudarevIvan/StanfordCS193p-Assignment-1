//
//  StanfordCS193p_Assignment_1UITests.swift
//  StanfordCS193p-Assignment-1UITests
//
//  Created by Ivan Dudarev on 19.11.2021.
//

import XCTest

class StanfordCS193p_Assignment_1UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Application
        let app = XCUIApplication()
        app.launch() // Start App
        
        var firstEmoji = app.staticTexts.element(boundBy: 4).label

        // Vehicles
        let vehiclesButton = app.buttons["Vehicles"]
        vehiclesButton.tap()
        // Assertion
        XCTAssertNotEqual(firstEmoji, app.staticTexts.element(boundBy: 4).label)
        firstEmoji = app.staticTexts.element(boundBy: 4).label
        
        // Nature
        let natureButton = app.buttons["Nature"]
        natureButton.tap()
        // Assertion
        XCTAssertNotEqual(firstEmoji, app.staticTexts.element(boundBy: 4).label)
        firstEmoji = app.staticTexts.element(boundBy: 4).label
        
        // Weather
        let weatherButton = app.buttons["Weather"]
        weatherButton.tap()
        // Assertion
        XCTAssertNotEqual(firstEmoji, app.staticTexts.element(boundBy: 4).label)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
