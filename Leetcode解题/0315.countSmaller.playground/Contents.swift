import UIKit
//
//func countSmaller(_ nums: [Int]) -> [Int] {
//    var results = Array(repeating: 0, count: nums.count)
//    if nums.count > 1 {
//
//        for (index, num) in nums.enumerated() {
//            if index == nums.count - 1 {
//                continue
//            }
//            for rightNum in nums[(index + 1)..<nums.count] {
//                if num > rightNum {
//                    results[index] += 1
//                }
//            }
//        }
//    }
//
//    return results
//}

let array = [5,2,6,1]

//func countSmaller(_ nums: [Int]) -> [Int] {
//    var result = Array(repeating: 0, count: nums.count)
//    if nums.count > 1 {
//
//
//        var barrelDic = [Int:Int]()
//        for num in nums {
//            barrelDic[num] = 0
//        }
//
//        let barrel = barrelDic.keys.sorted()
//
//        for (index, num) in nums.reversed().enumerated() {
//
//            let reversed_index = nums.count - 1 - index
//
//            barrelDic[num] = barrelDic[num]! + 1
//
//            var barrel_index = 0
//            while true {
//                let barrel_num = barrel[barrel_index]
//                if num == barrel_num {
//                    break
//                }
//                result[reversed_index] += barrelDic[barrel_num]!
//
//                barrel_index += 1
//            }
//
//            print(result)
//        }
//    }
//
//    return result
//}











var table = Array(repeating: 0, count: array.count)

func countSmaller(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    for num in nums.reversed() {
        result.append(findAndInsert(num))
    }
    result.reverse()
    return result
}

func findAndInsert(_ val: Int) -> Int {
    var left = 0, right = table.count - 1
    while right - left > 1 {
        let mid = (left + right)
        if val < table[mid] {
            right = mid
        } else {
            left = mid
        }
    }
    table.insert(val, at: right)
    return right
}


let result = countSmaller(array)

print("result: \(result)")
