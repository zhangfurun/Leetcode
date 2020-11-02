import UIKit

var str = "Hello, playground"


//var grids = [[0,1,0,0],
//            [1,1,1,0],
//            [0,1,0,0],
//            [1,1,0,0]]

var grids = [[1, 0]]

//func islandPerimeter(_ grid: [[Int]]) -> Int {
//    var long = 0
//    for low in 0..<grid.count {
//        for line in 0..<grid[low].count {
//            if grid[low][line] == 0 {
//                continue
//            }
//
//            print(low, line)
//            // 上
//            if low > 0 {
//                if grid[low - 1][line] == 0 {
//                    long += 1
//                }
//            } else {
//                print("上  边缘  + 1")
//                long += 1
//            }
//
//            // 下
//            if low < grid.count - 1 {
//                if grid[low + 1][line] == 0 {
//                    long += 1
//                }
//            } else {
//                print("下  边缘  + 1")
//                long += 1
//            }
//
//            // 左
//            if line > 0 {
//                if grid[low][line - 1] == 0 {
//                    long += 1
//                }
//            } else {
//                print("左  边缘  + 1")
//                long += 1
//            }
//
//            // 右
//            if line < grid[low].count - 1 {
//                if grid[low][line + 1] == 0 {
//                    long += 1
//                }
//            } else {
//                print("右  边缘  + 1")
//                long += 1
//            }
//        }
//    }
//    return long
//}


func islandPerimeter(_ grid: [[Int]]) -> Int {
    var long = 0
    for low in 0..<grid.count {
        for line in 0..<grid[low].count {
            if grid[low][line] == 0 {
                continue
            }

            long += 4
            
            if low > 0 && grid[low - 1][line] == 1 {
                long -= 2
            }
            
            if line > 0 && grid[low][line - 1] == 1 {
                long -= 2
            }
        }
    }
    return long
}
    
print("岛屿周长为:\(islandPerimeter(grids))")
