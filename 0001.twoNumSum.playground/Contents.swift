import UIKit

var str = "Hello, playground"

//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var dic: [Int: Int] = [:]
//    for (index, num) in nums.enumerated() {
//        let remainder = target - num
//        if (dic.keys.contains(remainder)) {
//            if let remainderIndex = dic[remainder], remainderIndex != index {
//                return [remainderIndex, index]
//            }
//        }
//        dic[num] = index
//    }
//    return []
//}

// 两边循环
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    for (currentIndex, currentNum) in nums.enumerated() {
//        for remainderIndex in currentIndex ..< nums.count {
//            if ((currentNum + nums[remainderIndex]) == target) && (currentIndex != remainderIndex) {
//                return [currentIndex, remainderIndex]
//            }
//        }
//    }
//    return []
//}

/// 数组contains
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    for (currentIndex, currentNum) in nums.enumerated() {
//        let remainderNum = target - currentNum
//        if let remainderIndex = nums.firstIndex(of: remainderNum) {
//            if (remainderIndex != currentIndex) {
//                return [currentIndex, remainderIndex]
//            }
//        }
//    }
//    return []
//}

// 两边哈希
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var dic = [Int: Int]()
//    for (index, num) in nums.enumerated() {
//        dic[num] = index
//    }
//
//    for (index, num) in nums.enumerated() {
//        let remainderNum = target - num
//        if dic.keys.contains(remainderNum) && dic[remainderNum] != index {
//            return [dic[remainderNum]!, index]
//        }
//    }
//    return []
//}

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let numbers = nums.sorted()
    
    var left = 0
    var right = numbers.count - 1
    
    var result: [Int] = []
    
    while left < right {
        let leftNum = numbers[left]
        let rightNum = numbers[right]
        
        let sum = leftNum + rightNum
        if sum == target {
            result = [nums.firstIndex(of: leftNum)! , nums.lastIndex(of: rightNum)!];
            break;
        } else if sum > target {
            right -= 1
        } else if sum < target {
            left += 1
        }
    }
    return result
}



let nums = [15,2,7,11]
let target = 9

twoSum(nums, target)
