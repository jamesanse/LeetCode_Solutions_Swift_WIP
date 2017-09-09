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
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //https://leetcode.com/problems/add-two-numbers/#/description
        //beats 66%
        var copyl1 = l1
        var copyl2 = l2
        var overflow = 0
        var newNode : ListNode?
        var head : ListNode?
        while (copyl1 != nil || copyl2 != nil) {
            let val1 = copyl1?.val ?? 0
            let val2 = copyl2?.val ?? 0
            var res = val1 + val2 + overflow
            if res >= 10 {
                res -= 10
                overflow = 1
            } else {
                overflow = 0
            }
            if (newNode == nil) {
               newNode = ListNode(res)
               head = newNode
            } else {
               newNode?.next = ListNode(res)
               newNode = newNode?.next
            }
            if copyl1?.next != nil {
               copyl1 = copyl1?.next
            } else {
               copyl1 = nil
            }
            if copyl2?.next != nil {
               copyl2 = copyl2?.next
            } else {
               copyl2 = nil
            }
            
        }
        if(overflow == 1){
            newNode?.next = ListNode(1)
        }
        
        return head
    }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        //https://leetcode.com/problems/remove-nth-node-from-end-of-list/#/description
        //beats 59%
        if n == 0 {
          return head
        }
        let sentienel : ListNode? = ListNode(0)
        sentienel?.next = head
        
        var fast = sentienel
        var slow = sentienel
        var pass = n
        while pass != 0 {
            pass -= 1
            fast = fast?.next
        }
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        if(slow?.next === head) {
           return head?.next
        }
        slow?.next = slow?.next?.next
        return sentienel?.next
    }
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        //https://leetcode.com/problems/remove-linked-list-elements/#/description
        var copy = head
        var senteniel = ListNode(val - 1)
        let head = senteniel
        while copy != nil {
            if copy?.val != val {
                senteniel.next = ListNode(copy!.val)
                senteniel = senteniel.next!
            }
            copy = copy?.next
        }
        return head.next
    }
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        //https://leetcode.com/problems/swap-nodes-in-pairs/#/description
        //beats 80%
        if (head == nil) {
           return nil
        } else if (head?.next == nil) {
           return head
        }
        let secondNode = head?.next!
        head?.next = nil
        let remainder = secondNode?.next
        secondNode?.next = head
        let newHead = secondNode
        newHead?.next?.next = swapPairs(remainder)
        return newHead
    }
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        //https://leetcode.com/problems/rotate-list/#/description
        //dont really understand this question
        return nil
    }
    
    func addTwoNumbersTwo(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //https://leetcode.com/problems/add-two-numbers-ii/#/description
        var array = [Int]()
        var array2 = [Int]()
        var resultNode: ListNode?
        var head1 = l1
        var head2 = l2
        if l1 == nil && l2 == nil {
            return nil
        } else if l1 == nil && l2 != nil {
            return l2
        } else if l1 != nil && l2 == nil {
            return l1
        }
        while let val = head1?.val {
            array.append(val)
            head1 = head1?.next
        }
        while let val = head2?.val {
            array2.append(val)
            head2 = head2?.next
        }
        var carry = 0
        while !array.isEmpty && !array2.isEmpty {
            var res = array2.last! + array.last! + carry
            carry = res > 9 ? 1 : 0
            res -=  res > 9 ? 10 : 0
            array2.removeLast(1)
            array.removeLast(1)
            if let lastNode = resultNode {
                let newNode = ListNode(res)
                newNode.next = lastNode
                resultNode = newNode
            } else {
                resultNode = ListNode(res)
            }
        }
        var remainingValues = [Int]()
        if !array.isEmpty || !array2.isEmpty {
            remainingValues = array.isEmpty ? array2 : array
        }
        while !remainingValues.isEmpty {
            var res = remainingValues.last! + carry
            carry = res > 9 ? 1 : 0
            res -=  res > 9 ? 10 : 0
            remainingValues.removeLast(1)
            if let lastNode = resultNode {
                let newNode = ListNode(res)
                newNode.next = lastNode
                resultNode = newNode
            }
        }
        if carry == 1 {
            let newNode = ListNode(1)
            newNode.next = resultNode
            return newNode
        }
        
        return resultNode
    }

}
