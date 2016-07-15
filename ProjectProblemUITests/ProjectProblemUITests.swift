//
//  ProjectProblemUITests.swift
//  ProjectProblemUITests
//
//  Created by Avi Cohen on 13/7/16.
//
//

import XCTest

class ProjectProblemUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments.append("-test")
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBrowsing() {
        let app = XCUIApplication()
        app.navigationBars["Root"].staticTexts["Root"].tap()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["a"].tap()
        tablesQuery.staticTexts["red.plist"].tap()
        app.navigationBars["red.plist"].buttons["a"].tap()
        tablesQuery.staticTexts["yellow.xcassets"].tap()
        app.navigationBars["yellow.xcassets"].buttons["a"].tap()
    }
    
}
