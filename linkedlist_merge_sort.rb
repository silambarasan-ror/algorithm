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
def sort_list(head)
    return head if head.nil? || head.next.nil?
    middle = get_middle(head)
    middle_next = middle.next
    middle.next = nil

    left = sort_list(head)
    right = sort_list(middle_next)

    merge(left, right)
end


def merge(left, right)
    return right if left.nil?
    return left if right.nil?

    if left.val < right.val
        result = left
        result.next = merge(left.next, right)
    else
        result = right
        result.next = merge(right.next, left)
    end
    result
end

def get_middle(head)
    return head if head.next.nil?
    slow = head
    fast = head.next
    while fast && fast.next
        slow = slow&.next
        fast = fast&.next&.next
    end
    slow
end
