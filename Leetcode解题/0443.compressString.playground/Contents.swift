import UIKit

//var str = "aabbccc"
//var str = "abbbbbbbbbbbb"
var str = "aaabbaa"

let a = 120 / 10

func compress(_ chars: inout [Character]) -> Int {
    if chars.count < 2 {
        return chars.count
    }
    
    var markIndex = 0
    
    var rangeCount = 0
    
    for flag in 0..<(chars.count) {
        rangeCount += 1

        if flag == chars.count - 1 || chars[flag] != chars[flag + 1] {
            // 计算阶段
            chars[markIndex] = chars[flag]
            markIndex += 1
            if rangeCount > 1 {
                let rangeString = "\(rangeCount)"
                let rangeArray = Array(rangeString)
                var rangeIndex = 0
                print(rangeString, rangeArray)
                while rangeIndex < rangeArray.count {
                    let rangeChar = rangeArray[rangeIndex]
                    chars[markIndex] = rangeChar
                    markIndex += 1
                    rangeIndex += 1
                }
            }
            
            rangeCount = 0
        }
    }
    return markIndex
}

var array = Array(str)
print("\(compress(&array))个")
print(array)
