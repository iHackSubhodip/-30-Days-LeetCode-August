/*
 Question - Pascal's Triangle II
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3421/
 */

class Solution {
  func getRow(_ rowIndex: Int) -> [Int] {
    var row: [Int] = [], value = 1
    for k in 0...rowIndex{
      row.append(value)
      value = value * (rowIndex-k) / (k+1)
    }
    return row
  }
}
