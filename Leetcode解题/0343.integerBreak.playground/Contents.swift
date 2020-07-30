import UIKit


//    var maxNumber = 1 * (n - 1)
//    let ceneter = 1 + (n - 1) / 2
//    for i in 1...ceneter {
//        let other = n - i
//        let i_integer = integerBreak(i)
//        let other_integer = integerBreak(other)
//        let cur = i_integer * other_integer
//        print(i_integer, other_integer)
//        maxNumber = max(cur, maxNumber)
//    }
//    return maxNumber


//    let other = n - ceneter
//    print(ceneter, other)
//    let i_integer = integerBreak(ceneter)
//    let other_integer = integerBreak(other)
//
//
//    return max(i_integer * other_integer, ceneter * other)


var dic = [Int: Int]()

func integerBreak(_ n: Int) -> Int {
    if let max = dic[n] {
        return max
    }
    
    if n <= 1 {
        dic[1] = 1
        return n
    }
    if n == 2 {
        dic[2] = 1
        return 1
    }

    if n == 3 {
        dic[3] = 2
        return 2
    }
    
    
    let ceneter = 1 + (n - 1) / 2
    var maxNumber = 1 * (n - 1)
    for num in 2...(ceneter) {
        let other = n - num
        
        let chai_num = integerBreak(num)
        let chai_other = integerBreak(other)
        
        let max_num = max(chai_num , num)
        let max_other = max(other, chai_other)
        
        maxNumber = max(maxNumber, max_num * max_other)
        
        dic[n] = maxNumber
        
    }
    return maxNumber
}


let number = 39

print(integerBreak(number))

