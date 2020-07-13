import UIKit

func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
    let row_count = dungeon.count
    if row_count < 1 {
        return 0
    }
    
    let col_count = dungeon[0].count
    if col_count < 1 {
        return 0
    }

    var dp = Array(repeating: Array(repeating: Int.max, count: col_count + 1), count: row_count + 1)
    
    dp[row_count - 1][col_count] = 1
    dp[row_count][col_count - 1] = 1
    
    for i in (0..<row_count).reversed() {
        for j in (0..<col_count).reversed() {
            let minNum = min(dp[i + 1][j], dp[i][j + 1])
            
            print(minNum - dungeon[i][j])
            dp[i][j] = max(1, minNum - dungeon[i][j])
        }
        print(i, dp[i])
    }
    
    return dp[0][0]
}


let data = [[-2,-3,3],[-5,-10,1],[10,30,-5]]

print("最低初始健康数: \(calculateMinimumHP(data))")
