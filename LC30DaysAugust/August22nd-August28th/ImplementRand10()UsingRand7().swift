/*
 Question - Implement Rand10() Using Rand7()
 Link - > https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3439/
 */

/**
 * The rand7() API is already defined in the parent class SolBase.
 * func rand7() -> Int = {}
 * @return a random integer in the range 1 to 7
 */
class Solution : SolBase {
  func rand10() -> Int {
    let v = rand7() + (rand7()-1)*7
    if v <= 40 { return 1 + (v-1)%10 }
    return rand10()
  }
}
