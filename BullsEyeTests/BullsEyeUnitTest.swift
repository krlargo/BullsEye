//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Kevin Largo on 12/15/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    
    var gameUnderTest: BullsEyeGame!
    
    override func setUp() {
        super.setUp()
        
        // Declare new instance at the start of each test
        gameUnderTest = BullsEyeGame();
        gameUnderTest.startNewGame();
    }
    
    override func tearDown() {
        super.tearDown()
        
        gameUnderTest = nil; // Remove instance at the end of each test
    }
    
    // MARK: - Tests
    func testScoreIsComputedWhenLTTarget() {
        let guess = gameUnderTest.targetValue - 5;
        _ = gameUnderTest.check(guess: guess);
        XCTAssertEqual(gameUnderTest.scoreRound, 95);
    }
    
    func testScoreIsComputedWhenGTTarget() {
        let guess = gameUnderTest.targetValue + 5;
        _ = gameUnderTest.check(guess: guess);
        XCTAssertEqual(gameUnderTest.scoreRound, 95);
    }
}

