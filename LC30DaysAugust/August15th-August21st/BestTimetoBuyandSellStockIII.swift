/*
 Question - Best Time to Buy and Sell Stock III
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3426/
 */

class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    let len = prices.count
    if len <= 1 {
      return 0
    }
    
    var leftMin = prices[0]
    var rightMax = prices[len - 1]
    var leftProfits = Array(repeating: 0, count: len)
    var rightProfits = Array(repeating: 0, count: len + 1)
    
    for i in 1..<len {
      leftProfits[i] = max(leftProfits[i - 1], prices[i] - leftMin)
      leftMin = min(leftMin, prices[i])
      
      let right = len - i - 1
      rightProfits[right] = max(rightProfits[right + 1], rightMax - prices[right])
      rightMax = max(rightMax, prices[right])
    }
    var maxProfit = 0
    for i in 0..<len {
      maxProfit = max(maxProfit, leftProfits[i] + rightProfits[i + 1])
    }
    return maxProfit
  }
}
