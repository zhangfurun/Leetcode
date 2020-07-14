import UIKit

func minimumTotal(_ triangle: [[Int]]) -> Int {

    let rowCount = triangle.count
    
    if rowCount <= 1 {
        return triangle.first?.first ?? 0
    }
    
    var dp = triangle
    
    print(dp)
    
    for row in (0..<(rowCount - 1)).reversed() {
//        print("row: \(row)")
        for col in (0..<triangle[row].count) {
//            print("col: \(col)")
            dp[row][col] += min(dp[row + 1][col], dp[row + 1][col + 1])
        }
        
        print(dp[row])
    }
    
    return dp[0][0]
}

let array = [
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
]

print(minimumTotal(array))
