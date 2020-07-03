import UIKit

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }


func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let offset_count = n - 1

    var nodeDic: [Int : ListNode] = [:]
    var index = 0
    var cur_node = head
    
    
    while cur_node != nil {
        nodeDic[index] = cur_node
        
        cur_node = cur_node?.next
        
        if let _ = cur_node {
            index += 1
        }
    }
    print("index:\(index)")
    
    if index < offset_count {
        print("超出")
        return head
    }
    
    if index == offset_count {
        print("删除第一个")
        return head?.next
    }
    
    print("index - n : \(index - n)")
    let target_index = index - offset_count
    let target_node = nodeDic[target_index]
    let pre_node = nodeDic[target_index - 1]
    pre_node?.next = target_node?.next
    
    return head
}


func createListNode(array: [Int], tap: Int, preListNode: ListNode?) -> ListNode? {
    if tap < 0 {
        return preListNode;
    }
    
    let node = ListNode.init(array[tap])
    node.next = preListNode
    
    return createListNode(array: array, tap: tap - 1, preListNode: node)
}

func printListNode(listNode: ListNode?) {
    guard let node = listNode else {
        print("node 为nil")
        return
    }
    
    var currentNode: ListNode? = node
    while (currentNode != nil) {
        print(currentNode!.val)
        currentNode = currentNode?.next
    }
}

let array = [1]

let node = createListNode(array: array, tap: array.count - 1, preListNode: nil)

let n = 1
let del_node = removeNthFromEnd(node, n)

printListNode(listNode: del_node)
