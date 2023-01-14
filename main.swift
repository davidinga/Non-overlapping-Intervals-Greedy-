/*
Problem:
- Find the minimum number of intervals that need to be removed in order to have
  non-overlapping intervals.

Questions:
- [1,2], [2,3] are non-overlapping
- [a,b] a,b: Int, a <= b, 0 <= a,b >= 10^4

Input/Output:
- Input: [[Int]]
- Output: Int

Examples:
              j
[[1,2],[1,3],[2,3],[3,4]]
               i          

Thoughts:
- Greedy
- Sort first

Greedy
- When overlap found:
    - Greedily removing overlap with the largest end time.
    - When overlap occurs, we use end time of smallest end time to compare to next interval
    - Keeping a count of overlaps
*/

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    var minRemovals = 0
    var j = 0
    let intervals = intervals.sorted { $0[0] < $1[0] }

    for i in intervals.indices {
        guard i != j else { continue }
        let ival1 = intervals[j]
        let ival2 = intervals[i]

        if ival1[1] > ival2[0] {
            minRemovals += 1
            if ival1[1] <= ival2[1] { continue }
        }
        j = i
    }

    return minRemovals
}
