import UIKit

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count <= 1 {
        return s.count
    }
    
    var maxCount = 0
    var maxString = ""
    
    for (_, char) in s.enumerated() {
        
        let chaString = String(char)
        if maxString.contains(chaString) {
            maxString = maxString.components(separatedBy: chaString).last ?? ""
        }
        maxString += chaString
        maxCount = max(maxString.count, maxCount)
    }
         
    return maxCount
}

func lengthOfLongestSubstring_1(_ s: String) -> Int {
    if s.count <= 1 {
        return s.count
    }
    
    var maxCount = 0
    var maxString = ""
    
    for (_, char) in s.enumerated() {
        
        let chaString = String(char)
        if maxString.contains(chaString) {
            
            let start = maxString.index(maxString.firstIndex(of: char)!, offsetBy: 1)
            let end = maxString.index(maxString.startIndex, offsetBy: maxString.count)
            
            maxString = String(maxString[start..<end])
            
        }
        
        maxString += chaString
        maxCount = max(maxString.count, maxCount)
    }
    
    return maxCount
}

func lengthOfLongestSubstring_2(_ s: String) -> Int {
    if s.count <= 1 {
        return s.count
    }
    
    var index_left = s.startIndex
    var index_right = s.startIndex
    var maxDic:[Character: Int] = [:]
    var maxCount = 0
    
    while index_right < s.endIndex {
        let char = s[index_right]
        if let _ = maxDic[char] {
            // 存在
            maxDic.removeValue(forKey: s[index_left])
            
            index_left = s.index(after: index_left)
        } else {
            // 不存在
            index_right = s.index(after: index_right)
            maxDic[char] = 1
            maxCount = max(maxDic.keys.count, maxCount)
        }
    }
    
    return maxCount
}

let a = "abcabcbb"
print(lengthOfLongestSubstring_2(a))
