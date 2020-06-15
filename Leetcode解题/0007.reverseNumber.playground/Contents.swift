import UIKit

var str = "Hello, playground"

func reverse(_ x: Int) -> Int {
    if x == 0 {
        return x
    }
    let isMinusNumber = (x > 0) ? 1 : -1
    var number = abs(x)
    var result = 0
    while number > 0 {
        result = result * 10 + (number % 10)
        number /= 10
    }
    
    result *= isMinusNumber
    
    if result > (Int32.max - 1) || result < Int32.min {
        result = 0
    }
    
    return result
}

let number = 21474836471


reverse(number)

Int32.max
Int64.max
Int.max
