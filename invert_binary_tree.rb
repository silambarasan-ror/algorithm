def def invert_tree(root)
    invert_traversal(root)
    root
end

def invert_traversal(node)
    return node if node&.left.nil?  && node&.right.nil? 
    left = invert_traversal(node.left)
    right = invert_traversal(node.right)

    node.left = right
    node.right = left
    node
end(root)
    invert_traversal(root)
    root
end

def invert_traversal(node)
    return node if node&.left.nil?  && node&.right.nil? 
    left = invert_traversal(node.left)
    right = invert_traversal(node.right)

    node.left = right
    node.right = left
    node
end
