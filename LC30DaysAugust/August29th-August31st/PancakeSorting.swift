/*
 Question - Pancake Sorting
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/553/week-5-august-29th-august-31st/3441/
 */

class Solution {
  func pancakeSort(_ A: [Int]) -> [Int] {
    var result: [Int] = [], arr = A, n = arr.count
    for i in 0..<n{
      let index = find(arr, n-i)
      flip(&arr, index)
      flip(&arr, n-i-1)
      result.append(index+1)
      result.append(n-i)
    }
    return result
  }
  
  func find(_ arr: [Int],_ target: Int) -> Int{
    for i in 0..<arr.count{
      if arr[i] == target{
        return i
      }
    }
    return -1
  }
  
  func flip(_ arr: inout [Int],_ index: Int){
    var i = 0, j = index
    while i < j{
      arr.swapAt(i, j)
      i += 1
      j -= 1
    }
  }
}
