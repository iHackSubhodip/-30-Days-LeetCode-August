/*
 Question - Power of Four
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3412/
 */

class Solution {
  func isPowerOfFour(_ num: Int) -> Bool {
    return num > 0 && (num & (num-1)) == 0 && (num - 1) % 3 == 0
  }
}
