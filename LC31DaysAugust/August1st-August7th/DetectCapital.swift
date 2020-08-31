/*
 Question - Detect Capital
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3409/
 */

class Solution {
  func detectCapitalUse(_ word: String) -> Bool {
    return word == word.lowercased() || word == word.uppercased() || word == word.prefix(1) + word.lowercased().dropFirst()
  }
}
