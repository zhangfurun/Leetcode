import UIKit


// Definition for a binary tree node.
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
 
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        return currentMinDepth(root, 0)
    }
    
    func currentMinDepth(_ root: TreeNode?, _ depth: Int) -> Int {
        guard let node = root else {
            return depth
        }
         
        let dep = depth + 1
        
        let left = node.left
        let right = node.right
        
        if left == nil && right == nil {
            return dep
        }
        
        var leftCount = dep
        var rightCount = dep
        
        if let left = node.left {
            leftCount = currentMinDepth(left, dep)
        }
        
        if let right = node.right {
            rightCount = currentMinDepth(right, dep)
        }
     return min(leftCount, rightCount)
    }
}
