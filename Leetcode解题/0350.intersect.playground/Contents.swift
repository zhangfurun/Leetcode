import UIKit

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    if nums1.count == 0 || nums2.count == 0 {
        return []
    }
    
    var intersectArray = [Int]()
    var numDic = [Int: Int]()
    
    for num_1 in nums1 {
        if let record_num = numDic[num_1] {
            numDic[num_1] = record_num + 1
        } else {
            numDic[num_1] = 1
        }
    }
    
    print(numDic)
    
    for num_2 in nums2 {
        if var record_num = numDic[num_2] {
            record_num -= 1
            numDic[num_2] = record_num
            
            intersectArray.append(num_2)
            
            if record_num == 0 {
                numDic.removeValue(forKey: num_2)
            }
        }
    }
    
    return intersectArray
}




let array_1 = [4,9,5]
let array_2 = [9,4,9,8,4]

print(intersect(array_1, array_2))
