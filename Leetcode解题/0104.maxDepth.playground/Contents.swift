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

func maxDepth(_ root: TreeNode?) -> Int {
    return getMaxDepth(root, depthCount: 1)
}

func getMaxDepth(_ root: TreeNode?, depthCount: Int) -> Int {
    guard let node = root else {
        return depthCount - 1
    }

    let depth = depthCount

    return max(getMaxDepth(node.left, depthCount: (depth + 1)),
               getMaxDepth(node.right, depthCount: (depth + 1)))
}
 
let node_3 = TreeNode.init(3)
let node_9 = TreeNode.init(9)
let node_20 = TreeNode.init(20)
let node_15 = TreeNode.init(15)
let node_7 = TreeNode.init(7)

node_3.left = node_9
node_3.right = node_20

node_20.left = node_15
node_20.right = node_7

print(maxDepth(node_3))
