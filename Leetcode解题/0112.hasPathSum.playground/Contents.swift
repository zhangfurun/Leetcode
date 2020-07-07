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

var count = 20

func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    guard let node = root else {
        return false
    }
    
    let nodeValue = node.val
    if node.left == nil && node.right == nil {
        return sum == nodeValue
    } else {
        let residueValue = sum - nodeValue
        return (hasPathSum(node.left, residueValue) || hasPathSum(node.right, residueValue))
    }
}

let left_7 = TreeNode.init(7)
let left_11 = TreeNode.init(11)
let left_4 = TreeNode.init(4)
let left_13 = TreeNode.init(7)
let right_8 = TreeNode.init(8)
let right_2 = TreeNode.init(2)
let right_4 = TreeNode.init(4)
let right_1 = TreeNode.init(1)

let base_5 = TreeNode.init(5)
base_5.left = left_4
base_5.right = right_8

left_4.left = left_11

right_8.left = left_13
right_8.right = right_4

left_11.left = left_7
left_11.right = right_2

right_4.right = right_1

//print(hasPathSum(base_5, 22))


let base_2 = TreeNode.init(-2)
base_2.right = TreeNode.init(-3)
//print(hasPathSum(base_2, -5))


let node_1 = TreeNode.init(1)
let node_fu2 = TreeNode.init(-2)
let node_fu3 = TreeNode.init(-3)
let node_child_1 = TreeNode.init(1)
let node_3 = TreeNode.init(3)
let node_child_fu2 = TreeNode.init(-2)
let node_fu1 = TreeNode.init(-1)

node_child_1.left = node_fu1

node_fu2.left = node_child_1
node_fu2.right = node_3

node_fu3.left = node_child_fu2

node_1.left = node_fu2
node_1.right = node_fu3


print(hasPathSum(node_1, -1))

