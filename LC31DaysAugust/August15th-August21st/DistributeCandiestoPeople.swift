/*
 Question - Distribute Candies to People
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3427/
 */

class Solution {
  func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
    var result = Array(repeating: 0, count: num_people), i = 0, candies = candies
    while candies > 0{
      result[i%num_people] += min(candies, i+1)
      candies -= i + 1
      i += 1
    }
    return result
  }
}
