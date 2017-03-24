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
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //https://leetcode.com/problems/merge-two-sorted-lists/#/description
        if l1 == nil && l2 == nil {
           return nil
        } else if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1;
        }
        var head1 = l1;
        var head2 = l2;
        var startingNode: ListNode!
        if (head1?.val)! > (head2?.val)! {
           startingNode = head2
           head2 = head2?.next
        } else {
           startingNode = head1
           head1 = head1?.next
        }
        let res = startingNode
        
        while head1 != nil && head2 != nil {
            if (head1?.val)! < (head2?.val)! {
                startingNode.next = head1
                startingNode = startingNode.next
                head1 = head1?.next
            } else {
                startingNode.next = head2
                startingNode = startingNode.next
                head2 = head2?.next
            }
        }
        
        if let remainingHead1 = head1 {
           startingNode.next = remainingHead1
        }
        
        if let remainingHead2 = head2 {
            startingNode.next = remainingHead2
        }
        
        return res
    }
    
    
  }

