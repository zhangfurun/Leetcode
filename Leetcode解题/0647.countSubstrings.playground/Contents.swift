import UIKit

func countSubstrings(_ s: String) -> Int {
    if s.count < 1 {
        return 0
    }
    
    let key = "#"
    var stringArray = [String]()
    for char in s {
        stringArray.append("\(char)")
        stringArray.append(key)
    }
    stringArray.removeLast()
    
    var count = 0
    for (index, string) in stringArray.enumerated() {
        if string != key {
            count += 1
        }
        
        var left = index - 1
        var right = index + 1
        
        while 0 <= left && right < stringArray.count {
            
            let leftChar = stringArray[left]
            let rightChar = stringArray[right]
            
            if leftChar == rightChar {
                if leftChar != key {
                    count += 1
                }
            } else {
                break;
            }
            
            left -= 1
            right += 1
        }
    }
    
    return count
}

let string = "aaa"
print(countSubstrings(string))
