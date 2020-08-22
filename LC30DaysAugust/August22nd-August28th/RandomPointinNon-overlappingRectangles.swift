/*
 Question - Random Point in Non-overlapping Rectangles
 Link - > https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3433/
 */

class Solution {
  
  var totalArea: Int
  var sizes: [Int]
  var rects: [[Int]]
  
  init(_ rects: [[Int]]) {
    self.rects = rects
    self.totalArea = 0
    self.sizes = [Int]()
    
    for rect in rects {
      let size = (rect[2] - rect[0] + 1) * (rect[3] - rect[1] + 1)
      sizes.append(size)
      totalArea += size
    }
  }
  
  func pick() -> [Int] {
    let randNum = Int.random(in: 0..<totalArea)
    var currSize = 0
    for index in 0..<sizes.count {
      currSize += sizes[index]
      if currSize > randNum {
        let randX = Int.random(in: rects[index][0]...rects[index][2])
        let randY = Int.random(in: rects[index][1]...rects[index][3])
        return [randX, randY]
      }
    }
    
    return []
  }
}
