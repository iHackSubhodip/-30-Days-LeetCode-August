/*
 Question - Largest Component Size by Common Factor
 Link - > https://leetcode.com/explore/featured/card/august-leetcoding-challenge/553/week-5-august-29th-august-31st/3442/
 */

class Solution {

    /// Calculates the size of the largest connected component in the graph.
    ///
    /// - Parameter A: A non-empty array of unique positive integers.
    /// - Returns: The size of the largest connected component.
    ///
    /// - Complexity:
    ///     - time: O(n log(m)), where n is the number of elements in A, and m is the
    ///     maximum value in A.
    ///     - space: O(n + m), where n is the number of elements in A, and m is the maximum
    ///     value in A.
    func largestComponentSize(_ A: [Int]) -> Int {
        guard let maxValue = A.max() else { return 0 }

        let dsu = DisjointSetUnion(maxValue)
        var numFactorDict = [Int: Int]()

        for num in A {
            let primeFactors = Array(Set(primeDecompose(num)))

            numFactorDict[num] = primeFactors[0]

            for i in 0..<primeFactors.count-1 {
                dsu.union(x: primeFactors[i], y: primeFactors[i + 1])
            }
        }

        var ans = 0
        var groupCount = [Int: Int]()

        for num in A {
            guard let n = numFactorDict[num] else { continue }

            let groupID = dsu.find(n)
            let count = groupCount[groupID] ?? 0
            groupCount[groupID, default: 0] += 1
            ans = max(ans, count+1)
        }

        return ans
    }

    private func primeDecompose(_ num: Int) -> [Int] {
        var ans = [Int]()
        var num = num
        var factor = 2

        while num >= factor * factor {
            if num % factor == 0 {
                ans.append(factor)
                num /= factor
            } else {
                factor += 1
            }
        }

        ans.append(num)
        return ans
    }

}

final class DisjointSetUnion {

    private var parent: [Int]
    private var size: [Int]

    init(_ size: Int) {
        parent = [Int]()
        self.size = [Int]()
        for i in 0...size {
            parent.append(i)
            self.size.append(1)
        }
    }

    /// Finds the component ID that the element x belongs to.
    ///
    /// - Parameter x: The integer.
    /// - Returns: The component ID.
    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }

        return parent[x]
    }

    /// Merge the two components.
    ///
    /// - Parameters:
    ///   - x: The integer.
    ///   - y: The integer.
    /// - Returns: The merged component ID.
    func union(x: Int, y: Int) -> Int {
        var px = find(x)
        var py = find(y)

        guard px != py else { return px }

        if size[px] > size[py] {
            let tmp = px
            px = py
            py = tmp
        }

        parent[px] = py
        size[py] += size[px]
        return py
    }

}
