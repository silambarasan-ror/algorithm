# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {TreeNode}
def reverse_odd_levels(root)
    tree_traversal(root.left, root.right, 1)
    root
end

def tree_traversal(left, right, level)
    return if left.nil? || right.nil?
    
    if level % 2 == 1
        left.val, right.val = right.val, left.val
    end
    tree_traversal(left.left, right.right, level + 1)
    tree_traversal(left.right, right.left, level + 1)
end
