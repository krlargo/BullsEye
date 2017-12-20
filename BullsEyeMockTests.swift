//
//  BullsEyeMockTests.swift
//  BullsEyeTests
//
//  Created by Kevin Largo on 12/19/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class MockUserDefaults: UserDefaults {
    var gameStyleChanged = 0;
    override func set(_ value: Int, forKey defaultName: String) {
        if(defaultName == "gameStyle") {
            gameStyleChanged += 1;
        }
    }
}

class BullsEyeMockTests: XCTestCase {
    
    var controllerUnderTest: ViewController!
    var mockDefaults: MockUserDefaults!
    
    override func setUp() {
        super.setUp()
        
        controllerUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController!;
        mockDefaults = MockUserDefaults(suiteName: "testing");
        controllerUnderTest.defaults = mockDefaults;
    }
    
    override func tearDown() {
        
        controllerUnderTest = nil;
        mockDefaults = nil;
        super.tearDown()
    }
    
    func testGameStyleCanChange() {
        /// Implement fake segmentedControl
        let segmentedControl = UISegmentedControl();
        
        /// Should be initialized at 0
        XCTAssertEqual(mockDefaults.gameStyleChanged, 0, "gameStyleChanged should be 0 before sendActions");
        segmentedControl.addTarget(controllerUnderTest, action: #selector(ViewController.chooseGameStyle(_:)), for: .valueChanged);
        segmentedControl.sendActions(for: .valueChanged); /// Change value
        
        XCTAssertEqual(mockDefaults.gameStyleChanged, 1, "gameStyle user default wasn't changed");
    }
}
