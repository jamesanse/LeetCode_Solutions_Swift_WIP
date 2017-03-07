//
//  LinkedListQuestions.swift
//  LeetCode
//
//  Created by James An on 1/18/17.
//  Copyright © 2017 James An. All rights reserved.
//

import Foundation


  public class ListNode {
     public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
    
     func reverseList(_ head: ListNode?) -> ListNode? {
        
        var current: ListNode? = head
        var previous: ListNode? = nil
        var new: ListNode? = current?.next
        while current != nil {
            current?.next = previous
            previous = current
            if new != nil {
                current = new
                new = new?.next
            } else {
                return current
            }
        }
        return current
     }
    
     //https://leetcode.com/problems/remove-duplicates-from-sorted-list/
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var currentNode = head
        while currentNode?.next != nil {
            while currentNode?.val == currentNode?.next?.val {
                currentNode?.next = currentNode?.next?.next
            }
            currentNode = currentNode?.next
        }
        return head
    }
    
    
  }

