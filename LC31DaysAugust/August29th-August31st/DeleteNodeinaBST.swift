/*
 Question - Delete Node in a BST
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/553/week-5-august-29th-august-31st/3443/
 */

/**
 * Definition for a binary tree node.
 * */

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
  func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else { return nil }
    if key < root.val{
      root.left = deleteNode(root.left, key)
    }else if key > root.val{
      root.right = deleteNode(root.right, key)
    }else{
      if root.left == nil{
        return root.right
      }else if root.right == nil{
        return root.left
      }else{
        let minNode = findMin(root.right)
        root.val = minNode!.val
        root.right = deleteNode(root.right, root.val)
      }
    }
    return root
  }
  
  func findMin(_ root: TreeNode?) -> TreeNode?{
    guard var root = root else { return nil }
    while let leftNode = root.left{
      root = leftNode
    }
    return root
  }
}
