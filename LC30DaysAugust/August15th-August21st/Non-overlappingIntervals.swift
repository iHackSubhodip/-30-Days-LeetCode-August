/*
 Question - Non-overlapping Intervals
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3425/
 */

class Solution {
  func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    guard !intervals.isEmpty else { return 0 }
    let sortedIntervals = intervals.sorted(by: { $0[1] < $1[1] })
    var answer = 0, prev = sortedIntervals[0]
    for i in 1..<sortedIntervals.count{
      let interval = sortedIntervals[i]
      if interval[0] < prev[1]{
        answer += 1
      }else{
        prev = interval
      }
    }
    return answer
  }
}
