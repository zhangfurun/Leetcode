import UIKit

var str = "Hello, playground"

//func isPalindrome(_ x: Int) -> Bool {
//    if x >= 0 {
//        var number = x
//        var baseNumber = 1
//        while true {
//            number /= 10
//            if number <= 0 {
//                break
//            }
//            baseNumber *= 10
//        }
//
//        number = x
//
//        var isPalindromeNumber = true
//        var lastNumber = 0
//        var fristNumber = 0
//        while baseNumber > 0 {
//            lastNumber = number % 10
//            fristNumber = number / baseNumber
//            if fristNumber == lastNumber {
//                number -= lastNumber
//                number -= baseNumber * fristNumber
//                number /= 10
//                baseNumber /= 100
//            } else {
//                isPalindromeNumber = false
//                break
//            }
//        }
//        return isPalindromeNumber
//    }
//    return false
//}

func isPalindrome(_ x: Int) -> Bool {
    // 排除负数以及可以整除10的数但是x==0应该return true
    if x < 0 || x % 10 == 0 && x != 0 {
        return false
    }
    var X = x
    var reverse = 0
    // 只反转X的一半，如何判断是一半？
    // 当已反转reverse > 变化后的X，则此时已反转X的一半或多一位
    // 譬如X=12321，当reverse==123，X==12，此时已反转X的一半多一位
    // 譬如x=1221，当reverse==12，X==12，此时已反转X的一半
    while X > reverse {
        reverse = reverse * 10 + X % 10
        X /= 10
        
        print("reverse: \(reverse) X: \(X)")
    }
    return X == reverse || X == reverse / 10
}

let number = 123321
let isTrue = isPalindrome(number)
print(isTrue)
