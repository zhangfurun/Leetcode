import UIKit

//func divingBoard(_ shorter: Int, _ longer: Int, _ k: Int) -> [Int] {
//    if k <= 0 {
//        return []
//    }
//    if shorter == longer  {
//        return [shorter * k]
//    }
//    //    var conditions = [Int: Int]()
//    var conditions = [Int]()
//    let short_to_longth = longer - shorter
//
////    var last_num = -1
//
//    var length = shorter * k
//    conditions.append(length)
//
//    for _ in 1...k {
//        length += short_to_longth
//
////        if last_num == length {
////            continue
////        }
////        last_num = length
//        conditions.append(length)
//    }
//
//    return conditions
//}

// 下面是方法二  但是不知道为什么  他的消耗时间反而比方法一大  难道是 conditions = Array(repeating: 0, count: k + 1)
// 这一步骤上????


// 针对方法二优化
// 无论是双数组 还是单数组  都逃不掉insert

// 比较结果: append < += [] << insert
func divingBoard(_ shorter: Int, _ longer: Int, _ k: Int) -> [Int] {
    if k <= 0 {
        return []
    }
    if shorter == longer  {
        return [shorter * k]
    }
    
    var conditions = [Int]()
    var min_num = shorter * k
    var max_num = longer * k
    let short_to_longth = longer - shorter
    
    conditions.append(min_num)
    conditions.append(max_num)
    
    for index in 1...(k / 2) {
        min_num += short_to_longth
        conditions.insert(min_num, at: index)
        
        max_num -= short_to_longth
        if max_num == min_num {
            break
        }
        conditions.insert(max_num, at: index + 1)
    }
    
    
    return conditions
}


let shorter = 1, longer = 2, k = 3

print(divingBoard(shorter, longer, k))
