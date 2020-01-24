//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testTableViewThreadCreated() {
        let text = app.textFields["MessageTableViewControllerTextField"]
        text.tap()
        text.typeText("Testing")
        app.keyboards.buttons["Return"].tap()
        
        let tableRow = app.tables.staticTexts["Testing"]
        XCTAssertTrue(tableRow.exists)
    }
    
    func testCreatingANewMessage() {
        let messageTextField = app.textFields["MessageTableViewControllerTextField"]
        messageTextField.tap()
        messageTextField.typeText("Testing")
        app.keyboards.buttons["Return"].tap()
        
        let tableRow = app.tables.staticTexts["Testing"]
        XCTAssertTrue(tableRow.exists)
        
        tableRow.tap()
        XCTAssert(app.navigationBars["Testing"].exists)
        
        app.navigationBars["Testing"].buttons["Add"].tap()
        XCTAssert(app.navigationBars["New Message"].exists)
        
        let messageDetialTextField = app.textFields["DetialTextField"]
        XCTAssert(messageDetialTextField.exists)
        
        let messageDetailTextView = app.textViews["DetialTextView"]
        XCTAssert(messageDetailTextView.exists)
        
        let buttonSend = app.navigationBars["New Message"].buttons["Send"]
        XCTAssert(buttonSend.exists)
        
        buttonSend.tap()
        
    }
    
    
    
}
