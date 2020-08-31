/*
 Question - Logger Rate Limiter
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/549/week-1-august-1st-august-7th/3408/
 */

class Logger {
  
  var pool = [String: Int]()
  func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
    if let time = pool[message], time > timestamp - 10{
      return false
    }else{
      pool[message] = timestamp
      return true
    }
  }
}
