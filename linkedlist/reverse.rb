def reverse_list(head)
    return head if head.nil? || head.next.nil?

    previous = nil
    current = head
    nxt = current.next

    while current
        current.next = previous
        previous = current
        current = nxt
        nxt = current&.next
    end
    previous
end
