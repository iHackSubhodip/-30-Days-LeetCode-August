/*
 Question - Goat Latin
 Link - > https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/551/week-3-august-15th-august-21st/3429/
 */

class Solution {
  func toGoatLatin(_ S: String) -> String {
    var array = S.components(separatedBy: " ")
    for i in 0..<array.count{
      if !isVowel(array[i].first!){
        array[i].append(array[i].first!)
        array[i].remove(at: array[i].startIndex)
      }
      array[i].append("ma")
      for _ in 0..<i+1{
        array[i].append("a")
      }
    }
    return array.joined(separator: " ")
  }
  
  func isVowel(_ c: Character) -> Bool{
    return ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"].contains(c)
  }
  
}
