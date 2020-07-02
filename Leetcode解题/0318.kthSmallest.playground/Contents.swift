import UIKit


func getRangeSizeUpCount(_ matrix: [[Int]], _ midNum: Int) -> Int {
    var count = 0
    let matrix_count = matrix.count
    var row = matrix_count - 1
    var col = 0
    
    while row >= 0 && col < matrix_count {
        if midNum >= matrix[row][col] {
            count += (row + 1)
            col += 1
        } else {
            row -= 1
        }
    }
    return count
}

func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
//    let matrix_count = matrix.count
//    var low = matrix[0][0]
//    var high = matrix[matrix_count - 1][matrix_count - 1]
//
//    while low < high {
//        let mid = low + ((high - low) >> 1)
//        let count = getRangeSizeUpCount(matrix, mid)
//        if count >= k {
//            high = mid
//        } else {
//            low = mid + 1
//        }
//    }
//    return low
    var minK = 0
    
    var array:[Int] = []
    let rowCount = matrix.count
    
    var lastNum = matrix[0][rowCount - 1]
    for row in matrix {
        if lastNum < row[0] && array.count >= k {
            break
        }
        array += row
        lastNum = row[rowCount - 1]
    }
    
    array = array.sorted()
    minK = array[k - 1]
    return minK
}


let matrix = [
   [1,2],
   [1,3],
]
let k = 3

print(kthSmallest(matrix, k))

