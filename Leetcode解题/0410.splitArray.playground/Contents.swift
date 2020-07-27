import UIKit

func check(nums: [Int], numsSize: Int, m: Int, x: Int) -> Bool {
    var sum = 0
    var cnt = 1
    for i in 0..<numsSize {
        if sum + nums[i] > x {
            cnt += 1
            sum = nums[i]
        } else {
            sum += nums[i]
        }
    }
    let isBool = cnt <= m
    return isBool
}

func splitArray(_ nums: [Int], _ m: Int) -> Int {
    let numsSize = nums.count
    var left = 0, right = 0
    for i in 0..<numsSize {
        right += nums[i]
        if left < nums[i] {
            left = nums[i]
        }
    }
    
    while left < right {
        let mid = (left + right) >> 1
        let isCheck = check(nums: nums, numsSize: numsSize, m: m, x: mid)
        if isCheck {
            right = mid
        } else {
            left = mid + 1
        }
    }
    return left
}
