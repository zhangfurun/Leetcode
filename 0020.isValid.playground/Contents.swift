import UIKit

var str = "Hello, playground"

var data : [Character: Character] = ["{":"}",
                                     "[":"]",
                                     "(":")"]


func isValid(_ s: String) -> Bool {
//    if s.count == 0 {
//        return true
//    }
//
//    if s.count == 1 {
//        return false
//    }
//
//    var allData: [Character] = []
//
//    for (key, value) in data {
//        allData.append(key)
//        allData.append(value)
//    }
    
    
    var flag: [Character] = []
    for char in s {
//        if allData.contains(char) {
            if data.keys.contains(char) {
                flag.append(data[char]!)
            } else {
//                if let flagLast = flag.last {
                    if flag.last == char {
                        flag.popLast()
                    } else {
                        return false
                    }
//                }
            }
//        }
    }
    
    return flag.count == 0
}


let string = "{{]}"

isValid(string)
