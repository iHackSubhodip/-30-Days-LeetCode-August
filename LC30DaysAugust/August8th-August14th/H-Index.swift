/*
 Question - H-Index
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3420/
 */

class Solution {
  func hIndex(_ citations: [Int]) -> Int {
    var count = citations.count, t = 0, result = 0
    guard count > 0 else{ return 0 }
    var papers = Array(repeating: 0, count: count + 1)
    for i in 0..<count{
      if citations[i] > count {
        papers[count] += 1
      }else{
        papers[citations[i]] += 1
      }
    }
    for i in stride(from: count, through: 0, by: -1){
      t += papers[i]
      if t >= i { return i}
    }
    return 0
  }
}
