import UIKit

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    if obstacleGrid.count < 1 || obstacleGrid[0].count < 1 {
        return 0
    }
    let rowCounts = obstacleGrid.count
    let colCounts = obstacleGrid[0].count
    
    var ways = Array(repeating: 0, count: colCounts)
    
    ways[0] = obstacleGrid[0][0] == 0 ? 1 : 0
    
    for row_index in 0..<rowCounts {
        for col_index in 0..<colCounts {
            if obstacleGrid[row_index][col_index] == 1 {
                ways[col_index] = 0
                continue
            }
            
            if col_index - 1 >= 0 && obstacleGrid[row_index][col_index - 1] == 0 {
                ways[col_index] += ways[col_index - 1];
            }
        }
        
        print(ways)
    }
    
    return ways[colCounts - 1]
}

let path = [
  [0,0,0],
  [0,1,0],
  [0,0,0]
]

print(uniquePathsWithObstacles(path), "条")
