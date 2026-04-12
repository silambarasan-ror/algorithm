def prune_tree(root)
  return nil if root.nil?

  # 1. Recursively prune the left and right subtrees first
  root.left = prune_tree(root.left)
  root.right = prune_tree(root.right)

  # 2. After pruning children, check if this node itself should be pruned
  # We prune this node if:
  # - It is now a leaf (both children are nil)
  # - Its value is 0
  if root.val == 0 && root.left.nil? && root.right.nil?
    return nil
  end

  # 3. Otherwise, return the node as part of the pruned tree
  root
end
