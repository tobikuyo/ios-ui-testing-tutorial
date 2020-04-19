//
//  UITestingTutorialUITests.swift
//  UITestingTutorialUITests
//
//  Created by Tobi Kuyoro on 19/04/2020.
//  Copyright © 2020 Code Pro. All rights reserved.
//

import XCTest

class UITestingTutorialUITests: XCTestCase {
    
    func testValidLoginSuccess() {
        let validPassword = "abc123"
        let validUsername = "CodePro"
        
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        
        let usernameTextField = app.textFields["Username"]
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        usernameTextField.typeText(validUsername)
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let downloadsCell = app.tables.staticTexts["My Downloads"]
        
       expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: downloadsCell, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
}
