import UIKit

func addStrings(_ num1: String, _ num2: String) -> String {
    if num1.count < 1 {
        return num2
    }
    
    if num2.count < 1 {
        return num1
    }
    
    var dic = [String.Element : Int]()
    for i in 0...9 {
        dic[Character("\(i)")] = i
    }
    
    
    let numArray1 = Array(num1)
    let numArray2 = Array(num2)
    
    var index_1 = numArray1.count - 1
    var index_2 = numArray2.count - 1
        
    var char_1 = numArray1[index_1]
    var char_2 = numArray2[index_2]
    
    var carry = 0
    var string = ""
    
    while !(index_1 < 0  && index_2 < 0 && carry == 0 )   {
        
        char_1 = index_1 < 0 ? "0" : numArray1[index_1]
        char_2 = index_2 < 0 ? "0" : numArray2[index_2]
        
        // 计算
        let num_1 = dic[char_1]!
        let num_2 = dic[char_2]!
        
        var curNum = num_1 + num_2 + carry
        
        if curNum >= 10 {
            carry = 1
            curNum -= 10
        } else {
            carry = 0
        }
        
        string = "\(curNum)" + string
        
        index_1 -= 1
        index_2 -= 1
        
    }
    
    return string
}

let num1 = "123"

let num2 = "8989898"

print(addStrings(num1, num2))
