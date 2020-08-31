/*
 Question - Path Sum III
 Link - > https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3417/
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
  func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    guard let root = root else { return 0 }
    return pathSumHelper(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
  }
  
  func pathSumHelper(_ node: TreeNode?,_ sum: Int) -> Int{
    guard let node = node else { return 0 }
    let lastSum = sum - node.val
    return (lastSum == 0 ? 1 : 0) + pathSumHelper(node.left, lastSum) + pathSumHelper(node.right, lastSum)
  }
  
  
}
