//
//  BullsEyeUITests.swift
//  BullsEyeUITests
//
//  Created by Kevin Largo on 12/19/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest

class BullsEyeUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
  
        app = XCUIApplication();
        app.launch();
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameStyleSwitch() {
        // Given
        let slideButton = app/*@START_MENU_TOKEN@*/.segmentedControls.buttons["Slide"]/*[[".segmentedControls.buttons[\"Slide\"]",".buttons[\"Slide\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/;
        let typeButton = app.segmentedControls.buttons["Type"];
        
        let slideLabel = app.staticTexts["Get as close as you can to: "];
        let typeLabel = app.staticTexts["Guess where the slider is: "];
        
        /// If slideSegment selected, only slideLabel should be visible
        if(slideButton.isSelected) {
            XCTAssertTrue(slideLabel.exists);
            XCTAssertFalse(typeLabel.exists);
        }
        /// Vice-versa for typeSegment
        else if(typeButton.isSelected) {
            XCTAssertTrue(typeLabel.exists);
            XCTAssertFalse(slideLabel.exists);
        }
        
        /// On tap, slideLabel should exist and typeLabel shouldn't
        slideButton.tap();
        XCTAssertTrue(slideLabel.exists);
        XCTAssertFalse(typeLabel.exists);
    }
    
}
