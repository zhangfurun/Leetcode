import UIKit

var str = "Hello, playground"

// sort + 首尾
//func longestCommonPrefix(_ strs: [String]) -> String {
//    var result = ""
//    if strs.count > 0 {
//        if let firstObjc = strs.first {
//            if strs.count > 1 {
//
//                let numbers = strs.sorted()
////                print(numbers)
//                let first = numbers.first!
//                let last = numbers.last!
//
//                let lastArray = Array(last)
//                for (index, firstChar) in first.enumerated() {
//                    if lastArray[index] != firstChar {
//                        return result
//                    }
//
//                    result += String(firstChar)
//                }
//            } else {
//                result = firstObjc
//            }
//        }
//    }
//    return result
//}




//func longestCommonPrefix(_ strs: [String]) -> String {
//       var result = ""
//       if strs.count > 0 {
//           if let firstObjc = strs.first {
//               if strs.count > 1 {
//                   let remainderArray = strs[1..<strs.count]
//                   for char in firstObjc {
//                       let flag = result + String(char)
//                       for objc in remainderArray {
//                           if !objc.hasPrefix(flag) {
//                               return result
//                           }
//                       }
//
//                       result = flag
//                   }
//               } else {
//                   return firstObjc
//               }
//
//           }
//       }
//       return result
//   }

// 二分法
func longestCommonPrefix(_ strs: [String]) -> String {
    var result = ""
    guard strs.count > 1 else {
        return strs.first ?? ""
    }
    
    let min_string = strs.sorted().first!
    
    var low = 0
    var height = min_string.count
    
    while low < height {
        let mid = low + (height - low + 1) / 2
        if compareString(strs: strs, flag: mid) {
            low = mid
        } else {
            height = mid - 1
        }
    }
    
    result = String(min_string.prefix(low))
    
    return result
}

func compareString(strs: [String], flag: Int) -> Bool {
    guard let str_0 = strs.first  else{
        return false
    }
    
    let flag_prefix = str_0.prefix(flag)
    
    for str in strs {
        if str.prefix(flag) != flag_prefix {
            return false
        }
    }
    
    return true
}


let array = ["flowerdsadadada","flightsss","flight"]
longestCommonPrefix(array)
