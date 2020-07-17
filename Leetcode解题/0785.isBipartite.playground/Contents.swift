import UIKit


//func isBipartite(_ graph: [[Int]]) -> Bool {
//    // graph : [[1,3], [0,2], [1,3], [0,2]]
//    // 可以看成 0 的相邻节点为1, 3
//    // 1 的相邻节点为0, 2
//    // 2 的相邻节点为1, 3
//    // 的无向图
//    let num = graph.count
//    // 相邻节点的颜色
//    // 0: 默认 1: 红色 2: 绿色
//    var visited = [Int](repeating: 0, count: num)
//    for i in 0..<num {
//        // 当前节点已经涂过色
//        if visited[i] != 0 {
//            continue
//        }
//        var queue = [Int]()
//        queue.append(i)
//        while !queue.isEmpty {
//            let cur = queue.removeFirst()
//            let curColor = visited[cur]
//            let neighborColor = curColor == 1 ? 2:1
//            for(_, neighbor) in graph[cur].enumerated() {
//                if visited[neighbor] == 0 {
//                    // 没涂色
//                    visited[neighbor] = neighborColor
//                    queue.append(neighbor)
//                } else if (visited[neighbor] != neighborColor) {
//                    // 当前节点和相邻的节点涂色相同
//                    return false
//                }
//            }
//        }
//    }
//    return true
//}


func isBipartite(_ graph: [[Int]]) -> Bool {
    let num = graph.count
    
    var visited = Array(repeating: 0, count: num)
    
    for i in 0..<num {
        if visited[i] != 0 {
            continue
        }
        
        
        var queue = [Int]()
        queue.append(i)
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            let cur_color = visited[cur]
            let neighbor_color = cur_color == 1 ? 2 : 1
            
            for neighbor in graph[cur] {
                if visited[neighbor] == 0 {
                    visited[neighbor] = neighbor_color
                    queue.append(neighbor)
                } else if visited[neighbor] != neighbor_color {
                    return false
                }
            }
        }
    }
    
    return true
}


//let a = [[1,3],[0,2],[1,3],[0,2]]
//print(isBipartite(a))



func searchInsert(_ nums: [Int], _ target: Int) -> Int {

//    for (index, num) in nums.enumerated() {
//        if num >= target {
//            return index
//        }
//    }
//
//    return nums.count
    if nums.count < 1 {
        return 0
    }
    
    let first = nums[0]
    if first >= target {
        return 0
    }
    let last = nums[nums.count - 1]
    if last < target {
        return nums.count
    }
   
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let center = left + (right - left) / 2
        let cen_num = nums[center]
        if cen_num == target {
            return center
        } else if cen_num  < target {
            left = center + 1
        } else  {
            right = center - 1
        }
    }
    
    return left
}




//let array = [1,3,5,6]
//let tar = 7

let array = [1,3,5,6]
let tar = 2

print(searchInsert(array, tar))


