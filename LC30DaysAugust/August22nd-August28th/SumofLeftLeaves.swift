/*
 Question - Sum of Left Leaves
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3435/
 */

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

class Solution {
  func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    return traverse(root, false)
  }
  
  func traverse(_ root: TreeNode?,_ isLeft: Bool) -> Int{
    guard let root = root else { return 0 }
    if root.left == nil, root.right == nil, isLeft { return root.val }
    return traverse(root.left, true) + traverse(root.right, false)
  }
}
