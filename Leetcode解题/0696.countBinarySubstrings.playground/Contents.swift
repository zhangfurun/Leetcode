import UIKit

func countBinarySubstrings(_ s: String) -> Int {
    if s.count <= 1 {
        return 0
    }

    var preChar = s.first
    var preCount = 0
    var currCount = 1
    var result = 0
    
    for (index, char) in s.enumerated() {
        if index == 0 {
            continue
        }
        if char == preChar {
            currCount += 1
        } else {
            if preCount > 0 {
                print(preCount, currCount)
                
                result += min(currCount, preCount)
            }
            
            preCount = currCount
            preChar = char
            currCount = 1
        }
    }
    if preCount > 0 {
        print(preCount, currCount)
        result += min(currCount, preCount)
    }

    return result
}

let s = "00110011"
print("\(countBinarySubstrings(s))个")
