//
//  EasyMiscPartTwo.swift
//  LeetCode
//
//  Created by James An on 24/03/2017.
//  Copyright © 2017 James An. All rights reserved.
//

import Foundation

class PlusOne {
    //https://leetcode.com/problems/plus-one/#/description
    //beats 87.5%
    func plusOne(_ digits: [Int]) -> [Int] {
        var res = digits
        if digits.first! == 0 {
           return [1]
        }
        var index = digits.count - 1
        var carry = 1
        while index >= 0 {
            let lastSignificantInt = res[index]
            if (lastSignificantInt + carry <= 9) {
                res[index] = lastSignificantInt + 1
                return res
            } else {
                let reminder = lastSignificantInt + carry - 10
                carry = 1
                res[index] = reminder
            }
            index -= 1
        }
        if carry > 0 {
           res.insert(1, at: 0)
        }
       
        return res
    }
}

class PascalsTriangle {
    //https://leetcode.com/problems/pascals-triangle/#/description
    //beats 93%!!
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 {
           return [[Int]]()
        }
        var res = [[Int]]()
        for i in 0..<numRows {
            if i == 0 {
               res.append([1])
            } else if i == 1 {
               res.append([1,1])
            } else {
               //sum is the two cell right above it
                var row = [Int]()
                let previousRow = res[i-1]
                for cellIndex in 0...i {
                    if cellIndex == 0 {
                       row.append(1)
                    } else if cellIndex == i {
                       row.append(1)
                    } else {
                       let result = previousRow[cellIndex - 1] + previousRow[cellIndex]
                       row.append(result)
                    }
                }
                res.append(row)
            }
        }
        return res
    }
}

class NumberOfSegmentsInAString {
    func countSegments(_ s: String) -> Int {
        if s == "" {
            return 0
        } else {
            var res = 0
            let a = s.components(separatedBy: " ")
            for string in a {
                if string != "" {
                   res += 1
                }
            }
            return res
        }
    }
}

class ArrangingCoins {
   //https://leetcode.com/problems/arranging-coins/#/description
    func arrangeCoins(_ n: Int) -> Int {
        var res = 0
        var stair = 1
        var coins = n
        while coins >= stair {
           coins -= stair
           stair += 1
           res += 1
        }
        return res
    }
}

class PascalsTriangle2 {
   //https://leetcode.com/problems/pascals-triangle-ii/#/description
    func getRow(_ rowIndex: Int) -> [Int] {
        
    }
    
}

