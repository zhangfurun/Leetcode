import UIKit

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var index_start = 0
    var index_end = nums.count - 1
    
    if nums[index_end] < target {
        return nums.count
    }
    
    
    while index_start <= index_end {
        let index_mid = Int((index_start + index_end) / 2)
        
        let num_mid = nums[index_mid]
        
        if num_mid == target {
            return index_mid
        } else if target < num_mid  {
            index_end = index_mid - 1
        } else {
            index_start = index_mid + 1
        }
    }
    return index_start
}

let array = [1,3,5,6]
let num = 2


let index = searchInsert(array, num)
print(index)


//let array = [1, 3, 2, 5, 7, 7, 9]
//
//func getK(nums: [Int]) -> [Int] {
//
//    var k_array: [Int] = []
//    for (index, num) in nums[1..<(nums.count-1)].enumerated() {
//        let l_nums = nums[0...(index - 1)]
//        let r_nums = nums[(index + 1)...(nums.count - 1)]
//
//        print("l_nums : \(l_nums) r_nums:\(r_nums) ")
//
//        var l_max = -1
//        for l_num in l_nums {
//            if l_num > l_max {
//                l_max = l_num
//            }
//        }
//
//        var r_max = -1
//        for r_num in r_nums {
//            if r_num > r_max {
//                r_max = r_num
//            }
//        }
//
//        if num > l_max && num < r_max {
//            k_array.append(num)
//        }
//    }
//    return k_array
//}


