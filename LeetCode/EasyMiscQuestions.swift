//
//  PowerOfTwo.swift
//  LeetCode
//
//  Created by James An on 1/5/17.
//  Copyright © 2017 James An. All rights reserved.
//

import Foundation


class PowerOfTwo {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        return (n & (n-1)) == 0
    }
}

class FizzBuzz {
    
    func fizzBuzz(_ n: Int) -> [String] {
        var result = [String]()
        for i in 1...n {
            if i%3 == 0 && i%5 == 0{
                print("FizzBuzz")
                result.append("FizzBuzz")
            } else if i%5 == 0 {
                print("Buzz")
                result.append("Buzz")
            } else if i%3 == 0 {
                print("Fizz")
                result.append("Fizz")
            } else {
                print("\(i)")
                result.append("\(i)")
            }
        }
        return result
    }
}

class ReverseString {
    func reverseString(_ s: String) -> String {
        var result = ""
        for characterOffset in 0..<s.characters.count {
            let charIndex =  s.index(s.startIndex, offsetBy: s.characters.count - 1 - characterOffset)
            let char = s[charIndex]
            result.append(char)
        }
        return result
    }
}


class IslandPerimeter {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var sides = 0
        for column in 0..<grid.count {
            for row in 0..<grid[column].count {
                if grid[column][row] == 1 {
                    var newSides = 4
                    //check previous row
                    if row != 0, grid[column][row-1] == 1{
                       newSides = newSides - 1
                    }
                    //check next row
                    if row < grid[column].count - 1, grid[column][row+1] == 1  {
                       newSides = newSides - 1
                    }
                    //check upper column
                    if column != 0, grid[column-1][row] == 1{
                       newSides = newSides - 1
                    }
                    //check bottom colum
                    if column < grid.count - 1, grid[column+1][row] == 1{
                       newSides = newSides - 1
                    }
                    sides = sides + newSides
                }
            }
        }
        return sides
    }
}


class FindDisappearedNumbers {
    
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        
        if nums.count <= 1 {
          return nums
        }
        //instantiate empty arrow populated with all 0s
        var results = Array(repeating: 0, count: nums.count)
        var returnValues = [Int]()
        for i in 0..<results.count {
            let element = nums[i]
            if results[element-1] != element  {
               results[element-1] = element
            }
        }
        
        for i in 0..<results.count {
            if results[i] == 0 {
               returnValues.append(i+1)
            }
        }
        
        return returnValues
    }
}

class NimStone {
    class func canWinNim(_ n: Int) -> Bool {
        return n % 4 != 0
    }
}

class SingleNumber {
    //using xor can be a better solution (A ^ A = 0 and A ^ B ^ A = B),https://leetcode.com/problems/single-number/
    func singleNumber(_ nums: [Int]) -> Int {
        var dictionary = [Int:Int]()
        for i in 0..<nums.count {
            if let _ = dictionary[nums[i]] {
               dictionary[nums[i]] = dictionary[nums[i]]! + 1
            } else {
               dictionary[nums[i]] = 1
            }
        }
        for (key,value) in dictionary {
            if (value == 1) {
               return key
            }
        }
        return 0
    }
}

class SumOfTwoNumber {
    func getSum(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
           return a
        }
        let carry = (a & b)<<1
        let sum = a ^ b
        return getSum(sum, carry)
    }
}

class AddDigits {
    func addDigits(_ num: Int) -> Int {
        if num < 10 {
           return num
        }
        var copy = num
        var newResult = 0
        while copy >= 10 {
            let modulo = copy%10
            newResult = newResult + modulo
            copy = (copy - modulo) / 10
        }
        newResult = newResult + copy
        return addDigits(newResult)
    }
}

class MoveZeros {
    func moveZeroes(_ nums: inout [Int]) {
        var index = 0
        var sortedIndex = 0
        while index < nums.count  {
            if nums[index] != 0 {
                nums.insert(nums[index], at: sortedIndex)
                nums.remove(at: index + 1)
                sortedIndex = sortedIndex + 1
            }
            index = index + 1
        }
    }
}

class AssignCookies {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var contentChilder = 0
        let cookieCopy = s.sorted()
        let childrenCopy = g.sorted()
        var cookieIndex = 0
        var childIndex = 0
        
        while cookieIndex < cookieCopy.count && childIndex < childrenCopy.count {
            if cookieCopy[cookieIndex] >= childrenCopy[childIndex] {
                cookieIndex = cookieIndex + 1
                childIndex = childIndex + 1
                contentChilder = contentChilder + 1
            } else {
                cookieIndex = cookieIndex + 1
            }
        
        }
        return contentChilder
    }
}

