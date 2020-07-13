import UIKit

//func maxSubArray(_ nums: [Int]) -> Int {
//    if nums.count <= 1 {
//        return nums.first ?? 0
//    }
//
//    var maxSubNum = nums.first!
//
//    for right in 0..<nums.count {
//        if right <= 0 {
//            continue
//        }
//        var left = right
//
//        var count = 0
//        while left >= 0 {
//            count += nums[left]
//            maxSubNum = max(maxSubNum, count)
//            left -= 1
//        }
//    }
//
//    return maxSubNum
//}

func maxSubArray(_ nums: [Int]) -> Int {
   var dp = Array(repeating: 0, count: nums.count)
    dp[0] = nums[0]
    var result = nums[0]
    
    for i in 1..<nums.count {
        dp[i] = max(dp[i - 1] + nums[i], nums[i])
        result = max(result, dp[i])
    }
    return result
}

let array = [-2,1,-3,4,-1,2,1,-5,4]

print("结果: ",maxSubArray(array))
