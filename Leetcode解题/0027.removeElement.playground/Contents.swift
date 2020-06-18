import UIKit

 func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count < 1 {
            return 0
        }
        
        if nums.count <= 1 {
            return nums.first == val ? 0 : 1
        }
        
        var allow_index = 0
        
        for index in 0..<nums.count {
            if nums[index] != val {
                nums[allow_index] = nums[index]
                allow_index += 1
            }
        }
        
        return allow_index
    }
    
//    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//        if nums.count < 1 {
//            return 0
//        }
//
//        if nums.count == 1 {
//            return nums[0] == val ? 0 : 1
//        }
//
//        var start_index = 0
//        var end_index = nums.count - 1
//
//        while start_index <= end_index {
//            print("start === start: \(start_index)  end: \(end_index)  nums:\(nums)")
//            let start_num = nums[start_index]
//            let end_num = nums[end_index]
//
//            if start_num == val {
//                if end_num != val {
//                    nums[start_index] = nums[end_index]
//                    start_index += 1
//                    print("  start ->")
//                }
//                end_index -= 1
//                print("  end <-")
//            } else {
//                start_index += 1
//                print("  start ->")
//            }
//
//            print("end   === start: \(start_index)  end: \(end_index)  nums:\(nums)")
//            print("\n")
////            print(nums)
//        }
//
//
//        return start_index
//    }

var array: [Int] = [1,1,1,1,2]

print(removeElement(&array, 2))
