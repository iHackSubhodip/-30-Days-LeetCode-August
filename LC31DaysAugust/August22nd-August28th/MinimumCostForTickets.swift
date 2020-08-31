/*
 Question - Minimum Cost For Tickets
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3436/
 */

class Solution {
  func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
    guard days.count > 0 else{
      return 0;
    }
    
    var minCosts = Array(repeating: 0, count: days[days.count - 1] + 1)
    var trackingIndex = 0
    
    for day in 1...days[days.count - 1]{
      if day == days[trackingIndex]{
        trackingIndex += 1
        
        let oneDayCost = costs[0] + minCosts[day - 1]
        let sevenDaysCost = costs[1] + (day - 7 >= 0 ? minCosts[day - 7] : 0)
        let thirtyDaysCost = costs[2] + (day - 30 >= 0 ? minCosts[day - 30] : 0)
        minCosts[day] = min(oneDayCost, sevenDaysCost, thirtyDaysCost)
      }else{
        minCosts[day] = minCosts[day - 1]
      }
    }
    
    return minCosts.last!
  }
}
