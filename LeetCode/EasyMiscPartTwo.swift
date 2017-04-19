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
    //beats 58.3%
    func getRow(_ rowIndex: Int) -> [Int] {
        var res = [1]
        if rowIndex > 0 {
            for n in 1...rowIndex {
                if n == 1 {
                    res.append(1)
                } else {
                    for i in 0...n {
                        if i == 0 {
                            res.append(1)
                        } else if i == n{
                            res.append(1)
                            for _ in 0..<n {
                               res.remove(at: 0)
                            }
                            
                        } else {
                            let ans = res[i] + res[i-1]
                            res.append(ans)
                        }
                    }
                }
            }
        }
        return res
    }
    
}

class RemoveDuplicatesFromSortedArray {
    //https://leetcode.com/problems/remove-duplicates-from-sorted-array/#/description
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let originalLength = nums.count
        if nums.count <= 1 {
            return originalLength
        }
    
        for i in 0..<originalLength {
            if i < originalLength - 1 && nums[i] < nums[i + 1] {
                nums.append(nums[i])
            } else if i == originalLength - 1 {
                nums.append(nums[i])
            }
        }
        nums = Array<Int>(nums.dropFirst(originalLength))
        return nums.count
    }
}

class TrailingZeros {
   //https://leetcode.com/problems/factorial-trailing-zeroes/#/description
    func trailingZeroes(_ n: Int) -> Int {
        var res = 0
        var copy = n
        while copy > 0 {
            copy = copy/5
            res += copy
        }
        return res
    }

}

class PalindromeNumber {
    //https://leetcode.com/problems/palindrome-number/#/description
    func isPalindrome(_ x: Int) -> Bool {
        
        func countDigit(x:Int) -> Int {
            var i = x
            var res = 0
            while i > 0 {
                i = i/10
                res += 1
            }
            return res
        }
        if x < 0 {
           return false
        } else {
           var copy = x
           var newNumber = 0
           let digits = countDigit(x: x)
           for i in 0...digits {
               let remainder = x % 10
               newNumber += remainder * Int(powf(10, Float(digits-i)))
               copy = copy / 10
           }
            
           return digits == x
        }
    }
}

