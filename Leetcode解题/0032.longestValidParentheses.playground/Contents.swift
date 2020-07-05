import UIKit

func longestValidParentheses(_ s: String) -> Int {
    var length = 0
    
    var balance_num = 0
    var count_num = 0
    
    for char in s {
        if char == Character("(") {
            if balance_num < 0 {
               balance_num = 0
            }
            balance_num += 1
        } else {
            balance_num -= 1
        }
        
        if balance_num < 0 {
            count_num = 0
        } else {
            count_num += 1
        }
        
        print("正 balance_num:\(balance_num) count_num:\(count_num)")
        
        if balance_num == 0 {
            length = max(length, count_num)
        }
    }
    
    balance_num = 0
    count_num = 0
    
    for char in s.reversed() {
        if char == Character(")") {
            if balance_num < 0 {
               balance_num = 0
            }
            balance_num += 1
        } else {
            balance_num -= 1
        }
        
        if balance_num < 0 {
            count_num = 0
        } else {
            count_num += 1
        }
        
        print("倒 balance_num:\(balance_num) count_num:\(count_num)")
        if balance_num == 0 {
            length = max(length, count_num)
        }
    }
    
    return length
}

let string = "())(()"
// 1 0 1 2 1
// 1 2 3 4 5
print(longestValidParentheses(string))

//func longestValidParentheses(_ s: String) -> Int {
//    let left_length = getStringResult(s: s, isLeft: true)
//    let right_length = getStringResult(s: s, isLeft: false)
//    let length = max(left_length, right_length)
//    return length
//}
//
//func getStringResult(s: String, isLeft: Bool) -> Int {
//    var length = 0
//    
//    var balance_num = 0
//    var count_num = 0
//    
//    let block = { (char: Character) in
//        if char == Character(isLeft ? "(" : ")") {
//            if balance_num < 0 {
//                balance_num = 0
//            }
//            balance_num += 1
//        } else {
//            balance_num -= 1
//        }
//        
//        if balance_num < 0 {
//            count_num = 0
//        } else {
//            count_num += 1
//        }
//        
//        if balance_num == 0 {
//            length = max(length, count_num)
//        }
//    }
//    
//    if isLeft {
//        for char in s {
//            block(char)
//        }
//    } else {
//        for char in s.reversed() {
//            block(char)
//        }
//    }
//    return length
//}
//
//let string = "())(()"
//// 1 0 1 2 1
//// 1 2 3 4 5
//print(longestValidParentheses(string))
