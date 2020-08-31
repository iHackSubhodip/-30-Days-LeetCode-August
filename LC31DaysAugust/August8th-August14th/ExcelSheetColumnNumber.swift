/*
 Question - Excel Sheet Column Number
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3419/
 */

class Solution {
  func titleToNumber(_ s: String) -> Int {
    var result = 0
    for val in s.unicodeScalars{
      let value = Int(val.value) - 64
      result = (result * 26) + value
      print(result)
    }
    return result
  }
}
