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
    
    
  }



