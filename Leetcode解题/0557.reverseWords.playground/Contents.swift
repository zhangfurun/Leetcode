import UIKit

func reverseWords(_ s: String) -> String {
    if s.count < 2 {
        return s
    }
    
    var result = ""
    var word = ""
    let space = " "
    for char in s.reversed() {
        let letter = "\(char)"
        if letter == space {
            result = word + space + result
            word = ""
        } else {
            word += letter
        }
    }
    
    if word != "" {
        result = word + space + result
    }
    
    result.removeLast()
    
    
    return result
}

let s = "Let's take LeetCode contest"

print(reverseWords(s))
