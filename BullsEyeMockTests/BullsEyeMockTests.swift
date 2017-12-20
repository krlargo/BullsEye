//
//  BullsEyeMockTests.swift
//  BullsEyeMockTests
//
//  Created by Kevin Largo on 12/19/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class MockUserDefaults: UserDefaults {
    var gameStyleChanged = 0
    override func set(_ value: Int, forKey defaultName: String) {
        if defaultName == "gameStyle" {
            gameStyleChanged += 1
        }
    }
}

class BullsEyeMockTests: XCTestCase {
    
    var controllerUnderTest: ViewController!
    var mockUserDefaults: MockUserDefaults!
    
    override func setUp() {
        super.setUp()
        
        // Setup a mock 'UserDefaults' that acts like the actual
        // (i.e. as a Dictionary)
        controllerUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController!;
        mockUserDefaults = MockUserDefaults(suiteName: "testing")!
        controllerUnderTest.defaults = mockUserDefaults;
        
    }
    
    override func tearDown() {
        controllerUnderTest = nil;
        mockUserDefaults = nil;
        
        super.tearDown();
    }
}
