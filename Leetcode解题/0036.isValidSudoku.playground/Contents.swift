import UIKit

func isValidSudoku(_ board: [[Character]]) -> Bool {
    // 每行出现的次数
    var allRowCounts:[[Character:Int]] = Array(repeating: [:], count: 9)
    // 每列出现的次数
    var allLineCounts:[[Character:Int]] = Array(repeating: [:], count: 9)
    // 3x3
    var allBoxCounts:[[[Character:Int]]] = Array(repeating: Array(repeating: [:], count: 3), count: 3)
    
    for row in 0..<9 {
        for line in 0..<9 {
            let char = board[row][line]
            if char != "." {
                if let row_line_count = allRowCounts[row][char], row_line_count == 1 {
                    return false
                } else {
                    allRowCounts[row][char] = 1
                }
                
                if let line_row_count = allLineCounts[line][char], line_row_count == 1 {
                    return false
                } else {
                    allLineCounts[line][char] = 1
                }
                
                
                let current_box_row = max((row / 3), 0)
                let current_box_line = max((line / 3), 0)
                
                print(row, line, "==> ", current_box_row, current_box_line)
                
//                print(allBoxCounts[current_box_row][current_box_line])
                
                if let box_char_count = allBoxCounts[current_box_row][current_box_line][char], box_char_count == 1 {
                    return false
                } else {
                    allBoxCounts[current_box_row][current_box_line][char] = 1
                }
            }
        }
    }
    
    return true
    
}

var array: [[Character]] = [
    // line
  ["5","3",".",".","7",".",".",".","."],  // row
  ["6",".","3","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]

let isValid = isValidSudoku(array)
