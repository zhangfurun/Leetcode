import UIKit

//func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
//    var result = nums[0] + nums[1] + nums[2]
//
//    for index_0 in 0..<(nums.count - 2) {
//        let num_0 = nums[index_0]
//        for index_1 in (index_0 + 1)..<(nums.count - 1) {
//            let num_1 = nums[index_1]
//            for index_2 in (index_1 + 1)..<(nums.count - 0) {
//                let nums_2 = nums[index_2]
//
//                let cur_num = num_0 + num_1 + nums_2
//
////                print(nums[index_0], nums[index_1], nums[index_2],  cur_num)
////                print("cur_num: \(cur_num)  reulst: \(result)")
//                if cur_num == target {
//                    return cur_num
//                }
//                if abs(cur_num - target) < abs(result - target) {
//                    result = cur_num
//                }
//                
//            }
//        }
//    }
//
//
//    print("result: \(result)")
//    return result
//}

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let num_sort = nums.sorted()
    
    var result = num_sort[0] + num_sort[1] + num_sort[2]
    
    var end = false
    
    for index_0 in 0..<(num_sort.count - 2) {
        
        var index_left = index_0 + 1
        var index_right = nums.count - 1
        
        while index_left < index_right {
            let sum = num_sort[index_0] + num_sort[index_left] + num_sort[index_right]
            
            print(num_sort[index_0], num_sort[index_left], num_sort[index_right], " ===> ", sum, result)
            if abs(target - sum) < abs(target - result) {
                result = sum
            }
            
            if sum > target {
                index_right -= 1
            } else if sum < target {
                index_left += 1
            } else {
                end = true
                break
            }
            
            print(index_0, index_left, index_right)
        }
        if end {
            break
        }
    }
    
    print("result: \(result)")
    return result
}


//let nums = [-1, 2, 1, -4]
let nums = [0,2,1,-3]

let target = 1

threeSumClosest(nums, target)

