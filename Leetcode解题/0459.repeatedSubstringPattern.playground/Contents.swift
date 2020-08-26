import UIKit

func repeatedSubstringPattern(_ s: String) -> Bool {
    let ss = s + s
    print(ss)
    var rangeSS = ss.prefix(ss.count - 1)
    print(rangeSS)
    rangeSS = rangeSS.suffix(rangeSS.count - 1)
    print(rangeSS)
    
    return rangeSS.contains(s)
}

let s = "abab"

print(repeatedSubstringPattern(s))
