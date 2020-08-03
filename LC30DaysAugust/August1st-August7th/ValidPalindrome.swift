/*
 Question - Valid Palindrome
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3411/
 */

class Solution {
  func isPalindrome(_ s: String) -> Bool{
    let arr = Array(s.lowercased().filter("abcdefghijklmnopqrstuvwxyz0123456789".contains))
    var start = 0, end = arr.count - 1
    while start < end{
      if arr[start] != arr[end] { return false }
      start += 1
      end -= 1
    }
    return true
  }
}
