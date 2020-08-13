/*
 Question - Iterator for Combination
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3422/
 */

class CombinationIterator {
  private var list: [String] = [], count = 0
  
  init(_ characters: String, _ combinationLength: Int) {
    backtrack(Array(characters), combinationLength, 0, "")
  }
  
  func backtrack(_ arr: [Character],_ length: Int,_ index: Int,_ current: String){
    if current.count == length{
      list.append(current)
      return
    }
    for i in index..<arr.count{
      backtrack(arr, length, i+1, current+String(arr[i]))
    }
  }
  
  func next() -> String {
    count += 1
    return list[count-1]
  }
  
  func hasNext() -> Bool {
    return count < list.count
  }
}
