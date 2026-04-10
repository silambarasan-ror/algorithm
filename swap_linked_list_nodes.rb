def swap_nodes(head, k)
    return head if head.nil? || k< 1

    fast = head
    slow = head
    
    (k-1).times do 
        fast = fast.next
    end
    temp = fast
    
    while fast.next
        fast = fast.next
        slow = slow.next
    end

    temp.val, slow.val = slow.val, temp.val
    head
end
