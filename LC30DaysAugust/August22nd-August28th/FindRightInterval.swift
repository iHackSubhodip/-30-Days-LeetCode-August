/*
 Question - Find Right Interval
 Link - > https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3438/
 */

class Solution {
  
  func findRightInterval(_ intervals: [[Int]]) -> [Int] {
    var map: [Int: Int] = [:], starts: [Int] = [], result = [Int](repeating: 0, count: intervals.count)
    for i in 0..<intervals.count{
      map[intervals[i][0]] = i
      starts.append(intervals[i][0])
    }
    starts = starts.sorted()
    for i in 0..<intervals.count{
      let end = intervals[i][1]
      let start = binarySearch(starts, end)
      if start < end{
        result[i] -= 1
      }else{
        result[i] = map[start]!
      }
    }
    return result
  }
  
  func binarySearch(_ nums: [Int],_ target: Int) -> Int{
    var left = 0, right = nums.count - 1, mid = 0
    while left < right{
      mid = (left + right) / 2
      if nums[mid] < target{
        left = mid + 1
      }else{
        right = mid
      }
    }
    return nums[left]
  }
}