class RansomNote {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var hash = [Character:Int]()
        for char in magazine.characters {
            if let count = hash[char] {
                hash[char] = count + 1
            } else {
                hash[char] = 1
            }
        }
        
        for char in ransomNote.characters {
            if let count = hash[char] {
                if count == 0 {
                   return false
                }
                hash[char] = count - 1
            } else {
               return false
            }
        }
        return true
    }
}

class Intersection {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var res = [Int]()
        var hash = [Int:Int]()
        
        for i in nums1 {
            if let value = hash[i] {
               hash[i] = value + 1
            } else {
               hash[i] = 1
            }
        }
        
        for k in nums2 {
            if let value = hash[k], value > 0 {
                hash[k] = 0
                res.append(k)
            }
        
        }
        
        return res
    }
}

class MiminumMovesToEqualArrayElements {
    
    func minMoves(_ nums: [Int]) -> Int {
        
        if nums.count <= 1 {
           return 0
        }
        var moves = 0
        var min: Int!
        
        for num in nums {
            if min == nil {
               min = num
            } else if num < min {
               min = num
            }
        }
        
        for num in nums {
            moves = moves + num - min
        }
        return moves
    }
    
}

class FirstUniqueCharacterInAString {
   //using frequency array of 26 or 256 seems to be a better solution
   func firstUniqChar(_ s: String) -> Int {
        if s.characters.count == 0 {
            return -1
        }
        var hash = [Character:Int]()
        
        for character in s.characters {
            if let count = hash[character] {
               hash[character] = count + 1
            } else {
               hash[character] = 1
            }
        }
        
        for (index, char) in s.characters.enumerated() {
            if hash[char] == 1 {
               return index
            }
        }
        return -1
    }
    
}

class ExcelSheetColumnNumber {
    // a better solution that goes from the head to tail works better
    func titleToNumber(_ s: String) -> Int {
        let table = [" ","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        let multiplier = 26
        var res = 0
        for (index, char) in s.characters.reversed().enumerated() {
            var temp = 1
            var indexCopy = index
            while indexCopy > 0 {
                temp = temp * multiplier
                indexCopy = indexCopy - 1
            }
            
            res = temp * table.index(of: String(char))! + res
        }
        return res
    }
}

class IsAnagram {
    //using array will also work
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var hash = [Character:Int]()
        for char in s.characters {
            hash[char] = hash[char] == nil ? 1 : hash[char]! + 1
        }
        for char in t.characters {
            if let count = hash[char], count >= 1 {
               hash[char] = count - 1
            } else {
               return false
            }
        }
        
        for value in hash.values {
            if value != 0 {
               return false
            }
        }
        
        return true
    }
}

class MajorityElement {
    func majorityElement(_ nums: [Int]) -> Int {
        let majority = nums.count/2
        var hash = [Int:Int]()
        for num in nums {
            hash[num] = hash[num] == nil ? 1: hash[num]! + 1
            if hash[num]! > majority {
               return num
            }
        }
        return 0
    }
}

class LongestPalindrome {
    func longestPalindrome(_ s: String) -> Int {
        var res  = 0
        var hash = [Character:Int]()
        for s in s.characters {
            hash[s] = hash[s] == nil ? 1 : hash[s]! + 1
        }
        
        for value in hash.values {
            if value != 0 {
               res = res + (value / 2)*2
            }
        }
        if res < s.characters.count {
           res = res + 1
        }
        
        return res
    }
}

class containsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var hash = [Int:Int]()
        for s in nums {
            hash[s] = hash[s] == nil ? 1 : hash[s]! + 1
        }
        for value in hash.values {
            if value > 1 {
                return true
            }
        }
        return false
    }
}

class NumberComplement {
    func findComplement(_ num: Int) -> Int {
        var copy = num
        var res = 0
        let mask = 1
        var muliplier: Float = 0
        while copy > 0 {
           let firstBit = (copy & mask) == 1 ? 0 : 1
           res = firstBit * Int(powf(2, muliplier)) + res
           copy = copy >> 1
           muliplier = muliplier + 1
        }
        return res
    }
}

class IntersectionOfArray {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var hash = [Int:Int]()
        var res = [Int]()
        for num in nums1 {
            hash[num] = hash[num] == nil ? 1 : hash[num]! + 1
        }
        for num in nums2 {
            if let count = hash[num],count > 0 {
                hash[num] = count - 1
                res.append(num)
            }
        }
        return res
    }
}

