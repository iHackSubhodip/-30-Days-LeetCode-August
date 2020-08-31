/*
 Question - The Maze
 Link - > https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/552/week-4-august-22nd-august-28th/3432/
 */

class Solution {
  func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
    let rowVal = maze.count, columnVal = maze[0].count
    var queue = [(start[0], start[1])], seen = Set<[Int]>()
    seen.insert([start[0], start[1]])
    let direction = [(1,0), (-1,0), (0,1), (0,-1)]
    while !queue.isEmpty{
      let (row, col) = queue.removeFirst()
      
      for (dx, dy) in direction{
        var sRow = row, sCol = col
        while 0 <= (sRow + dx) && (sRow + dx) < rowVal && 0 <= (sCol + dy) && (sCol + dy) < columnVal && maze[sRow + dx][sCol + dy] == 0{
          sRow += dx
          sCol += dy
        }
        if sRow == destination[0] && sCol == destination[1]{ return true }
        if !seen.contains([sRow, sCol]){
          seen.insert([sRow, sCol])
          queue.append((sRow, sCol))
        }
      }
    }
    
    return false
  }
}
