import UIKit

var str = "Hello, playground"
func longestCommonPrefix(_ strs: [String]) -> String {
    var result = ""
    if strs.count > 0 {
        if let firstObjc = strs.first {
            if strs.count > 1 {
                
                let numbers = strs.sorted()
//                print(numbers)
                let first = numbers.first!
                let last = numbers.last!
                
                let lastArray = Array(last)
                for (index, firstChar) in first.enumerated() {
                    if lastArray[index] != firstChar {
                        return result
                    }
                    
                    result += String(firstChar)
                }
            } else {
                result = firstObjc
            }
        }
    }
    return result
}


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


let array = ["flowerdsadadada","glight","flight"]
longestCommonPrefix(array)
