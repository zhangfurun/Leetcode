import UIKit

func canJump(_ nums: [Int]) -> Bool {
    var dist = 0
    for (index, num) in nums.enumerated() {
        if index > dist {
            break
        }
        dist = max(dist, index + num)
    }
    
    return dist >= nums.count - 1
}


var arr = [3,2,1,1,4]

print(canJump(arr) ? "能" : "不能")
