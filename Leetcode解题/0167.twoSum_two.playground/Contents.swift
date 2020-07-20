import UIKit

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    if numbers.count < 2 {
        return []
    }
    
    if numbers.count == 2 {
        return numbers[0] + numbers[1] == target ? [1, 2] : []
    }
    
    var hashDic = [Int: Int]()
    let first_num = numbers[0]
    
    for (index, num) in numbers.enumerated() {
        if num > 0, first_num + num > target {
            break
        }
        let other = target - num
        if let other_index = hashDic[other], other_index != index {
            return [other_index + 1, index + 1]
        } else {
            hashDic[num] = index
        }
    }
    
    return []
}


let numbers = [2, 7, 11, 15], target = 9

print(twoSum(numbers, target))