class BinaryWatch {
     func readBinaryWatch(_ num: Int) -> [String] {
        let hourMask = 0b1111000000
        let minuteMask = 0b0000111111
        func generateCountForNumberOfDigits( digits: Int, base: Int, indiceCount: Int, reversed: Bool) -> [Int] {
            var res = [Int]()
            if digits == 0 {
                if ((base & hourMask) >> 6  <= 11) && ((base & minuteMask) <= 59) {
                   res.append(base)
                }
            } else {
                for bitIndex in 0..<indiceCount {
                    if reversed {
                        if isBitSetAtIndex(index: bitIndex, number: base) {
                             let result  = turnOffBitAtIndex(index: bitIndex, number: base)
                            res.append(contentsOf: generateCountForNumberOfDigits(digits: digits - 1, base: result, indiceCount: 10, reversed: reversed))
                        }
                    } else {
                        if !isBitSetAtIndex(index: bitIndex, number: base) {
                            let result = turnOnBitAtIndex(index: bitIndex, number: base)
                            res.append(contentsOf: generateCountForNumberOfDigits(digits: digits - 1, base: result, indiceCount: 10, reversed: reversed))
                        }
                    }
                    
                    
                }
            }
            return res
        }
        
        func isBitSetAtIndex(index: Int, number: Int) -> Bool {
            let mask = 1
            return ((number >> index) & mask) == 1
        }
        
        func turnOnBitAtIndex(index: Int, number: Int) -> Int {
            let mask = 1 << index
            return number | mask
        }
        
        func turnOffBitAtIndex(index: Int, number: Int) -> Int {
            var mask = Int.max - 1
            for i in 0..<index {
                mask = (mask << 1 )+1
            }
            return number & mask
        }
        
        var res = [String]()
        var posibleValues = [Int]()
        if num == 0 {
            res.append("0:00")
        } else {
            if num > 5 {
            //insert zeros
               posibleValues = Array(Set<Int>(generateCountForNumberOfDigits(digits: 10 - num, base: 0b1111111111, indiceCount: 10, reversed: true)))
            }  else {
            //insert ones
               posibleValues = Array(Set<Int>(generateCountForNumberOfDigits(digits: num, base: 0, indiceCount: 10, reversed: false)))
            }
            
        }
        for time in posibleValues {
           let hours = (time & hourMask) >> 6
           let hoursString = "\(hours)"
           let minutes = time & minuteMask
           let minuteString =  minutes < 10 ? "0\(minutes)" : "\(minutes)"
           res.append(hoursString+":"+minuteString)
        }
        return res
    }
}

class RomanToInteger {
    
    func romanToInt(_ s: String) -> Int {
        let lookUp = ["I":1, "V":5, "X":10, "L":50,"C":100,"D":500,"M":1000]
        let letters = s.uppercased().characters.map { String($0) }
        var res = 0
        var index = 0
        while index < letters.count  {
            let char = letters[index]
            switch char {
            case "I":
                if index < letters.count - 1, letters[index + 1] == "V" {
                    res = res + 4
                    index = index + 1
                } else if index < letters.count - 1,letters[index + 1] == "X" {
                    res = res + 9
                    index = index + 1
                } else {
                    res = res + 1
                }
            case "X":
                if index < letters.count - 1,letters[index + 1] == "L" {
                    res = res + 40
                    index = index + 1
                } else if index < letters.count - 1,letters[index + 1] == "C" {
                    res = res + 90
                    index = index + 1
                } else {
                    res = res + 10
                }
            case "C":
                if index < letters.count - 1,letters[index + 1] == "D" {
                    res = res + 400
                    index = index + 1
                } else if index < letters.count - 1,letters[index + 1] == "M" {
                    res = res + 900
                    index = index + 1
                } else {
                    res = res + 100
                }
            case "V":
                res = res + lookUp["V"]!
            case "L":
                res = res + lookUp["L"]!
            case "M":
                res = res + lookUp["M"]!
            case "D":
                res = res + lookUp["D"]!
            default:
                break
            }
            index = index + 1
        }
        return res
    }
}

class AddString {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var res = String()
        let scalar1 = num1.unicodeScalars
        let scalar2 = num2.unicodeScalars
        var num1Index = scalar1.count-1
        var result = 0
        var num2Index = scalar2.count-1
        let zeroScalar = Int("0".unicodeScalars.first!.value)
        var carry = 0
        while num2Index >= 0 || num1Index >= 0 || carry > 0 {
            let num1Char = num1Index >= 0 ? Int(scalar1[scalar1.index(scalar1.startIndex, offsetBy: num1Index)].value) - zeroScalar : 0
            let num2Char = num2Index >= 0 ?Int(scalar2[scalar2.index(scalar2.startIndex, offsetBy: num2Index)].value) - zeroScalar : 0
            result = num2Char + num1Char + carry
            carry = result >= 10 ? 1 : 0
            let resultAtPosition = result >= 10 ? result % 10 : result
            let stringResult = String(resultAtPosition)
            res = stringResult + res
            num2Index = num2Index - 1
            num1Index = num1Index - 1
        }
        
