//
//  Trees.swift
//  LeetCode
//
//  Created by James An on 1/6/17.
//  Copyright © 2017 James An. All rights reserved.
//

import Foundation


  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
      }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
           return 0
        }
        let distanceLeft = maxDepth(root?.left)
        let distanceRight = maxDepth(root?.right)
        return distanceLeft > distanceRight ? distanceLeft + 1: distanceRight + 1
    }
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        
        if root?.left == nil && root?.right == nil {
            return root
        }
        let invertedRight = invertTree(root?.left)
        let invertedLeft = invertTree(root?.right)
        root?.left = invertedLeft
        root?.right = invertedRight
        
        return root
    }
    
     func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        
        if root == nil {
           return 0
        }
        
        if let realRoot = root, let left = realRoot.left ,left.left == nil, left.right == nil  {
           return left.val + sumOfLeftLeaves(root?.right)
        }
        
        return sumOfLeftLeaves(root?.left) + sumOfLeftLeaves(root?.right)
        
    }
    
     func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        if p == nil && q == nil {
           return true
        }
        if p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
        return false
        
    }
    
    //https://leetcode.com/problems/find-mode-in-binary-search-tree/
    func findMode(_ root: TreeNode?) -> [Int] {
        
        if root == nil {
          return [Int]()
        }
        var res = [Int]()
        var hash = [Int:Int]()
        
        var queue = [TreeNode]()
        queue.insert(root!, at: 0)
        
        while !queue.isEmpty {
            let node = queue.last!
            hash[node.val] = hash[node.val] == nil ? 1 : hash[node.val]! + 1
            if let left = node.left {
               queue.insert(left, at: 0)
            }
            if let right = node.right {
               queue.insert(right, at: 0)
            }
            let _ = queue.popLast()
        }
        var max = 0
        for key in hash.keys {
            if let newMaxvalue = hash[key], newMaxvalue > max {
               res.removeAll()
               max = newMaxvalue
               res.append(key)
            } else if let sameValue = hash[key], sameValue == max {
               res.append(key)
            }
        }
        
        
        return res
    }
    
    //https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        var root : TreeNode!
        if nums.count == 0 {
           return nil
        } else {
            let middleIndex = nums.count / 2
            root = TreeNode(nums[middleIndex])
            if middleIndex < nums.count - 1 {
                root.right = sortedArrayToBST(Array(nums.suffix(from: middleIndex + 1)))
            }
            root.left  = sortedArrayToBST(Array(nums.prefix(upTo: middleIndex)))
            
            return root
        }
    }
    
    
  }



