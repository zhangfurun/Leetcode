import UIKit

var str = "Hello, playground"

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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

func createListNode(array: [Int], tap: Int, preListNode: ListNode?) -> ListNode? {
    if tap < 0 {
        return preListNode;
    }
    
    let node = ListNode.init(array[tap], preListNode)
    
    return createListNode(array: array, tap: tap - 1, preListNode: node)
}

let array_1 = [1, 2, 4,8,8,1, 9]
let node_1 = createListNode(array: array_1, tap: array_1.count - 1, preListNode: nil)
let array_2 = [1, 3, 4,4,6,8]
let node_2 = createListNode(array: array_2, tap: array_2.count - 1, preListNode: nil)

//func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//    var l1_value = 0
//    var l2_value = 0
//    var l1_next: ListNode?
//    var l2_next: ListNode?
//
//    if let l_1 = l1  {
//        l1_value = l_1.val
//        l1_next = l_1.next
//    }
//
//    if let l_2 = l2 {
//        l2_value = l_2.val
//        l2_next = l_2.next
//    }
//
//    var currentCodeValue = l1_value + l2_value
//    var nextNode: ListNode?
//
//    if currentCodeValue >= 10 {
//        currentCodeValue -= 10
//        if let l_1_next = l1_next {
//            l_1_next.val += 1
//            nextNode = addTwoNumbers(l_1_next, l2_next)
//        } else if let l_2_next = l2_next {
//            l_2_next.val += 1
//            nextNode = addTwoNumbers(l1_next, l_2_next)
//        } else {
//            nextNode = ListNode.init(1)
//        }
//    } else {
//        if l1_next != nil || l2_next != nil {
//            nextNode = addTwoNumbers(l1_next, l2_next)
//        }
//    }
//
//    return ListNode.init(currentCodeValue, nextNode)
//}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var result: ListNode?
    
    if l1 != nil || l2 != nil {
        
        var node_1 = l1
        var node_2 = l2
        
        var sum = (node_1?.val ?? 0) + (node_2?.val ?? 0)
        if sum >= 10 {
            sum -= 10;
            node_1 = node_1?.next ?? ListNode.init(0)
            node_1?.val += 1
        } else {
            node_1 = node_1?.next
        }
        
        node_2 = node_2?.next
        
        result = ListNode.init(sum, addTwoNumbers(node_1, node_2))
    }
    
    return result
    
}


let result = addTwoNumbers(node_1, node_2)

printListNode(listNode: result)
