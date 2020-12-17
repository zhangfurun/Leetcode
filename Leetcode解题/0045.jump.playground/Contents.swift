import UIKit

func jump(_ nums: [Int]) -> (Int, Bool) {
    var dist = 0
    var step = 0
    var end = 0
    let count = nums.count
    for (index, num) in nums[0..<count-1].enumerated() {
        
        dist = max(dist, index + num)
        
        if index == end {
            print(index, end)
            step += 1
            end = dist
        }
    }
    
    return (step, dist >= count)
}


//var arr = [2, 3, 0, 1, 4, 1, 1, 1, 0]
var arr = [2,3,2,1,0, 1, 0]

print("最小步数\(jump(arr))步骤")
