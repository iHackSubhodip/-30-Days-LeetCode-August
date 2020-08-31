/*
 Question - Longest Palindrome
 Link - > https://leetcode.com/problems/longest-palindrome/
 */

class Solution {
  func longestPalindrome(_ s: String) -> Int {
    var count = 0
    let palindromeDictonary: [Character: Int] = s.reduce(into: [:], { $0[$1, default: 0] += 1})
    for (_, value) in palindromeDictonary{
      count += value % 2 == 0 ? value : value - 1
    }
    return count < s.count ? count + 1 : count
  }
}

