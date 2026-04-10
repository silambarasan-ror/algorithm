def remove_nth_from_end(head, n)
    return [] if head.next.nil?

    fast = head

    n.times do
        fast = fast.next
    end
    return head.next unless fast

    slow = head
    while fast.next
        fast = fast.next
        slow = slow.next
    end
    slow.next = slow.next.next
    head
end
