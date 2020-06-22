import UIKit

func countAndSay(_ n: Int) -> String {
     var curr_result = ""
    if n < 1 {
        curr_result = ""
    } else if n == 1 {
        curr_result = "1"
    } else {

        let last_result = countAndSay(n - 1)
        
        var cont_char = last_result.first
        var cont_count = 1
        
       
        
        
        for (index, char) in last_result.enumerated() {
            if index >= 1 {
                if char == cont_char {
                    cont_count += 1
                    
                } else {
                    curr_result += "\(cont_count)"
                    curr_result.append(cont_char ?? Character(""))
                    
                    cont_count = 1
                    cont_char = char
                }
            }
        }
        
        curr_result += "\(cont_count)"
        curr_result.append(cont_char ?? Character(""))
    }
    
    
//    print("n: \(n)  result: \(curr_result)")
    return curr_result
}



countAndSay(22)
