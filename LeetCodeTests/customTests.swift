//
//  customTests.swift
//  LeetCode
//
//  Created by James An on 13/02/2017.
//  Copyright © 2017 James An. All rights reserved.
//

import XCTest

class customTests: XCTestCase {
    
    func testHappyNumber() {
       let happyNumber = HappyNumber()
       XCTAssertEqual(happyNumber.isHappy(2), false)
    }
    
    func testClimbingStairs() {
       let stairs = climbStairs()
       let steps = stairs.climbStairs(3)
        XCTAssertEqual(steps, 3)
    }
    
    func testReverseVowels() {
        let nums = "hello"
        let reverse = ReverseVowels()
        let reversed = reverse.reverseVowels(nums)
        XCTAssertEqual(reversed, "holle")
    }
    
    
    func testPerfectSquare() {
        let num = 808201
        let perfectSquare = PerfectValidSquare()
        let boo = perfectSquare.isPerfectSquare(num)
        XCTAssertEqual(boo, true)
    }
}
