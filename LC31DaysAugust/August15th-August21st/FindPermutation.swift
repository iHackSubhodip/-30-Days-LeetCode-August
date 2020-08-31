/*
 Question - Find Permutation
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3424/
 */

class Solution {
  func findPermutation(_ s: String) -> [Int] {
    let arrayS = Array(s)
    var stack: [Int] = [], answer: [Int] = []
    for i in 0..<arrayS.count{
      stack.append(i+1)
      if arrayS[i] == "I"{
        while !stack.isEmpty{
          answer.append(stack.removeLast())
        }
      }
    }
    stack.append(arrayS.count + 1)
    while !stack.isEmpty{
      answer.append(stack.removeLast())
    }
    return answer
  }
}
