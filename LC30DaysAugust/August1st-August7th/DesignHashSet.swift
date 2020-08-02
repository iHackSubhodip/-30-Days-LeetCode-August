/*
 Question - Design HashSet
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3410/
 */

class MyHashSet {
  
  private var values: Set<Int>
  
  init() {
    values = Set<Int>()
  }
  
  func add(_ key: Int) {
    values.insert(key)
  }
  
  func remove(_ key: Int) {
    values.remove(key)
  }
  
  /** Returns true if this set contains the specified element */
  func contains(_ key: Int) -> Bool {
    return values.contains(key)
  }
}
