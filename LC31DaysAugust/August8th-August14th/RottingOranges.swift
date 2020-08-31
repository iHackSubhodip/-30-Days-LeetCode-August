/*
 Question - Rotting Oranges
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3418/
 */

class Solution {
  func orangesRotting(_ grid: [[Int]]) -> Int {
    var grid = grid, queue: [(Int, Int)] = [], answer = 0
    let (n, m) = (grid.count, grid[0].count)
    var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n{
      for j in 0..<m{
        if grid[i][j] == 2{
          queue.append((i, j))
        }
      }
    }
    while !queue.isEmpty{
      let (i, j) = queue.removeFirst()
      for (di, dj) in [(0,-1), (1,0), (0,1), (-1,0)]{
        let (x, y) = (di+i, dj+j)
        guard x >= 0, y >= 0, x <= n-1, y <= m-1, grid[x][y] == 1 else{ continue }
        grid[x][y] = 2
        if visited[x][y] == 0{
          queue.append((x, y))
          visited[x][y] = visited[i][j] + 1
        }
      }
    }
    for i in 0..<n{
      for j in 0..<m{
        guard grid[i][j] != 1 else { return -1 }
        answer = max(answer, visited[i][j])
      }
    }
    return answer
  }
}
