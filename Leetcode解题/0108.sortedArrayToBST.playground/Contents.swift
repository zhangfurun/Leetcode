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

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return sortArrayToBST(nums, left: 0, right: nums.count - 1)
}

func sortArrayToBST(_ nums: [Int], left: Int , right: Int) -> TreeNode? {
    if (left > right) {
        return nil
    }
    
//    let mid = left + ((right - left) >> 1)
    let mid = (left + right) / 2
    
    let node = TreeNode.init(nums[mid])
    node.left = sortArrayToBST(nums, left: left, right: mid - 1)
    node.right = sortArrayToBST(nums, left: mid + 1, right: right)
    return node
}

let nums = [-10,-3,0,5,9]
if let node = sortedArrayToBST(nums) {
    print(node)
} else {
    print("无")
}
