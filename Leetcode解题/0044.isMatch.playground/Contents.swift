import UIKit

func isMatch(_ s: String, _ p: String) -> Bool {
   
    if s == p {
        return  true
    }
    
    if p == "*" {
        return true
    }
    
    if s == "" || p == "" {
        return false
    }
    
    
    let s_array = Array(s)
    var p_array = [Character]()
    // 压缩字符串 去除多余的*
    var pre_is_star = false
    
    for c in p {
        if !(c == "*" && pre_is_star) {
            p_array.append(c)
        }
        pre_is_star = (c == "*")
    }
    
    let s_count = s_array.count
    let p_count = p_array.count
    
    
    var dp:[[Bool]] = Array(repeating: Array(repeating: false, count: p_count + 1), count: s_count + 1)
    
    dp[0][0] = true
    
    for j in 1...p_count {
        let char_pre_p = p_array[j - 1]
        
        if char_pre_p == "*"{
            dp[0][j] = true
        } else {
            break
        }
    }
    
    for (index, array) in dp.enumerated() {
        print("index: \(index)  array:\(array)")
    }
    
    for i in 1...s_count {
        for j in 1...p_count {
            
            let char_pre_s = s_array[i - 1]
            let char_pre_p = p_array[j - 1]
            
//            print(char_pre_s, char_pre_p)
            
            if char_pre_p == "*" {
                dp[i][j] = dp[i][j - 1] || dp[i - 1][j]
            } else {
                if (char_pre_p == "?") || (char_pre_s == char_pre_p) {
                    dp[i][j] = dp[i - 1][j - 1]
                }
                
            }
        }
    }
    
    print("===== 结果 =====")
    for (index, array) in dp.enumerated() {
        print("index: \(index)  array:\(array)")
    }
    return dp[s_count][p_count]
}


let s = "adceb"
let p = "*a*b"

if isMatch(s, p) {
    print("匹配")
} else {
    print("NO")
}

