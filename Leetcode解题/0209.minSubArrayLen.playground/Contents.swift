import UIKit


func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    if nums.count <= 1 {
        return nums.first == s ? 1 : 0
    }
    
    var index_left = 0
    var index_right = 0
    var length = -1
    
    var current_sum = nums[index_left]
    
    while index_right < nums.count {
     
        if nums[index_left] == s || nums[index_right] == s {
            return 1
        }
        
        
        var end = false
        while current_sum < s {
            index_right += 1
            if index_right >= nums.count {
                end = true
                break
            }
            current_sum += nums[index_right]
        }
        
        if end {
            break
        }
        
        
        while current_sum > s {
            if current_sum - nums[index_left] < s {
                break
            }
            
            let next_left = index_left + 1
            if next_left >= index_right  {
                break
            }
            
            current_sum -= nums[index_left]
            index_left = next_left
        }
        
        
        
        let sub_nums_length = index_right - index_left
        if length < 0 {
            length = sub_nums_length
        } else {
            length = min(length, sub_nums_length)
        }
        
        index_right += 1
        if index_right >= nums.count {
            break
        }
        current_sum += nums[index_right]
        
        if length == 0 {
            break
        }
    }
    return length + 1
}


let array = [1,2,3,4,5]
let target = 11

print(minSubArrayLen(target, array))
