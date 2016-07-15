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
//        app.launchArguments.append("-test")
//        app.launchArguments.append("true")
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testExample() {
//        let app = XCUIApplication()
//        let element = app.staticTexts["Root View"]
//        self.waitForElementToAppear(element)
//    }
    
    func waitForElementToAppear(element: XCUIElement, timeout: NSTimeInterval = 5,  file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        expectationForPredicate(existsPredicate,
                                evaluatedWithObject: element, handler: nil)
        
        waitForExpectationsWithTimeout(timeout) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailureWithDescription(message, inFile: file, atLine: line, expected: true)
            }
        }
    }
    
    func testBrowsing() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Base.lproj"].tap()
        tablesQuery.staticTexts["LaunchScreen.storyboardc"].tap()
        tablesQuery.staticTexts["01J-lp-oVM-view-Ze5-6b-2t3.nib"].tap()
        app.navigationBars["01J-lp-oVM-view-Ze5-6b-2t3.nib"].buttons["Back"].tap()
        app.navigationBars["LaunchScreen.storyboardc"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        app.navigationBars["Base.lproj"].buttons["Root"].tap()
        tablesQuery.staticTexts["Frameworks"].tap()
        tablesQuery.staticTexts["IDEBundleInjection.framework"].tap()
        tablesQuery.staticTexts["_CodeSignature"].tap()
        
    }
    
}
