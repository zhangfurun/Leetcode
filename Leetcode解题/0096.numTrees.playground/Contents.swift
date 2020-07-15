import UIKit

func numTrees(_ n: Int) -> Int {
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }
 
//    var dp = Array(repeating: 0, count: n + 1)
//    dp[0] = 1
//    dp[1] = 1
    
//    for i in 2...n {
//        for j in 1...i {
//
//            print("j - 1: ",  dp[j - 1] , "i - j:", dp[i - j])
//            dp[i] += dp[j - 1] * dp[i - j]
//        }
//    }
//    print(dp)
//    return dp[n]
    
    var count = 1
    for i in 0..<n {
        count = count * 2 * (2 * i + 1) / (i + 2)
        print(i , count)
    }
    return count
    
}

let n = 3
print(numTrees(n))
