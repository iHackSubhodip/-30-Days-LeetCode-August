/*
 Question - Robot Room Cleaner
 Link - > https://leetcode.com/problems/robot-room-cleaner/
 */

/**
 * // This is the robot's control interface.
 * // You should not implement it, or speculate about its implementation
 * public class Robot {
 *     // Returns true if the cell in front is open and robot moves into the cell.
 *     // Returns false if the cell in front is blocked and robot stays in the current cell.
 *     public func move() -> Bool {}
 *
 *     // Robot will stay in the same cell after calling turnLeft/turnRight.
 *     // Each turn will be 90 degrees.
 *     public func turnLeft() {}
 *     public func turnRight() {}
 *
 *     // Clean the current cell.
 *     public func clean() {}
 * }
 */

public class Robot {
  public func move() -> Bool {}
  public func turnLeft() {}
  public func turnRight() {}
  public func clean() {}
}

class Solution {
  let dx = [0,1,0,-1], dy = [-1,0,1,0]
  
  func cleanRoom(_ robot: Robot) {
    var setValue: [Int: Set<Int>] = [:]
    dfs(robot, &setValue, 0, 0, 0)
  }
  
  func dfs(_ robot: Robot, _ seen: inout [Int: Set<Int>], _ y: Int, _ x: Int, _ dir: Int) {
    if !seen[y, default: Set<Int>()].insert(x).inserted { return }
    robot.clean()
    for d in 0..<4 {
      let nd = (dir + d) % 4
      let ny = y + dy[nd], nx = x + dx[nd]
      if robot.move() {
        dfs(robot, &seen, ny, nx, nd)
        robot.turnLeft()
        robot.turnLeft()
        robot.move()
        robot.turnLeft()
      } else {
        robot.turnRight()
      }
    }
  }
}
