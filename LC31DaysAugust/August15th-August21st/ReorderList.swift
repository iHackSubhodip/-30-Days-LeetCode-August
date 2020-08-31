/*
 Question - Reorder List
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3430/
 */

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val;self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) {self.val = val; self.next = next; }
}

class Solution {
  func reorderList(_ head: ListNode?) {
    var prev: ListNode? = nil, current = head, fast = head
    while fast != nil{
      prev = current
      current = current?.next
      fast = fast?.next?.next
    }
    prev?.next = nil
    prev = nil
    
    while current != nil{
      let next = current?.next
      current?.next = prev
      prev = current
      current = next
    }
    current = prev
    var head = head
    
    while head != nil{
      let headNext = head?.next
      let currentNext = current?.next
      head?.next = current
      current?.next = headNext
      head = headNext
      current = currentNext
    }
  }
}
