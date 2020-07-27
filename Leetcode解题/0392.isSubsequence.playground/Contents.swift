import UIKit

func isSubsequence(_ s: String, _ t: String) -> Bool {
    if s.count > t.count {
        return false
    }
    
    if s.count == t.count {
        return s == t
    }
    
    if s.count < 1 || t.count < 1 {
        return true
    }
    
    let array_s = Array(s)
    let array_t = Array(t)
    
    var index_s = 0
    
    var left_index = 0
    var left_right = array_s.count - 1
    
    for index in 0..<t.count/2 {
        
    }
    
    var char_s = array_s[index_s]
    for (index_t, char_t) in array_t.enumerated() {
        if (array_s.count - index_s) > (array_t.count - index_t) {
            return false
        }        
        
        if char_s == char_t {
            index_s += 1
            if index_s >= array_s.count {
                return true
            }
            
            char_s = array_s[index_s]
        }
    }
    
    return false
}

let s = "abc"
let t = "ahbgdc"

print(isSubsequence(s, t) ? "true" : "false")
