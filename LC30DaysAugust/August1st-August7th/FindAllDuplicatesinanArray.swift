/*
 Question - Find All Duplicates in an Array
 Link - > https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3414/
 */

class Solution {
  func findDuplicates(_ nums: [Int]) -> [Int] {
    var nums = nums, result = [Int]()
    for i in 0..<nums.count{
      let index = abs(nums[i]) - 1
      if nums[index] > 0{
        nums[index] = -nums[index]
      }else{
        result.append(index + 1)
      }
    }
    return result
  }
}
