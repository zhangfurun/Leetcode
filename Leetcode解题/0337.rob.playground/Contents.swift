import UIKit

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
}

//func rob(_ root: TreeNode?) -> Int {
//    guard let node = root else {
//        return 0
//    }
//
//    var money = node.val
//
//    if let left = node.left {
//        money += (rob(left.left) + rob(left.right));
//    }
//
//    if let right = node.right {
//        money += (rob(right.left) + rob(right.right));
//    }
//
//    return max(money, rob(node.left) + rob(node.right));
//}



func rob(_ root: TreeNode?) -> Int {
    let result = test(root)
    return max(result[0], result[1])
}

func test(_ root: TreeNode?) -> [Int] {
   guard let node = root else {
    
        return [0, 0]   // [不偷, 偷]
    }
    
    let left_values = test(node.left)
    let right_values = test(node.right)
    
    var result = [0, 0]
    // 不偷
    result[0] = max(left_values[0], left_values[1]) + max(right_values[0], right_values[1])
    // 偷
    result[1] = node.val + left_values[0] + right_values[0]
    
    return result
}


//let node_0_3 = TreeNode.init(3)
//let node_1_2 = TreeNode.init(2)
//let node_1_3 = TreeNode.init(3)
//let node_2_3 = TreeNode.init(3)
//let node_2_1 = TreeNode.init(1)
//
//node_0_3.left = node_1_2
//node_0_3.right = node_1_3
//node_1_2.right = node_2_3
//node_1_3.right = node_2_1

let node = TreeNode.init(4)
node.left = TreeNode.init(1)
node.left?.left = TreeNode.init(2)
node.left?.left?.left = TreeNode.init(3)

print(rob(node))
