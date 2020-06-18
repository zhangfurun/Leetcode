import UIKit

let s = "ABCDEFGHIGKLMN"
let numRows = 1


func convert(_ s: String, _ numRows: Int) -> String {
    if numRows < 1 {
        return ""
    }
    
    if numRows < 2 {
        return s
    }
    var exchage_stringArray: [String] = []
    
    for _ in 0..<numRows {
        exchage_stringArray.append("")
    }
    
    // 方向
    var y_direction = true
    var y_index = 0
    for char in s {
         print(y_index)
        exchage_stringArray[y_index] += String(char)
        
        y_index += (y_direction ? 1 : -1) * 1
        
        if y_index == 0 {
            y_direction = true
        } else if y_index == (numRows - 1) {
            y_direction = false
        }
    }
    
    var exchange_string = ""
    for subString in exchage_stringArray {
        exchange_string += subString
    }
   
    
    return exchange_string
}


let string = convert(s, numRows)

print(string)
