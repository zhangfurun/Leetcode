import UIKit

func findMagicIndex(_ nums: [Int]) -> Int {
//    let count = nums.count
//   let center = 0 + (count - 0) / 2
//
//    if nums[center] > center {
//        return findMagicIndex(nums[0...center - 1])
//    } else if nums[center] < center {
//        return findMagicIndex(nums[0...center - 1])
//    } else {
//        return center
//    }
//
//    return - 1
    return findMagicIndex(nums, left: 0, right: nums.count - 1)
}

func findMagicIndex(_ nums: [Int], left: Int, right: Int) -> Int {
    if <#condition#> {
        <#code#>
    }
    let count = nums.count
   let center = left + (right - left) / 2
    
    if nums[center] > center {
        return findMagicIndex(nums[0...center - 1])
    } else if nums[center] < center {
        return findMagicIndex(nums[0...center - 1])
    } else {
        return center
    }
    
    return - 1
}
