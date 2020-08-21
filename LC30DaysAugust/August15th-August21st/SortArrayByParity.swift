/*
 Question - Sort Array By Parity
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3431/
 */

class Solution {
  func sortArrayByParity(_ A: [Int]) -> [Int] {
    return A.enumerated().reduce(into: [Int]()){ (acc, arg) in
      let (_, value) = arg
      acc.insert(value, at: value.isMultiple(of: 2) ? 0 : acc.count)
    }
  }
}
