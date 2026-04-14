# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
    fast = slow = head

    while fast && fast.next
        slow = slow.next
        fast = fast.next.next
    end

    pre = nil
    current = slow
    while current
        next_node = current.next
        current.next = pre
        pre = current
        current = next_node
    end

    while pre
        return false if head.val != pre.val
        pre = pre.next
        head = head.next
    end

    return true
end
