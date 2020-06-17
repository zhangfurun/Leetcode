import UIKit

var str = "Hello, playground"


func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count <= 1 {
        return nums.count
    }
    var start_index = 0
    
    for cur_index in (start_index + 1)...(nums.count - 1) {
        if nums[cur_index] != nums[start_index] {
            start_index += 1
            nums[start_index] = nums[cur_index]
        }
        print(nums)
    }
    
    return start_index + 1
}

var array: [Int] = [0,0]

print(removeDuplicates(&array))
