import UIKit

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        let res:Array<TreeNode> = [TreeNode]()
        if n == 0{
            return res
        }
        return recursionForRes(start: 1, end: n)
        
    }
    
    private func recursionForRes(start:Int,end:Int) -> [TreeNode?]{
        var res:[TreeNode?] = [TreeNode]()
        if start > end {
            res.append(nil)
            return res
        }
        if start == end {
            let tmp:TreeNode = TreeNode.init(start)
            res.append(tmp)
            return res
        }
        for i in start...end {
            let leftTrees = recursionForRes(start: start, end: i - 1)
            let rightTrees = recursionForRes(start: i + 1, end: end)
            for tmpLeft:TreeNode? in leftTrees {
                for tmpRight:TreeNode? in rightTrees{
                    let root:TreeNode = TreeNode.init(i)
                    root.left = tmpLeft
                    root.right = tmpRight
                    res.append(root)
                }
            }
        }
        return res
    }

}