        return res
    }
}


class DecimalToHex {
    func toHex(_ num: Int) -> String {
        var res = ""
        var numCopy = num
        let map = [10:"a",11:"b",12:"c",13:"d",14:"e",15:"f"]
        if numCopy == 0 {
          return "0"
        } else if numCopy > 0 {
            while numCopy > 0 {
               let result = numCopy % 16
               numCopy = numCopy / 16
               let numString = map[result] != nil ? map[result]! : "\(result)"
               res = "\(numString)" + res
            }
        } else {
            numCopy = abs(numCopy)
            var carry = 1
            for _ in 0..<8 {
                var result = (15 - numCopy % 16)+carry
                carry = result > 15 ? 1 : 0
                result = result == 16 ? 0 : result
                numCopy = numCopy/16
                let numString = map[result] != nil ? map[result]! : "\(result)"
                res = "\(numString)" + res
            }
        }
        return res
    }
}

class PowerOfThree {
    func isPowerOfThree(_ n: Int) -> Bool {
       if n <= 0 {
          return false
       }
       var copy = n
       while copy > 1 {
          let module = copy % 3
          if module > 0 {
           return false
          }
          copy = copy / 3
       }
        
        
       return true
    }
}

class TwoSum2 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var index1 = 0
        var index2 = 0
        var lastNumber = -1
        for (index, number) in numbers.enumerated() {
            let remaining = target - number
            if number != lastNumber {
                lastNumber = number
                if remaining >= number {
                    for i in index+1..<numbers.count {
                        if numbers[i] == remaining {
                            index1 = index + 1
                            index2 =  i + 1
                            break
                        }
                    }
                    
                } else {
                    for i in 0..<index {
                        if numbers[i] == remaining {
                            index1 = i + 1
                            index2 = index + 1
                            break
                        }
                    }
                    
                }
            }
            
        }
        return [index1,index2]
    }
    
}

class RectangleIntersection {
    func constructRectangle(_ area: Int) -> [Int] {
        if area == 0 {
            return [0,0]
        }
        
        var L = area
        var W = 1
        var divider = 2
        var pair = [L,W]
        while (area / divider >= divider) {
            let tempL = area / divider
            let tempW = divider
            if area % divider == 0 {
                if abs(tempL-tempW) < abs(L-W) {
                    L = tempL
                    W = tempW
                }
            }
            divider = divider + 1
        }
        return [L,W]
    }
}

class BestTimeToBuySellStocks {
    //https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii
    func maxProfit(_ prices: [Int]) -> Int {
        var res = 0
        if prices.count == 0 || prices.count == 1 {
           return 0
        }
        var index = 0
        while index < prices.count - 1 {
            res =  prices[index] < prices[index + 1] ? res + prices[index + 1] - prices[index] : res
            index = index + 1
        }
        
        return res
    }
    
}

class NextGreaterElement {
    //https://leetcode.com/problems/next-greater-element-i/
    func nextGreaterElement(_ findNums: [Int], _ nums: [Int]) -> [Int] {
        var res = [Int]()
        for number in findNums {
           var index = nums.index(of: number)!
           var nextGreaterNumber = -1
           while index < nums.count - 1 {
              index += 1
              if nums[index] > number {
                nextGreaterNumber = nums[index]
                break
              }
           }
           res.append(nextGreaterNumber)
        }
        return res
    }
    
}

class KeyboardRow {
    //https://leetcode.com/problems/keyboard-row/
    func findWords(_ words: [String]) -> [String] {
        var res = [String]()
        let map = ["q":1,"w":1,"e":1,"r":1,"t":1,"y":1,"u":1,"i":1,"o":1,"p":1,"a":2,"s":2,"d":2,"f":2,"g":2,"h":2,"j":2,"k":2,"l":2,"z":3,"x":3,"c":3,"v":3,"b":3,"n":3,"m":3]
        for word in words {
            let startingGroup = map[String(word.lowercased().characters.first!)]!
            inner : for (index, char) in word.lowercased().characters.enumerated() {
                if index != 0 {
                    if map[String(char)]! != startingGroup {
                       break inner
                    }
                }
                if index == word.characters.count - 1 {
                    res.append(word)
                }
            }
        }
        return res
    }
}
