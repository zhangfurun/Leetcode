import UIKit

func minArray(_ numbers: [Int]) -> Int {
    if numbers.count == 0 {
        return 0
    }
    
    if numbers.count == 1 {
        return numbers[0]
    }
    
    let first = numbers[0]
    let last = numbers[numbers.count - 1]
    if last <= first {
        var min = last
        for num in numbers[0...(numbers.count - 2)].reversed() {
            if num > min {
                return min
            }
            min = num
        }
    }
    return first
}

let nums = [3,4,5,1,2]

print(minArray(nums))
