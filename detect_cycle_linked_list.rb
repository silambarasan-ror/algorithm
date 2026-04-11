# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
    return false unless head&.next
    slow = fast = head
    while fast&.next&.next
        slow = slow.next
        fast = fast.next.next
        return true if slow == fast
    end
    return false
end
