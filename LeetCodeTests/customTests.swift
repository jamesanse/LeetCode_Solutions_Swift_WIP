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
    
    func testPascalsTriangle() {
       let numRow = 5
       let algorithm = PascalsTriangle()
       let result = algorithm.generate(numRow)
       XCTAssertEqual(result.count, 5)
    }
 
    func testPascalsTriagnle2() {
        let numRow = 5
        let algorithm = PascalsTriangle2()
        let result = algorithm.getRow(numRow)
       XCTAssertEqual(result, [1,2,1])
    }
    
    func testAddingLinkedList() {
        let list1 = ListNode(1)
        list1.next = ListNode(8)
        
        let list2 = ListNode(0)
        list2.addTwoNumbers(list1, list2)
        XCTAssert(true)
        
    }
    
    func testAddTwoNumbers2() {
        let list1 = ListNode(7)
        list1.next = ListNode(2)
        list1.next?.next = ListNode(4)
        list1.next?.next?.next = ListNode(3)
        let list2 = ListNode(5)
        list2.next = ListNode(6)
        list2.next?.next = ListNode(4)
        list2.addTwoNumbersTwo(list1, list2)
        XCTAssert(true)
        
    }
    
    func testValidParenthese() {
        let testCase = "()"
        let algo = ValidParenthese()
        let res = algo.isValid(testCase)
        XCTAssert(res)
        
    }
    
}
