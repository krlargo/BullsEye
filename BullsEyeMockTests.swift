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
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
