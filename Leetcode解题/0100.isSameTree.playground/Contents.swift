import UIKit


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil, q == nil {
        return true
    }
    
    guard let nodeP = p, let nodeQ = q else {
        return false
    }
    
    var isSame = false
    if nodeP.val == nodeQ.val {
       isSame = isSameTree(nodeP.left, nodeQ.left) && isSameTree(nodeP.right, nodeQ.right)
    }
    return isSame
}
