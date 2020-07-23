import UIKit

func minPathSum(_ grid: [[Int]]) -> Int {

    let n = grid.count
    let m = grid[0].count

    var dp = Array(repeating: Array(repeating: Int.max, count: m + 1), count: n + 1)
    dp[n][m - 1] = 0
    dp[n - 1][m] = 0


    for i in (0..<n) {
        for j in (0..<m) {
            let i_reversed = n - 1 - i
            let j_reversed = m - 1 - j
            dp[i_reversed][j_reversed] = min(dp[i_reversed + 1][j_reversed], dp[i_reversed][j_reversed + 1]) + grid[i_reversed][j_reversed]
        }
    }

    return dp[0][0]
}

//func minPathSum(_ grid: [[Int]]) -> Int {
//
//    let n = grid.count
//    let m = grid[0].count
//
//
//    var dp = Array(repeating: Int.max, count: m + 1)
//    dp[m - 1] = 0
//
//    for i in (0..<n) {
//        for j in (0..<m) {
//            let i_reversed = n - 1 - i
//            let j_reversed = m - 1 - j
//            dp[j_reversed] = min(dp[j_reversed], dp[j_reversed + 1]) + grid[i_reversed][j_reversed]
//        }
//    }
//
//    return dp[0]
//}


let nums = [
  [1,3,1],
  [1,5,1],
  [4,2,1]
]

print("min: \(minPathSum(nums))")
