import UIKit

func addBinary(_ a: String, _ b: String) -> String {
    var binString = ""
    let maxLegth = max(a.count, b.count)
    
    let a_gap_legth = maxLegth - a.count
    let b_gap_legth = maxLegth - b.count
    
    var carry_num = 0
    
    var binString_index = maxLegth - 1
    
    while carry_num != 0 || binString_index >= 0 {
        var num = 0
        
        let a_index = binString_index - a_gap_legth
        if a_index >= 0 {
            
            let a_Int: Int = Int(String(a[a.index(a.startIndex, offsetBy: a_index)])) ?? 0
            
            num += a_Int
        }
        
        let b_index = binString_index - b_gap_legth
        if b_index >= 0 {
            let b_Int: Int = Int(String(b[b.index(b.startIndex, offsetBy: b_index)])) ?? 0
           
            num += b_Int
        }
        
        num += carry_num
        
        if num > 1 {
            carry_num = num / 2
            num %= 2
        } else {
            carry_num = 0
        }
        
        print(num, carry_num)
        
        binString = "\(num)\(binString)"
     
        binString_index -= 1
    }
            print(binString)
    
    return binString
}

let a = "1011"
let b = "111111"
let string = addBinary(a, b)
//print(string)
