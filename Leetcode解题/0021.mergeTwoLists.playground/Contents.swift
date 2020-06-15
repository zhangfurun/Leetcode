import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    
    if l2 == nil {
        return l1
    }
    
    if l1!.val <= l2!.val {
        l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    } else {
        l2?.next = mergeTwoLists(l1, l2?.next)
        return l2
    }
}

let l11 = ListNode.init(1)
let l12 = ListNode.init(2)
let l13 = ListNode.init(4)

l11.next = l12
l12.next = l13

let l21 = ListNode.init(1)
let l22 = ListNode.init(3)
let l23 = ListNode.init(4)

l21.next = l22
l22.next = l23



func test(model: ListNode?) {
    if let mo = model {
        print(mo.val)
        test(model: mo.next)
    } else {
        return
    }
}

test(model: mergeTwoLists(l11, l21))
