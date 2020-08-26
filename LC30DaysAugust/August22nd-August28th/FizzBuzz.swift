/*
 Question - Fizz Buzz
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3437/
 */

class Solution {
  func fizzBuzz(_ n: Int) -> [String] {
    var result: [String] = []
    for i in 1...n{
      result.append(i % 3 == 0 && i % 5 == 0 ? "FizzBuzz" : i % 3 == 0 ? "Fizz" : i % 5 == 0 ? "Buzz" : "\(i)" )
    }
    return result
  }
}
