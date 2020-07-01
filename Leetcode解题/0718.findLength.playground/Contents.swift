import UIKit

//func findLength(_ A: [Int], _ B: [Int]) -> Int {
//    var fixCount = 0
//
//    for index_a in 0..<A.count {
//        if (A.count - index_a) < fixCount {
//            return fixCount
//        }
//
//        for index_b in 0..<B.count {
//            var next_count = 0
//            while A.count > (index_a + next_count), B.count > (index_b + next_count), A[index_a + next_count] == B[index_b + next_count] {
//                next_count += 1
//            }
//
//            fixCount = max(fixCount, next_count)
//        }
//    }
//
//    return fixCount
//}




func getMaxLength(_ A: [Int], _ B:[Int], index_a: Int, index_b: Int, leng: Int) -> Int {
    var maxL = 0
    
    var k = 0
    for i in 0..<leng {
        if A[index_a + i] == B[index_b + i] {
            k += 1
        } else {
            k = 0
        }
        maxL = max(maxL, k)
    }
    
    return maxL
}

func findLength(_ A: [Int], _ B: [Int]) -> Int {
    var maxLength = 0
    for i in 0..<A.count {
        let leng = min(A.count - i, B.count)
        if leng < maxLength {
            break
        }
        let max_le = getMaxLength(A, B, index_a: i, index_b: 0, leng: leng)
        
        maxLength = max(max_le, maxLength)
    }
    
    for i in 0..<B.count {
        let leng = min(B.count - i, A.count)
        if leng < maxLength {
            break
        }
        maxLength = max(maxLength, getMaxLength(A, B, index_a: 0, index_b: i, leng: leng))
    }
    
    return maxLength
}

let A = [0,0,0,0,1]

let B = [1,0,0,0,0]
print(findLength(A, B))
