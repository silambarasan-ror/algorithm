# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
    return head if head.nil? || head.next.nil?

    dummy = ListNode.new(0, head)
    previous = dummy

    while previous.next && previous.next.next
        first = previous.next
        second = first.next

        first.next = second.next
        second.next = first
        previous.next = second

        previous = first
    end

    dummy.next
end
