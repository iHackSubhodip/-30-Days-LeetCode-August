/*
 Question - Numbers With Same Consecutive Differences
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3428/
 */

class Solution {
  func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
    guard N > 1 else { return [0,1,2,3,4,5,6,7,8,9] }
    var current = [1,2,3,4,5,6,7,8,9,0]
    for i in 2...N{
      var current2 = [Int]()
      for value in current{
        var y = value % 10
        if (value > 0 && y + K < 10){
          current2.append(value * 10 + y + K)
        }
        if (value > 0 &&  K > 0 && y - K >= 0){
          current2.append(value * 10 + y - K)
        }
      }
      current = current2
    }
    return current
  }
}
