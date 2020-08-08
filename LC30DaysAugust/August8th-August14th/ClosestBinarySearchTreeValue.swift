/*
 Question - Closest Binary Search Tree Value
 Link - > https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3416/
 */

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil;self.right = nil; }
  public init(_ val: Int) { self.val = val;self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

class Solution {
  func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
    var node = root
    guard var root = root else { return -1 }
    var minValue = Double(Int.max), value = root.val
    while node != nil{
      let distance = abs(Double(node!.val) - target)
      if distance < minValue{
        minValue = distance
        value = node!.val
      }
      if target < Double(node!.val){
        node = node!.left
      }else{
        node = node!.right
      }
    }
    return value
  }
}
