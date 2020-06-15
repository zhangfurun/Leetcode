import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

let list_1_3 = ListNode.init(4)
let list_1_2 = ListNode.init(2, list_1_3)
let list_1_1 = ListNode.init(1, list_1_2)

let list_2_3 = ListNode.init(4)
let list_2_2 = ListNode.init(3, list_2_3)
let list_2_1 = ListNode.init(1, list_2_2)

func createListNode(array: [Int], tap: Int, preListNode: ListNode?) -> ListNode? {
    if tap < 0 {
        return preListNode;
    }
    
    let node = ListNode.init(array[tap], preListNode)
    
    return createListNode(array: array, tap: tap - 1, preListNode: node)
}

let array_1 = [1, 2, 4]
let node_1 = createListNode(array: array_1, tap: array_1.count - 1, preListNode: nil)
let array_2 = [1, 3, 4]
let node_2 = createListNode(array: array_2, tap: array_2.count - 1, preListNode: nil)


func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let l_1 = l1 else {
        return l2
    }
    
    guard let l_2 = l2 else {
        return l1
    }
    
    var node: ListNode?
    if l_1.val < l_2.val {
        node = ListNode.init(l_1.val, mergeTwoLists(l_1.next, l_2))
    } else {
        node = ListNode.init(l_2.val, mergeTwoLists(l_1, l_2.next))
    }
    return node
}


func printListNode(listNode: ListNode?) {
    guard let node = listNode else {
        print("node 为niel")
        return
    }
    
    var currentNode: ListNode? = node
    while (currentNode != nil) {
        print(currentNode?.val)
        currentNode = currentNode?.next
    }
}

let result = mergeTwoLists(node_1, node_2)

printListNode(listNode: result)
