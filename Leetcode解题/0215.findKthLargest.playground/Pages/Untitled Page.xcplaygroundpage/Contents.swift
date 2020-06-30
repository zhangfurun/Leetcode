import UIKit

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {

    var left_nums = [Int]()
    var right_nums = [Int]()
    
    let s = nums.first!
    
    for num in nums {
        if num < s {
            left_nums.append(num)
        } else {
            right_nums.append(num)
        }
    }
    
    print(left_nums, right_nums)
    
    if right_nums.count == k - 1 {
        return s
    } else if right_nums.count >= k {
        print("继续right")
        return findKthLargest(right_nums, k)
    } else {
        print("继续left")
        return findKthLargest(left_nums, k - right_nums.count - 1)
    }
}

let nums = [3,2,3,1,2,4,5,5,6]
let k = 4
print(findKthLargest(nums, k))
