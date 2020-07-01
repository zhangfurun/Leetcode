import UIKit

func firstMissingPositive(_ nums: [Int]) -> Int {
    let sort_num = nums.sorted()
    var target = 1
    for num in sort_num {
        if num > 0 {
            if num == target {
                target += 1
            } else if num < target {
                
            } else {
                break
            }
        }
    }
    
    return target
}

let array = [0, 2, 2, 1, 1]
print(firstMissingPositive(array))
